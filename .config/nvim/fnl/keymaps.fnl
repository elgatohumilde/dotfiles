(local feed (fn [str ?num]
              (var num (or ?num 1))
              (if (< num 1) (set num 1))
              (var result "")
              (for [_ 1 num]
                (set result (.. result str))
                )
              (vim.api.nvim_feedkeys (vim.api.nvim_replace_termcodes
                                       result
                                       true
                                       false
                                       true)
                                     "n" true)
              nil))

;;General
(vim.keymap.set :n "q:" :<nop> {})
(vim.keymap.set :x "<leader>p" "\"_dP" {})
(vim.keymap.set :n "U" :<C-r> {:desc "Redo"})
(vim.keymap.set :n :<C-s> :<cmd>Ex<CR> {:desc "Open Netrw"})
(vim.keymap.set :n :\ (fn []
                        (if (~= vim.bo.filetype "netrw")
                            (vim.cmd "Lexplore %:p:h")
                            (vim.cmd "Lexplore")
                            ))
                {:desc "File Tree"})
(vim.keymap.set :o :ie ":<C-u>normal! mzggVG<CR>`z" {})
(vim.keymap.set :x :ie ":<C-u>normal! ggVG<CR>" {})
(vim.keymap.set :n :<A-z> "<cmd>b#<CR>" {:desc "Alternate Buffer"})
(vim.keymap.set :n :<leader>q "<cmd>bd<CR>" {:desc "Kill Current Buffer"})
(vim.keymap.set :n :<leader>Q "<cmd>%bd|e#|bd#|'\"<CR>" {:desc "Kill non-Current Buffers"})
(vim.keymap.set :n :<Esc> :<cmd>nohlsearch<CR> {:desc "Clear highlights"})
(vim.keymap.set :n :<leader>| :<cmd>vsplit<CR> {:desc "[|] Vertical split"})
(vim.keymap.set :n :<leader>- :<cmd>split<CR> {:desc "[-] Horizontal split"})
(vim.keymap.set :t :<Esc><Esc> :<C-\><C-n> {:desc "Exit terminal mode"})
(vim.keymap.set :v :<leader>r "\"hy:%s/<C-r>h//g<left><left>" {})
(vim.keymap.set :i "<BS>" (fn []
                            (let [line (vim.fn.getline ".")
                                       col (vim.fn.col ".")]
                              (if (or (and (= (string.sub line (- col 1) (- col 1)) "(") (= (string.sub line col col) ")"))
                                      (and (= (string.sub line (- col 1) (- col 1)) "{") (= (string.sub line col col) "}"))
                                      (and (= (string.sub line (- col 1) (- col 1)) "[") (= (string.sub line col col) "]"))
                                      (and (= (string.sub line (- col 1) (- col 1)) "\"") (= (string.sub line col col) "\""))
                                      (and (= (string.sub line (- col 1) (- col 1)) "'") (= (string.sub line col col) "'"))
                                      )
                                  (feed "<right><BS><BS>")
                                  (feed "<BS>")
                                  ))))
(vim.keymap.set :i "\"" 
                (fn []
                  (let [line (vim.fn.getline ".")
                             col  (vim.fn.col ".")]
                    (if (= (string.sub line col col) "\"")
                        (feed "<right>")
                        (feed "\"\"<left>")))))
(vim.keymap.set :i "'" 
                (fn []
                  (let [line (vim.fn.getline ".")
                             col  (vim.fn.col ".")]
                    (if (= (string.sub line col col) "'")
                        (feed "<right>")
                        (feed "''<left>")))))
(vim.keymap.set :i "{" "{}<left>")
(vim.keymap.set :i "}" 
                (fn []
                  (let [line (vim.fn.getline ".")
                             col  (vim.fn.col ".")]
                    (if (= (string.sub line col col) "}")
                        (feed "<right>")
                        (feed "}")))))
(vim.keymap.set :i "[" "[]<left>")
(vim.keymap.set :i "]" 
                (fn []
                  (let [line (vim.fn.getline ".")
                             col  (vim.fn.col ".")]
                    (if (= (string.sub line col col) "]")
                        (feed "<right>")
                        (feed "]")))))
