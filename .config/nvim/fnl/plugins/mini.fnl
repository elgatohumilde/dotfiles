[
 {1 :echasnovski/mini.nvim

 :event "VeryLazy"
 :config (fn []
           ((. (require :mini.ai) :setup) {:n_lines 500})
           ((. (require :mini.surround) :setup))
           ((. (require :mini.pairs) :setup))
           ((. (require :mini.icons) :setup))
           ((. (require :mini.diff) :setup))
           (let [statusline (require "mini.statusline")]
             (statusline.setup {:use_icons vim.g.have_nerd_font})
             (set statusline.section_location (fn [] "%2l:%2v"))
             )
           nil
           )}
 ]
