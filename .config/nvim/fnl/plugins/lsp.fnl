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
           (vim.diagnostic.config {:virtual_text true})
           (var capabilities (vim.lsp.protocol.make_client_capabilities))
           (set capabilities (vim.tbl_deep_extend "force" capabilities ((. (require "blink.cmp") :get_lsp_capabilities))))
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
