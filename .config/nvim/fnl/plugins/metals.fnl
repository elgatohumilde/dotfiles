[
 {1 :scalameta/nvim-metals

 :dependencies ["nvim-lua/plenary.nvim" {1 "j-hui/fidget.nvim" :opts {}}]
 :ft [ "scala" "sbt" ]
 :opts (fn []
         (local metals_config ((. (require :metals) :bare_config)))

         (tset metals_config :settings
               {
               :showImplicitArguments true
               :excludedPackages [ "akka.actor.typed.javadsl" "com.github.swagger.akka.javadsl" ]
               })

         (tset metals_config :init_options {:statusBarProvider "off"})

         (var capabilities (vim.lsp.protocol.make_client_capabilities))
         (set capabilities (vim.tbl_deep_extend "force" capabilities ((. (require "blink.cmp") :get_lsp_capabilities))))
         (set (. capabilities :textDocument.completion.completionItem)
              {
              :documentationFormat [ "markdown" "plaintext" ]
              :snippetSupport true
              :preselectSupport true
              :insertReplaceSupport true
              :labelDetailsSupport true
              :commitCharactersSupport true
              :resolverSupport {:properties [
                                             "documentation"
                                             "detail"
                                             "additionalTextEdits"
                                             ]}
              })

         (tset metals_config :capabilities capabilities)

         (tset metals_config :on_attach (fn [client bufnr]
                                          ((. (require :metals) :setup_dap))
                                          nil))

         metals_config
         )
 :config (fn [self metals_config]
           (local nvim_metals_group (vim.api.nvim_create_augroup 
                                      "nvim-metals" {:clear true}))

           (vim.api.nvim_create_autocmd "FileType" {
                                        :pattern self.ft
                                        :callback (fn []
                                                    ((. (require :metals) :initialize_or_attach) metals_config)
                                                    nil)
                                        :group nvim_metals_group
                                        })

           nil)
 }
 ]
