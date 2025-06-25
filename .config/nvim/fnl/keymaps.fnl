;;General
(vim.keymap.set :n "q:" :<nop> {})
(vim.keymap.set :x "<leader>p" "\"_dP" {})
(vim.keymap.set :n "U" :<C-r> {:desc "Redo"})
(vim.keymap.set :n :<C-s> :<cmd>Oil<CR> {:desc "Open file explorer"})
(vim.keymap.set :n :<A-s> "<cmd>Oil --float<CR>" {:desc "Open floating file explorer"})
(vim.keymap.set :n :\ "<cmd>lua Snacks.explorer({auto_close = true, hidden = true})<CR>" {:desc "File Tree"})
(vim.keymap.set :o :ie ":<C-u>normal! mzggVG<CR>`z" {})
(vim.keymap.set :x :ie ":<C-u>normal! ggVG<CR>" {})
(vim.keymap.set :n :<A-z> "<cmd>b#<CR>" {:desc "Alternate Buffer"})
(vim.keymap.set :n :<leader>q "<cmd>lua Snacks.bufdelete()<CR>" {:desc "Kill Current Buffer"})
(vim.keymap.set :n :<leader>Q "<cmd>lua Snacks.bufdelete.other()<CR>" {:desc "Kill non-Current Buffers"})
(vim.keymap.set :n :<Esc> :<cmd>nohlsearch<CR> {:desc "Clear highlights"})
(vim.keymap.set :n :<leader>| :<cmd>vsplit<CR> {:desc "[|] Vertical split"})
(vim.keymap.set :n :<leader>- :<cmd>split<CR> {:desc "[-] Horizontal split"})
(vim.keymap.set :t :<Esc><Esc> :<C-\><C-n> {:desc "Exit terminal mode"})
(vim.keymap.set :v :<leader>r "\"hy:%s/<C-r>h//g<left><left>" {})
(vim.keymap.set :n :j :gj {})
(vim.keymap.set :n :k :gk {})
(for [i 1 9]
  (vim.keymap.set :n (.. "<A-" i ">") (.. i "gt") {:noremap true :silent true}))

;;Snacks Picker
(vim.keymap.set :n :<leader>sf "<cmd>lua Snacks.picker.files({pwd = vim.cmd('pwd')})<CR>" {:desc "[S]earch [F]iles"})
(vim.keymap.set :n :<leader>sh "<cmd>lua Snacks.picker.files({pwd = vim.cmd('pwd'), hidden = true})<CR>" {:desc "[S]earch [H]idden"})
(vim.keymap.set :n :<leader>sk "<cmd>lua Snacks.picker.keymaps()<CR>" {:desc "[S]earch [K]eymaps"})
(vim.keymap.set :n :<leader>sg "<cmd>lua Snacks.picker.grep()<CR>" {:desc "[S]earch [G]rep"})
(vim.keymap.set :n :<leader>ss "<cmd>lua Snacks.picker.lsp_symbols()<CR>" {:desc "[S]earch LSP [S]ymbols"})
(vim.keymap.set :n :<leader>sm "<cmd>lua Snacks.picker.man()<CR>" {:desc "[S]earch [M]an Pages"})
(vim.keymap.set :n :<leader>sd "<cmd>lua Snacks.picker.diagnostics()<CR>" {:desc "[S]earch [D]iagnostics"})
(vim.keymap.set :n :<leader>sn "<cmd>lua Snacks.picker.files({cwd = '/home/joaquin/.config/nvim/', hidden = true})<CR>" {:desc "[S]earch [N]eovim files"})
(vim.keymap.set :n :<leader>os "<cmd>lua Snacks.picker.files({cwd = '/home/joaquin/Sync/org/', hidden = true})<CR>" {:desc "[O]rg [S]earch"})
(vim.keymap.set :n :<leader>/ "<cmd>lua Snacks.picker.lines()<CR>" {:desc "[/] Search current buffer"})
(vim.keymap.set [:n :i] :<A-x> "<cmd>lua Snacks.picker.spelling()<CR>" {:desc "Spelling suggestions"})
(vim.keymap.set :n :<leader><leader> "<cmd>lua Snacks.picker.buffers()<CR>" {:desc "[ ] Search existing buffers"})

;;Snacks notifier
(vim.keymap.set :n :<leader>dn "<cmd>lua Snacks.notifier.hide()<CR>" {:desc "[D]ismiss [N]otifications"})

