[
 {1 :neovim/nvim-lspconfig

 :event ["BufReadPost" "BufNewFile"]
 :dependencies [
                {1 :williamboman/mason.nvim
                :opts {}
                }
                "williamboman/mason-lspconfig.nvim"
                {1 :j-hui/fidget.nvim
                :opts {}
                }
                ]
 :config (fn []
           (vim.diagnostic.config {:virtual_text true})
           (local capabilities (vim.lsp.protocol.make_client_capabilities))
           ((. (require :mason) :setup))
           ((. (require :mason-lspconfig) :setup) {
                                                  :handlers [
                                                             (fn [server_name]
                                                               (if (~= server_name :jdtls) (do
                                                                                             ((. (. (require :lspconfig) server_name) :setup) {:capabilities capabilities})
                                                                                             nil))
                                                               nil)
                                                             ]
                                                  })
           nil
           )
 }
 ]
