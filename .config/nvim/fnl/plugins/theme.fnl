[
 {1 :rebelot/kanagawa.nvim

 :priority 1000
 :config (fn [_ opts]
           ((. (require :kanagawa) :setup) opts)
           (vim.cmd "colorscheme kanagawa")
           (vim.cmd "highlight Normal cterm=NONE guibg=NONE")
           nil)
 :opts {
 :colors {:theme {:all {:ui {:bg_gutter "none"}}}}
 :overrides (fn [colors]
              (local theme colors.theme)

              {
              :WinSeparator {:link "LineNr"}

              :Pmenu {:fg theme.ui.shade0 :bg theme.ui.bg :blend vim.o.pumblend}
              :PmenuExtra {:fg theme.syn.comment :bg theme.ui.bg}
              :PmenuSel {:fg "none" :bg theme.ui.bg_p2}
              :PmenuSbar {:bg theme.ui.bg_m1}
              :PmenuThumb {:bg theme.ui.bg_p2}

              :NormalFloat {:bg "none"}
              :FloatBorder {:bg "none"}
              :FloatTitle {:bg "none"}
              }
              )
 }
 }
 ]
