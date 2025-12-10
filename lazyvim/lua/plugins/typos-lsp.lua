require("lspconfig").typos_lsp.setup({
	-- typos-lsp must be on your PATH, or otherwise change this to an absolute path to typos-lsp
	-- defaults to typos-lsp if unspecified
	cmd = { "typos-lsp" },
	-- Logging level of the language server. Logs appear in :LspLog. Defaults to error.
	cmd_env = { RUST_LOG = "error" },
	init_options = {
		-- Custom config. Used together with a config file found in the workspace or its parents,
		-- taking precedence for settings declared in both.
		-- Equivalent to the typos `--config` cli argument.
		config = "~/.dotfiles/typos/typos.toml",
		-- How typos are rendered in the editor, can be one of an Error, Warning, Info or Hint.
		-- Defaults to Info.
		diagnosticSeverity = "Info",
	},
})
