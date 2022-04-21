-- nvim-orgmode
-- Load custom treesitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- treesitter configuration
require'nvim-treesitter.configs'.setup {
	-- if ts highlights are not enabled at all, or disabled bta `disable` prop, highlighting will fall back to the default vim syntax highlighting
	highlight = {
		enable = true,
		disable = {'org'}, -- remove this to use ts highlighter for some of the highlights (experiemental)
		additional_vim_regex_highlighting = {'org'}, --required since ts highlighter doesn't support all syntax features like conceal
		},
ensure_installed = {'org'},
	}

require('orgmode').setup({
org_agenda_files = {'~/Documents/org/*'},
org_default_notes_file = '~/Documents/org/nvimorg.org'
})
