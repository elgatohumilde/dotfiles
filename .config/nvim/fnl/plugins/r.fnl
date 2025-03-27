[
 {
 1 :R-nvim/R.nvim

 ;:enabled false
 ;:lazy false
 :ft [ "r" "quarto" ]
 :config (fn []
           (local opts {
                  :hook {:on_filetype (fn []
                                         (vim.api.nvim_buf_set_keymap 0 "n" "<Enter>" "<Plug>RDSendLine" [])
                                         (vim.api.nvim_buf_set_keymap 0 "v" "<Enter>" "<Plug>RSendSelection" [])
                                         nil)}
                  :R_args ["--quiet" "--no-save"]
                  :min_editor_width 72
                  :rconsole_width 78
                  :objbr_mappings {:c "class" ["<localleader>gg"] "head({object}, n = 15)" :v (fn [] ((. (require :r.browser) :toggle_view)) nil)}
                  })
           (if (= vim.env.R_AUTO_START "true")
               (do
                 (set opts.auto_start "on startup")
                 (set opts.objbr_auto_start true)
                 nil)
               )
           ((. (require :r) :setup) opts)
           nil)
 }
 ]
