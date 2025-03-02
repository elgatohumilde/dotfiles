return {
  "rose-pine/neovim",
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'rose-pine'
    vim.cmd.hi 'Comment gui=none'
  end,
}
