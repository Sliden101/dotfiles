{
  config,
  pkgs,
  lib,
  ...
}:
{
  home-manager.users.sliden.programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      lua-language-server
      stylua
      ripgrep
    ];
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];
    extraLuaConfig =
      let
        plugins = with pkgs.vimPlugins; [
          LazyVim
          bufferline-nvim
          cmp-buffer
          cmp-nvim-lsp
          cmp-path

          dashboard-nvim
          dressing-nvim

          flash-nvim
          neo-tree-nvim
          nui-nvim

          nvim-cmp
          nvim-lint
          nvim-lspconfig
          nvim-notify
          nvim-spectre
          nvim-treesitter
          nvim-treesitter-context
          nvim-treesitter-textobjects
          nvim-ts-autotag
          nvim-ts-context-commentstring
          nvim-web-devicons

          persistence-nvim
          plenary-nvim

          telescope-fzf-native-nvim
          telescope-nvim
          todo-comments-nvim
          tokyonight-nvim
          trouble-nvim
          vim-illuminate
          vim-startuptime
          which-key-nvim

          {
            name = "LuaSnip";
            path = luasnip;
          }
          {
            name = "catppuccin";
            path = catppuccin-nvim;
          }
          {
            name = "mini.ai";
            path = mini-nvim;
          }
          {
            name = "mini.bufremove";
            path = mini-nvim;
          }
          {
            name = "mini.comment";
            path = mini-nvim;
          }
          {
            name = "mini.indentscope";
            path = mini-nvim;
          }
          {
            name = "mini.pairs";
            path = mini-nvim;
          }
          {
            name = "mini.surround";
            path = mini-nvim;
          }
        ];

        mkEntryFromDrv =
          drv:
          if lib.isDerivation drv then
            {
              name = "${lib.getName drv}";
              path = drv;
            }
          else
            drv;
        lazyPath = pkgs.linkFarm "lazy-plugin" (builtins.map mkEntryFromDrv plugins);

      in
      ''
        	require("lazy").setup({
        	    defaults = {
        		lazy = true,
        	    },
        	    dev = {
        		-- reuse files from pkgs.vimPlugins.*
        		path = "${lazyPath}",
        		patterns = {""},
        		-- fallback to download
        		fallback = true,
        	    },
        	    spec = {
        		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
        		-- The following configs are needed for fixing lazyvim on nix
        		-- force enable telescope-fzf-native.nvim
        		{ "nvim-telescope/telescope-fzf-native.nvim", enable = false},
        		-- disable mason.nvim, use programs.neovim.ExtraPackages 
        		{ "mason-org/mason-lspconfig.nvim", enabled = false},
        		{ "mason-org/mason.nvim", enabled = false},
        		-- import/overide with plugins
        		{ import = "plugins" },
        		{ "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = {} } },		
        	 },
        	})
      '';
  };

  home-manager.users.sliden.xdg.configFile."nvim/parser".source =
    let
      parsers = pkgs.symlinkJoin {
        name = "treesitter-parsers";
        paths =
          (pkgs.vimPlugins.nvim-treesitter.withPlugins (
            plugins: with plugins; [
              c
              lua
            ]
          )).dependencies;
      };
    in
    "${parsers}/parser";
  #home-manager.users.sliden.xdg.configFile."nvim/lua".source = ./lua;
  home-manager.users.sliden.home.packages = with pkgs; [
    #neovim
    #vimPlugins.nvim-cmp
    vimPlugins.LazyVim
  ];
}
