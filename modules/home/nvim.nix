{ ... }: {

  flake.homeModules.nvim = { pkgs, inputs, ... }: {

    imports = [
      inputs.nixvim.homeModules.nixvim
    ];

    programs.nixvim = {
      enable = true;

      defaultEditor = true;
      vimAlias = true;
      viAlias = true;

      globals.mapleader = " ";

      opts = {
        number = true;
        relativenumber = true;
        expandtab = true;
        shiftwidth = 2;
        tabstop = 2;
        termguicolors = true;
      };

      colorschemes.ayu.enable = true;

      plugins = {
        lualine.enable = true;
        telescope.enable = true;

        neo-tree = {
          enable = true;
          settings = {
            filesystem = {
              filtered_items = {
                visible = true;
                hide_dotgiles = false;
                hide_gitignored = false;
              };
            };
          };
        };

        treesitter.enable = true;

        web-devicons.enable = true;

        lsp = {
          enable = true;

          servers = {
            nil_ls.enable = true;
            lua_ls.enable = true;
            rust_analyzer = {
              enable = true;
              installRustc = true;
              installCargo = true;
            };
            ts_ls.enable = true;
            basedpyright.enable = true;
          };
        };

        cmp = {
          enable = true;
          autoEnableSources = true;
          settings.sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
        };

        conform-nvim = {
          enable = true;

          settings = {
            formatters_by_ft = {
              nix = [ "nixfmt" ];
              lua = [ "stylua" ];
              rust = [ "rustfmt" ];
              python = [ "ruff_format" ];
              javascript = [ "prettier" ];
              typescript = [ "prettier" ];
            };

            format_on_save = {
              lsp_fallback = true;
              timeout_ms = 500;
            };
          };
        };

        lint = {
          enable = true;
        };
      };

      keymaps = [
        {
          mode = "n";
          key = "<leader>ff";
          action = "<cmd>Telescope find_files<cr>";
          options.desc = "Find files";
        }
        {
          mode = "n";
          key = "<leader>fg";
          action = "<cmd>Telescope live_grep<cr>";
          options.desc = "Live grep";
        }
        {
          mode = "n";
          key = "<leader>cd";
          action = "<cmd>Neotree<cr>";
          options.desc = "Focus to Neotree";
        }
      ];

      extraPackages = with pkgs; [
        nil
        nixfmt

        lua-language-server
        stylua

        rust-analyzer
        rustfmt

        prettier
        typescript-language-server

        basedpyright
        ruff
      ];
    };
  };

}
