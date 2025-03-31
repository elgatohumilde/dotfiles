[
 {1 :neovim/nvim-lspconfig

 :event ["BufReadPost" "BufNewFile"]
 :cmd [ "Mason" ]
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

           (local servers
                  {})

           (var capabilities (vim.lsp.protocol.make_client_capabilities))
           (set capabilities (vim.tbl_deep_extend "force" capabilities ((. (require "blink.cmp") :get_lsp_capabilities))))
           ((. (require :mason-lspconfig) :setup) {
                                                  :ensure_installed []
                                                  :automatic_installation true
                                                  :handlers [(fn [server_name] 
                                                               (local server (or (. servers server_name) {}))
                                                               (set server.capabilities (vim.tbl_deep_extend "force" {} capabilities (or server.capabilities {})))
                                                               ((. (. (require :lspconfig) server_name) :setup) server)
                                                               nil)]
                                                  })
           nil
           )
 }
 ]
