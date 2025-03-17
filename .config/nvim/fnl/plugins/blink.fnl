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
 :appearance {:use_nvim_cmp_as_default true :nerd_font_variant "mono"}
 :sources {
 :default ["lsp" "path" "buffer" "vimtex" "obsidian" "obsidian_new" "obsidian_tags"]
 :per_filetype {:markdown ["markview"]}
 :providers {
 :vimtex {:name "vimtex" :module "blink.compat.source" :score_offset -3}
 :obsidian {:name "obsidian" :module "blink.compat.source"}
 :obsidian_new {:name "obsidian_new" :module "blink.compat.source"}
 :obsidian_tags {:name "obsidian_tags" :module "blink.compat.source"}
 }}
 :signature {:enabled true :window {:border "single"}}
 :completion {:ghost_text {:enabled true} :documentation {:window {:border "single"} :auto_show true :auto_show_delay_ms 500 } :menu {:border "single" :draw {:columns [["label" "label_description"] ["kind_icon" "kind"]]}}}
 }
 :fuzzy {:implementation "rust"}
 :opts_extend ["sources.default"]
 }
 ]
