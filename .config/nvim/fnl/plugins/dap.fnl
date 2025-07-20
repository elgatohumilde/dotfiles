[
 {1 :mfussenegger/nvim-dap

 :event ["BufReadPost" "BufNewFile"]
 :cmd ["DapInstall"]
 :dependencies [
                :rcarriga/nvim-dap-ui
                {1 :theHamsta/nvim-dap-virtual-text :opts {}}
                :nvim-neotest/nvim-nio
                {1 :jay-babu/mason-nvim-dap.nvim :dependencies ["williamboman/mason.nvim"] :opts {:handles {}}}
                ]
 :config (fn []
           (local dap (require :dap))

           ((. (require :dapui) :setup))

           (vim.api.nvim_set_hl 0 "DapStoppedHl" {:fg "#98BB6C" :bg "#2A2A2A" :bold true})
           (vim.api.nvim_set_hl 0 "DapStoppedLineHl" {:bg "#204028" :bold true})
           (vim.fn.sign_define "DapStopped" {:text "" :testhl "DapStoppedHl" :linehl "DapStoppedLineHl" :numhl ""})
           (vim.fn.sign_define "DapBreakpoint" {:text "" :texthl "DiagnosticSignError" :linehl "" :numhl ""})
           (vim.fn.sign_define "DapBreakpointCondition" {:text "" :texthl "DiagnosticSignWarn" :linehl "" :numhl ""})
           (vim.fn.sign_define "DapBreakpointRejected" {:text "" :texthl "DiagnosticSignError" :linehl "" :numhl ""})
           (vim.fn.sign_define "DapLogPoint" {:text "" :texthl "DiagnosticSignInfo" :linehl "" :numhl ""})

           (set dap.listeners.after.event_initialized.dapui_config (fn []
                                                                     ((. (require :dapui) :open) {})
                                                                     nil))
           (set dap.listeners.after.event_terminated.dapui_config (fn []
                                                                    ((. (require :dapui) :close) {})
                                                                    nil))
           (set dap.listeners.after.event_exited.dapui_config (fn []
                                                                ((. (require :dapui) :close) {})
                                                                nil))

           (set dap.adapters.codelldb {
                :type "executable"
                :command "/home/joaquin/.local/share/nvim/mason/packages/codelldb/codelldb"
                })

           (set dap.configurations.java [
                                         {
                                         :name "Debug Launch (2GB)"
                                         :type "java"
                                         :request "launch"
                                         :vmArgs (.. "" "-Xmx2g")
                                         }
                                         {
                                         :name "Debug Attach (8000)"
                                         :type "java"
                                         :request "attach"
                                         :hostName "127.0.0.1" :port 8000
                                         }
                                         {
                                         :name "Debug Attach (5005)"
                                         :type "java"
                                         :request "attach"
                                         :hostName "127.0.0.1"
                                         :port 5005
                                         }
                                         {
                                         :name "Custom Java Run Configuration"
                                         :type "java"
                                         :request "launch"
                                         :vmArgs (.. "" "-Xmx2g")
                                         }
                                         ])
           (set dap.configurations.cpp [
                                        {
                                        :name "Launch lldb (custom file)"
                                        :type "codelldb"
                                        :request "launch"
                                        :program (fn []
                                                   (vim.fn.input "Path to executable: " (.. (vim.fn.getcwd) "/") "file")
                                                   )
                                        :cwd "${workspaceFolder}"
                                        }
                                        ])

           (set dap.configurations.scala [
                                          {
                                          :type "scala"
                                          :request "launch"
                                          :name "RunOrTest"
                                          :metals {:runType "runOrTestFile"}
                                          }
                                          {
                                          :type "scala"
                                          :request "launch"
                                          :name "Test Target"
                                          :metals {:runType "testTarget"}
                                          }
                                          ])

           nil)
 }
 ]