;;LSP
(vim.keymap.set :n :<leader>D "<cmd>lua vim.diagnostic.open_float()<CR>" {:desc "[O]pen [D]iagnostic"})
(vim.api.nvim_create_autocmd "LspAttach" {
                             :desc "LSP actions"
                             :callback (fn [event]
                                         (vim.keymap.set :n :K "<cmd>lua vim.lsp.buf.hover()<CR>" {:desc "Hover Information" :buffer (. event :buf)})
                                         (vim.keymap.set :n :<leader>rn "<cmd>lua vim.lsp.buf.rename()<CR>" {:desc "[R]e[N]ame" :buffer (. event :buf)})
                                         (vim.keymap.set :n :<leader>ca "<cmd>lua vim.lsp.buf.code_action()<CR>" {:desc "[C]ode [A]ction" :buffer (. event :buf)})
                                         (vim.keymap.set :v :<leader>ca "<cmd>lua vim.lsp.buf.range_code_action()<CR>" {:desc "[C]ode [A]ction" :buffer (. event :buf)})
                                         (vim.keymap.set :n :gd "<cmd>lua Snacks.picker.lsp_definitions()<CR>" {:desc "[G]oto [D]efinition" :buffer (. event :buf)})
                                         (vim.keymap.set :n :gD "<cmd>lua Snacks.picker.lsp_declarations()<CR>" {:desc "[G]oto [D]eclaration" :buffer (. event :buf)})
                                         (vim.keymap.set :n :gi "<cmd>lua Snacks.picker.lsp_implementations()<CR>" {:desc "[G]oto [I]mplementation" :buffer (. event :buf)})
                                         (vim.keymap.set :n :gr "<cmd>lua Snacks.picker.lsp_references()<CR>" {:desc "[G]et [R]eferences" :buffer (. event :buf)})
                                         (vim.keymap.set :n :gO "<cmd>lua Snacks.picker.lsp_symbols()<CR>" {:desc "[G]et Symb[O]ls" :buffer (. event :buf)})
                                         nil)
                             })

;;DAP
(vim.keymap.set "n" "<leader>bb" :<cmd>DapToggleBreakpoint<CR> {})
(vim.keymap.set "n" "<leader>br" :<cmd>DapClearBreakpoints<CR> {})
(vim.keymap.set "n" "<leader>bc" "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
(vim.keymap.set "n" "<leader>bl" "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
(vim.keymap.set "n" "<leader>dc" :<cmd>DapContinue<CR> {})
(vim.keymap.set "n" "<leader>dk" :<cmd>DapStepInto<CR> {})
(vim.keymap.set "n" "<leader>dj" :<cmd>DapStepOver<CR> {})
(vim.keymap.set "n" "<leader>do" :<cmd>DapStepOut<CR> {})
(vim.keymap.set "n" "<leader>dd" (fn []
                                   ((. (require :dap) :disconnect))
                                   ((. (require :dapui) :close))
                                   nil))
(vim.keymap.set "n" "<leader>dt" (fn []
                                   ((. (require :dap) :terminate))
                                   ((. (require :dapui) :close))
                                   nil))
(vim.keymap.set "n" "<leader>dr" "<cmd>lua require'dap'.repl.toggle()<CR>")
(vim.keymap.set "n" "<leader>dl" "<cmd>lua require'dap'.run_last()<CR>")
(vim.keymap.set "n" "<leader>di" (fn []
                                   ((. (require :dap.ui.widgets) :hover))
                                   nil))
(vim.keymap.set "n" "<leader>d?" (fn []
                                   (local widgets (require :dap.ui.widgets))
                                   (widgets.centered_float widgets.scopes)
                                   nil))

;;which-key
(vim.keymap.set :n :<leader>? "<cmd>lua require(\"which-key\").show({global = false})<CR>" {:desc "[?] Buffer Local Keymaps"})

;;Conform
(vim.keymap.set :n :<leader>f "<cmd>lua require(\"conform\").format { async = true }<CR>" {:desc "[F]ormat buffer"})

;;org-mode
(vim.keymap.set :n :<leader>oa "<cmd>Org agenda<CR>" {:desc "org agenda"})
(vim.keymap.set :n :<leader>oc "<cmd>Org capture<CR>" {:desc "org capture"})

;;org-roam
(vim.keymap.set :n :<leader>nf "<cmd>lua require(\"org-roam\").api.find_node()<CR>" {:desc "[N]ode [F]ind"})
(vim.keymap.set :n :<leader>nc "<cmd>lua require(\"org-roam\").api.capture_node()<CR>" {:desc "[N]ode [C]apture"})
(vim.keymap.set :n :<leader>ndd "<cmd>lua require(\"org-roam\").ext.dailies.goto_date()<CR>" {:desc "[N]ode [D]ailies [D]ate"})

;;Nabla
(vim.keymap.set :n :<leader>tl "<cmd>lua require(\"nabla\").popup()<CR>" {:desc "[T]oggle [L]aTeX expression"})

;;UndoTree
(vim.keymap.set :n :<leader>ut "<cmd>UndotreeToggle<CR>" {:desc "[U]ndo[T]ree"})

;;Tmux-Navigator
(vim.keymap.set :n :<C-h> "<cmd>TmuxNavigateLeft<CR>" {})
(vim.keymap.set :n :<C-j> "<cmd>TmuxNavigateDown<CR>" {})
(vim.keymap.set :n :<C-k> "<cmd>TmuxNavigateUp<CR>" {})
(vim.keymap.set :n :<C-l> "<cmd>TmuxNavigateRight<CR>" {})

;;Dbee
(vim.keymap.set :n :<leader>ts "<cmd>Dbee toggle<CR>" {})
