return {
  {
    'R-nvim/R.nvim',
    enabled = false,
    lazy = false,
    config = function()
      local opts = {
        hook = {
          on_filetype = function()
            vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
            vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
          end
        },
        R_args = {"--quiet", "--no-save"},
        min_editor_width = 72,
        rconsole_width = 78,
        objbr_mappings = {
          c = 'class',
          ['<localleader>gg'] = 'head({object}, n = 15)',
          v = function()
            require('r.browser').toggle_view()
          end
        },
      }
      if vim.env.R_AUTO_START == "true" then
        opts.auto_start = "on startup"
        opts.objbr_auto_start = true
      end
      require("r").setup(opts)
    end,
  },
  {
    "r-nvim/cmp-r",
    enabled = false,
  },
}
