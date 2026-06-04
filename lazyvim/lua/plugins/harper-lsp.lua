-- Harper is a grammar checker
-- This has started with all the defaults
-- from https://writewithharper.com/docs/integrations/neovim
return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			harper_ls = {
				settings = {
					userDictPath = "",
					workspaceDictPath = "",
					fileDictPath = "",
					linters = {
						SpellCheck = true,
						SpelledNumbers = false,
						AnA = true,
						SentenceCapitalization = true,
						UnclosedQuotes = true,
						WrongApostrophe = false,
						LongSentences = true,
						RepeatedWords = true,
						Spaces = true,
						CorrectNumberSuffix = true,
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
}
