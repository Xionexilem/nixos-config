{ self, inputs, ... } @ top:

let
  version = "5.109.1";
  exe_hash = "sha256-IE5Y3PDMlzgtTN+mfGPpaTLJnYgVLv2TuaLUinQ5hQI=";
  src_hash = "sha256-8MIkTa/4/j3iPyFB+bxk9kOJMxTz59S0W2LZf/iOJRU=";
in {
  perSystem = { pkgs, lib, ... }: {
    packages.myYandexMusic =
      let
        ymExe = pkgs.fetchurl {
          url = "https://music-desktop-application.s3.yandex.net/stable/Yandex_Music_x64_${version}.exe";
          hash = exe_hash;
        };

        src = pkgs.fetchFromGitHub {
          owner = "cucumber-sp";
          repo = "yandex-music-linux";
          rev = "6b059b558d13edf360e4dec8d1ff99d402b4f0bb";
          hash = src_hash;
        };

        config = let inherit (lib) optionalString; in ''
          ELECTRON_ARGS=""
          VIBE_ANIMATION_MAX_FPS=25
          TRAY_ENABLED=1
          ALWAYS_LEAVE_TO_TRAY=1
          DEV_TOOLS=0
          CUSTOM_TITLE_BAR=0
        '';
      in
      pkgs.stdenvNoCC.mkDerivation {
        pname = "yandex-music";
        inherit version;

        inherit src;

        nativeBuildInputs = with pkgs; [
          p7zip
          asar
          jq
          python3
          makeWrapper
        ];

        buildPhase = ''
          runHook preBuild
          bash "./repack.sh" -o "./app" "${ymExe}"
          runHook postBuild
        '';

        installPhase = ''
          runHook preInstall

          mkdir -p "$out/share/nodejs"
          mv app/yandex-music.asar "$out/share/nodejs"

          CONFIG_FILE="$out/share/yandex-music.conf"
          echo "$config" >> "$CONFIG_FILE"

          install -Dm755 "$src/templates/yandex-music.sh" "$out/bin/yandex-music"
          substituteInPlace "$out/bin/yandex-music"                                  \
            --replace-fail "%electron_path%" "${pkgs.electron}/bin/electron"              \
            --replace-fail "%asar_path%" "$out/share/nodejs/yandex-music.asar"

          wrapProgram "$out/bin/yandex-music"                                        \
            --set-default YANDEX_MUSIC_CONFIG "$CONFIG_FILE"

          install -Dm644 "./app/favicon.png" "$out/share/icons/hicolor/48x48/apps/yandex-music.png"
          install -Dm644 "./app/favicon.svg" "$out/share/icons/hicolor/scalable/apps/yandex-music.svg"

          install -Dm644 "$src/templates/desktop" "$out/share/applications/yandex-music.desktop"

          runHook postInstall
        '';

        meta = {
          description = "Personal recommendations, selections for any occasion and new music";
          homepage = "https://music.yandex.ru/";
          downloadPage = "https://music.yandex.ru/download/";
          changelog = "https://github.com/cucumber-sp/yandex-music-linux/releases/tag/v${version}";
          platforms = lib.platforms.linux;
        };
      };
  };
}
