[
 {1 :saghen/blink.compat

 :lazy true
 :opts {}
 }
 {1 :saghen/blink.cmp

 :dependencies [
                :micangl/cmp-vimtex
                :R-nvim/cmp-r
                ]
 :event ["BufReadPost" "BufNewFile"]
 :version "*"
 :opts {
 :keymap {:preset "enter"}
 :appearance {:use_nvim_cmp_as_default true :nerd_font_variant "mono"}
 :sources {
 :default ["lsp" "path" "buffer" "vimtex" "cmp_r"]
 :per_filetype {:org ["orgmode"]}
 :providers {
 :vimtex {:name "vimtex" :module "blink.compat.source" :score_offset -3}
 :orgmode {:name "Orgmode" :module "orgmode.org.autocompletion.blink"}
 :cmp_r {:name "cmp_r" :module "blink.compat.source"}
 }}
 :signature {:enabled true :window {:border "single"}}
 :completion {:ghost_text {:enabled true} :documentation {:window {:border "single"} :auto_show true :auto_show_delay_ms 500 } :menu {:border "single" :draw {:columns [["label" "label_description"] ["kind_icon" "kind"]]}}}
 }
 :fuzzy {:implementation "rust"}
 :opts_extend ["sources.default"]
 }
 ]
