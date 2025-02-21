if true then
	return {
		-- add gruvbox
		{ "frankier/neovim-colors-solarized-truecolor-only" },
		{ "ellisonleao/gruvbox.nvim" },

		-- Configure LazyVim to load gruvbox
		{
			"LazyVim/LazyVim",
			opts = {
				colorscheme = "tokyonight-moon",
			},
		},

		-- add pyright to lspconfig
		{
			"neovim/nvim-lspconfig",
			---@class PluginLspOpts
			opts = {
				---@type lspconfig.options
				servers = {
					-- pyright will be automatically installed with mason and loaded with lspconfig
					pyright = {},
				},
			},
		},

		-- add more treesitter parsers
		{
			"nvim-treesitter/nvim-treesitter",
			opts = {
				ensure_installed = {
					"bash",
					"html",
					"javascript",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"query",
					"regex",
					"vim",
					"yaml",
				},
			},
		},

    {
      "mfussenegger/nvim-lint",
      optional = true,
      opts = {
        linters = {
          ["markdownlint-cli2"] = {
            args = { "--config", vim.fn.expand("~/.markdownlint-cli2.yaml"), "--" },
          },
        },
      },
    },

		-- revert to standard `s` keybinding
		{
			"folke/flash.nvim",
			keys = {
				{ "s", false },
			},
		},

    -- note making plugin
    {
      "foobacca/foobacca-note",
    },

    -- disable minipairs and try nvim-autopairs instead
    {
      "echasnovski/mini.pairs",
      enabled = false,
    },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      opts = {},
    },
	}
end
