(import-macros {: pack} :macros)

[
 (pack :neovim/nvim-lspconfig
       {
       :event ["BufReadPost" "BufNewFile"]
       :dependencies ["saghen/blink.cmp"
                      (pack :folke/lazydev.nvim {
                            :opts {:library [{:path "${3rd}/luv/library" :words ["vim%.uv"]}]}
                            })]
       :config (fn []
                 (local capabilities ((. (require "blink.cmp") :get_lsp_capabilities)))
                 ((. (. (require :lspconfig) :lua_ls) :setup) {:capabilities capabilities})
                 ((. (. (require :lspconfig) :hls) :setup) {:capabilities capabilities})
                 ((. (. (require :lspconfig) :texlab) :setup) {:capabilities capabilities})
                 ((. (. (require :lspconfig) :clangd) :setup) {:capabilities capabilities})
                 nil
                 )
       })
]
