[
 {1 :neovim/nvim-lspconfig

 :event ["BufReadPost" "BufNewFile"]
 :dependencies [
                "saghen/blink.cmp"
                {1 :williamboman/mason.nvim
                :opts {}
                }
                "williamboman/mason-lspconfig.nvim"
                {1 :j-hui/fidget.nvim
                :opts {}
                }
                ]
 :config (fn []
           (local capabilities ((. (require "blink.cmp") :get_lsp_capabilities)))

           ((. (require :mason-lspconfig) :setup) {
                                                  :ensure_installed []
                                                  :automatic_installation true
                                                  :handlers [(fn [server_name] 
                                                               ((. (. (require :lspconfig) server_name) :setup) {:capabilities capabilities})
                                                               nil)]
                                                  })
           nil
           )
 }
 ]