(vim.keymap.set :i "(" "()<left>")
(vim.keymap.set :i ")" 
                (fn []
                  (let [line (vim.fn.getline ".")
                             col  (vim.fn.col ".")]
                    (if (= (string.sub line col col) ")")
                        (feed "<right>")
                        (feed ")")))))
(for [i 1 9]
  (vim.keymap.set :n (.. "<A-" i ">") (.. i "gt") {:noremap true :silent true}))

;;Mini Pick
(vim.keymap.set :n :<leader>sf "<cmd>Pick cli command={\"fd\" \"-I\"}<CR>" {:desc "[S]earch [F]iles"})
(vim.keymap.set :n :<leader>sh "<cmd>Pick cli command={\"fd\" \"-H\" \"-I\"}<CR>" {:desc "[S]earch [H]idden"})
(vim.keymap.set :n :<leader>sk "<cmd>Pick keymaps<CR>" {:desc "[S]earch [K]eymaps"})
(vim.keymap.set :n :<leader>sg "<cmd>Pick grep_live<CR>" {:desc "[S]earch [G]rep"})
(vim.keymap.set :n :<leader>sd "<cmd>Pick diagnostic<CR>" {:desc "[S]earch [D]iagnostics"})
(vim.keymap.set :n :<leader>sn "<cmd>Pick cli command={\"fd\" \"-H\" \".\" \"/home/joaquin/.config/nvim/\"}<CR>" {:desc "[S]earch [N]eovim files"})
(vim.keymap.set :n :<leader>sc "<cmd>Pick cli command={\"fd\" \"-H\" \".\" \"/home/joaquin/.dotfiles/\"}<CR>" {:desc "[S]earch [C]onfiguration"})
(vim.keymap.set :n :<leader>os "<cmd>Pick cli command={\"fd\" \"-H\" \".\" \"/home/joaquin/Sync/org/\"}<CR>" {:desc "[O]rg [S]earch"})
(vim.keymap.set :n :<leader>/ "<cmd>Pick buf_lines scope='current' preserve_order=true<CR>" {:desc "[/] Search current buffer"})
(vim.keymap.set [:n :i] :<A-x> "<cmd>Pick spellsuggest<CR>" {:desc "Spelling suggestions"})
(vim.keymap.set :n :<leader><leader> "<cmd>Pick buffers<CR>" {:desc "[ ] Search existing buffers"})

;;LSP
(vim.keymap.set :n :<leader>D "<cmd>lua vim.diagnostic.open_float()<CR>" {:desc "[O]pen [D]iagnostic"})
(vim.api.nvim_create_autocmd "LspAttach" {
                             :desc "LSP actions"
                             :callback (fn [event]
                                         (vim.keymap.set :n :K "<cmd>lua vim.lsp.buf.hover()<CR>" {:desc "Hover Information" :buffer (. event :buf)})
                                         (vim.keymap.set :n :<leader>rn "<cmd>lua vim.lsp.buf.rename()<CR>" {:desc "[R]e[N]ame" :buffer (. event :buf)})
                                         (vim.keymap.set :n :<leader>ca "<cmd>lua vim.lsp.buf.code_action()<CR>" {:desc "[C]ode [A]ction" :buffer (. event :buf)})
                                         (vim.keymap.set :v :<leader>ca "<cmd>lua vim.lsp.buf.range_code_action()<CR>" {:desc "[C]ode [A]ction" :buffer (. event :buf)})
                                         (vim.keymap.set :n :gd "<cmd>lua vim.lsp.buf.definition()<CR>" {:desc "[G]oto [D]efinition" :buffer (. event :buf)})
                                         (vim.keymap.set :n :gD "<cmd>lua vim.lsp.buf.declaration()<CR>" {:desc "[G]oto [D]eclaration" :buffer (. event :buf)})
                                         (vim.keymap.set :n :gi "<cmd>lua vim.lsp.buf.implementation()<CR>" {:desc "[G]oto [I]mplementation" :buffer (. event :buf)})
                                         (vim.keymap.set :n :gr "<cmd>lua vim.lsp.buf.references()<CR>" {:desc "[G]et [R]eferences" :buffer (. event :buf)})
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
