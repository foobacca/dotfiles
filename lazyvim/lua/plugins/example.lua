if true then
	return {
		-- add gruvbox
		{ "frankier/neovim-colors-solarized-truecolor-only" },
		{ "ellisonleao/gruvbox.nvim" },

		-- add typos lsp plugin
		{ "tekumara/typos-lsp" },

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
					-- pyright = {},
					basedpyright = {},
					ruff_lsp = {},
					-- ty = {},
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
			"nvim-mini/mini.pairs",
			enabled = false,
		},
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			opts = {},
		},

		-- neo-tree config stuff to work with pymple
		{
			"nvim-neo-tree/neo-tree.nvim",
			opts = function(_, opts)
				local api = require("pymple.api")
				local config = require("pymple.config")

				local function on_move(args)
					api.update_imports(args.source, args.destination, config.user_config.update_imports)
				end

				local events = require("neo-tree.events")
				opts.event_handlers = opts.event_handlers or {}
				vim.list_extend(opts.event_handlers, {
					{ event = events.FILE_MOVED, handler = on_move },
					{ event = events.FILE_RENAMED, handler = on_move },
				})
			end,
		},

		{
			"stevearc/conform.nvim",
			optional = true,
			opts = {
				formatters_by_ft = {
					["htmldjango"] = { "djlint" },
					["html"] = { "djlint" },
					["python"] = { "ruff_format" },
				},
				formatters = {
					djlint = {
						args = { "--reformat", "-" },
					},
				},
			},
		},
	}
end
