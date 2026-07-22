{ ... } @ args:
if args == {} then {
  sound = true;
  wmde = true;
  gpu = true;
  network = true;
  browser = true;
  security = true;
  nh = true;
  flatpak = true;
  virtualisation = true;
  games = true;
  dev = true;
  media = true;
  design = true;
  bluetooth = true;

  # home-only modules
  git = true;
  zsh = true;
  kitty = true;
  zoxide = true;
  yazi = true;
  wallpaperengine = false;
  lutris = true;
  retroarch = true;
  lazydocker = true;
  onlyoffice = true;
} else { }
