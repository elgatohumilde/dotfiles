return {
  "neanias/everforest-nvim",
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  -- Optional; default configuration will be used if setup isn't called.
  config = function()
	require("everforest").setup({
	  ---Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
	  ---Default is "medium".
	  background = "hard",
	})
	  end,
  init = function()
	vim.cmd.colorscheme 'everforest'
	vim.cmd.hi 'Comment gui=none'
  end,
}
