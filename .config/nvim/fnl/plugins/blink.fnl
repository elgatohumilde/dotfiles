[
 {1 :saghen/blink.compat

 :lazy true
 :opts {}
 }
 {1 :saghen/blink.cmp

 :dependencies [
                :micangl/cmp-vimtex
                ]
 :event ["BufReadPost" "BufNewFile"]
 :version "*"
 :opts {
 :keymap {:preset "enter"}
 :appearance {:use_nvim_cmp_as_default false :nerd_font_variant "mono"}
 :sources {
 :default ["lsp" "path" "buffer" "vimtex"]
 :per_filetype {:org ["orgmode"]}
 :providers {
 :vimtex {:name "vimtex" :module "blink.compat.source" :score_offset -3}
 :orgmode {:name "Orgmode" :module "orgmode.org.autocompletion.blink"}
 }}
 :signature {:enabled true :window {:border "single"}}
 :completion {:ghost_text {:enabled true} :documentation {:window {:border "single"} :auto_show true :auto_show_delay_ms 500 } :menu {:border "single" :draw {:columns [{1 "label" 2 "label_description" :gap 1} {1 "kind_icon" 2 "kind" :gap 1}]} :auto_show (fn [ctx] (~= ctx.mode "cmdline"))}}
 }
 :fuzzy {:implementation "rust"}
 :opts_extend ["sources.default"]
 :config (fn [_ opts]
           ((. (require :blink.cmp) :setup) opts)
           (vim.api.nvim_set_hl 0 "BlinkCmpMenuBorder" {:link "FloatBorder"})
           nil)
 }
 ]
