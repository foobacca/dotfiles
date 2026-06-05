-- Harper is a grammar checker
-- This has started with all the defaults
-- from https://writewithharper.com/docs/integrations/neovim
return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			harper_ls = {
				settings = {
					["harper-ls"] = {
						userDictPath = "",
						workspaceDictPath = "",
						fileDictPath = "",
						-- full list at https://writewithharper.com/docs/rules
						linters = {
							SpellCheck = false,
							SpelledNumbers = false,
							AnA = true,
							SentenceCapitalization = true,
							UnclosedQuotes = true,
							WrongApostrophe = false,
							LongSentences = true,
							RepeatedWords = true,
							Spaces = true,
							CorrectNumberSuffix = true,
							UseTitleCase = false,
							Dashes = false,
							NumericRangeEnDash = false,
							ExpandMemoryShorthands = false,
						},
						codeActions = {
							ForceStable = false,
						},
						markdown = {
							IgnoreLinkTitle = false,
						},
						diagnosticSeverity = "hint",
						isolateEnglish = false,
						dialect = "British",
						maxFileLength = 120000,
						ignoredLintsPath = "",
						excludePatterns = {},
					},
				},
			},
		},
	},
}
