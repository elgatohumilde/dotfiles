[
 {1 :rcarriga/nvim-dap-ui

 :event ["BufReadPost" "BufNewFile"]
 :dependencies [
                "mfussenegger/nvim-dap"
                "nvim-neotest/nvim-nio"
                "theHamsta/nvim-dap-virtual-text"
                ]
 :opts {
 :controls {
 :element "repl"
 :enabled false
 :icons {
 :disconnect ""
 :pause ""
 :play ""
 :run_last ""
 :step_back ""
 :step_into ""
 :step_out ""
 :step_over ""
 :terminate ""
 }}
 :element_mappings []
 :expand_lines true
 :floating {:border "single" :mappings {:close ["q" "<Esc>"]}}
 :force_buffers true
 :icons {
 :collapsed ""
 :current_frame ""
 :expanded ""
 }
 :layouts [
           {
           :elements [
                      {:id "scopes" :size 0.50}
                      {:id "stacks" :size 0.30}
                      {:id "matches" :size 0.10}
                      {:id "breakpoints" :size 0.10}
                      ]
           :size 40
           :position "left"
           }
           {
           :elements ["repl" "console"]
           :size 10
           :position "bottom"
           }
           ]
 :mappings {
 :edit "e"
 :expand ["<CR>" "<2-LeftMouse>"]
 :open "o"
 :remove "d"
 :repl "r"
 :toggle "t"
 }
 :render {:indent 1 :max_value_lines 100}
 }
 :config (fn [_ opts]
           (local dap (require :dap))
           ((. (require :dapui) :setup) opts)

           (vim.api.nvim_set_hl 0 "DapStoppedHl" {:fg "#98BB6C" :bg "#2A2A2A" :bold true})
           (vim.api.nvim_set_hl 0 "DapStoppedLineHl" {:bg "#204028" :bold true})
           (vim.fn.sign_define "DapStopped" {:text "" :testhl "DapStoppedHl" :linehl "DapStoppedLineHl" :numhl ""})
           (vim.fn.sign_define "DapBreakpoint" {:text "" :texthl "DiagnosticSignError" :linehl "" :numhl ""})
           (vim.fn.sign_define "DapBreakpointCondition" {:text "" :texthl "DiagnosticSignWarn" :linehl "" :numhl ""})
           (vim.fn.sign_define "DapBreakpointRejected" {:text "" :texthl "DiagnosticSignError" :linehl "" :numhl ""})
           (vim.fn.sign_define "DapLogPoint" {:text "" :texthl "DiagnosticSignInfo" :linehl "" :numhl ""})

           (tset dap.listeners.after.event_initialized :dapui_config (fn []
                                                                       ((. (require :dapui) :open))
                                                                       nil))
           (tset dap.listeners.after.event_terminated :dapui_config (fn []
                                                                      nil))
           (tset dap.listeners.after.event_exited :dapui_config (fn []
                                                                  nil))

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
                                         :hostName "127.0.0.1"
                                         :port 8000
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

           nil)
 }
 {1 :theHamsta/nvim-dap-virtual-text

 :lazy true
 :opts {:commented true :display_callback (fn [variable buf stackframe node options]
                                            (if (options.virt_text_pos "inline") (.. " " variable.value) (.. variable.name " " variable.value))
                                            )}
 }
 ]
