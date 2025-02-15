return{
{
  "chipsenkbeil/org-roam.nvim",
  dependencies = {
		{
	  'nvim-orgmode/orgmode',
	  event = 'VeryLazy',
	  ft = { 'org' },
	  config = function()
		-- Setup orgmode
		require('orgmode').setup({
		  org_agenda_files = '~/git/**/*',
		  org_default_notes_file = '~/git/refile.org',
		  org_todo_keywords = {'TODO(t)', 'NEXT(n)', '|', 'DONE(d)'},
		})
		-- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
		-- add ~org~ to ignore_install
		-- require('nvim-treesitter.configs').setup({
		--   ensure_installed = 'all',
		--   ignore_install = { 'org' },
		-- })
	  end,
	  },
  },
  config = function()
    require("org-roam").setup({
      directory = "~/git/Notes/roam/",
      -- optional
--      org_files = {
--        "~/another_org_dir",
--        "~/some/folder/*.org",
--        "~/a/single/org_file.org",
--      }
    })
  end
},
}
