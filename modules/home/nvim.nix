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
        fugitive.enable = true;
        noice.enable = true;

        neo-tree = {
          enable = true;
          settings = {
            filesystem = {
              follow_current_file.enabled = true;
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
          settings = {
            mapping = {
              "<C-Space>" = "cmp.mapping.complete()";
              "<C-e>" = "cmp.mapping.close()";
              "<CR>" = "cmp.mapping.confirm({ select = false })";

              "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
              "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            };
            sources = [
              { name = "nvim_lsp"; }
              { name = "path"; }
              { name = "buffer"; }
            ];
          };
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
        {
          mode = "n";
          key = "<leader>gs";
          action = "<cmd>Git status<cr>";
          options.desc = "Git status";
        }
        {
          mode = "n";
          key = "<leader>gc";
          action = "<cmd>Git commit -m ''";
          options.desc = "Git fast commit";
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
