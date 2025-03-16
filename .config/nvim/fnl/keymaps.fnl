;;General
(vim.keymap.set :n "q:" :<nop> {})
(vim.keymap.set :n "U" :<C-r> {:desc "Redo"})
(vim.keymap.set :x "<leader>p" "\"_dP" {})
(vim.keymap.set :n :<C-s> :<cmd>Ex<CR> {:desc "Files Tree"})
(vim.keymap.set :n :<Esc> :<cmd>nohlsearch<CR> {:desc "Clear highlights"})
(vim.keymap.set :n :<leader>| :<cmd>vsplit<CR> {:desc "[|] Vertical split"})
(vim.keymap.set :n :<leader>- :<cmd>split<CR> {:desc "[-] Horizontal split"})
(vim.keymap.set :n :\ :<cmd>Lexplore<CR> {:desc "Open Netrw"})
(vim.keymap.set :t :<Esc><Esc> :<C-\><C-n> {:desc "Exit terminal mode"})
(for [i 1 9]
  (vim.keymap.set :n (.. "<A-" i ">") (.. i "gt") {:noremap true :silent true}))

;;Mini Pick
(vim.keymap.set :n :<leader>sf "<cmd>Pick cli command={\"fd\" \"-I\"}<CR>" {:desc "[S]earch [F]iles"})
(vim.keymap.set :n :<leader>sh "<cmd>Pick cli command={\"fd\" \"-H\" \"-I\"}<CR>" {:desc "[S]earch [H]idden"})
(vim.keymap.set :n :<leader>sk "<cmd>Pick keymaps<CR>" {:desc "[S]earch [K]eymaps"})
(vim.keymap.set :n :<leader>sn "<cmd>Pick cli command={\"fd\" \"-H\" \".\" \"/home/joaquin/.config/nvim/\"}<CR>" {:desc "[S]earch [N]eovim files"})
(vim.keymap.set :n :<leader>sc "<cmd>Pick cli command={\"fd\" \"-H\" \".\" \"/home/joaquin/.dotfiles/\"}<CR>" {:desc "[S]earch [C]onfiguration"})
(vim.keymap.set :n :<leader>/ "<cmd>Pick buf_lines<CR>" {:desc "[/] Search current buffer"})
(vim.keymap.set :n :<leader><leader> "<cmd>Pick buffers<CR>" {:desc "[ ] Search existing buffers"})

;;LSP
(vim.api.nvim_create_autocmd "LspAttach" {
                               :desc "LSP actions"
                               :callback (fn [event]
                                           (vim.keymap.set :n :K "<cmd>lua vim.lsp.buf.hover()<CR>" {:desc "[R]e[N]ame" :buffer (. event :buf)})
                                           (vim.keymap.set :n :<leader>rn "<cmd>lua vim.lsp.buf.rename()<CR>" {:desc "[R]e[N]ame" :buffer (. event :buf)})
                                           (vim.keymap.set :n :<leader>ca "<cmd>lua vim.lsp.buf.code_action()<CR>" {:desc "[C]ode [A]ction" :buffer (. event :buf)})
                                           (vim.keymap.set :v :<leader>ca "<cmd>lua vim.lsp.buf.range_code_action()<CR>" {:desc "[C]ode [A]ction" :buffer (. event :buf)})
                                           (vim.keymap.set :n :<leader>od "<cmd>lua vim.diagnostic.open_float()<CR>" {:desc "[O]pen [D]iagnostic" :buffer (. event :buf)})
                                           (vim.keymap.set :n :gd "<cmd>lua vim.lsp.buf.definition()<CR>" {:desc "[G]oto [D]efinition" :buffer (. event :buf)})
                                           (vim.keymap.set :n :gD "<cmd>lua vim.lsp.buf.declaration()<CR>" {:desc "[G]oto [D]eclaration" :buffer (. event :buf)})
                                           (vim.keymap.set :n :gi "<cmd>lua vim.lsp.buf.implementation()<CR>" {:desc "[G]oto [I]mplementation" :buffer (. event :buf)})
                                           (vim.keymap.set :n :gr "<cmd>lua vim.lsp.buf.references()<CR>" {:desc "[G]et [R]eferences" :buffer (. event :buf)})
                                           nil)
                               })

;;which-key
(vim.keymap.set :n :<leader>? "<cmd>lua require(\"which-key\").show({global = false})<CR>" {:desc "[?] Buffer Local Keymaps"})

;;Conform
(vim.keymap.set :n :<leader>f "<cmd>lua require(\"conform\").format { async = true }<CR>" {:desc "[F]ormat buffer"})

;;Markdown-Preview
(vim.keymap.set :n :<leader>tp "<cmd>MarkdownPreviewToggle<CR>" {:desc "[T]oggle [P]review"})

;;UndoTree
(vim.keymap.set :n :<leader>ut "<cmd>UndotreeToggle<CR>" {:desc "[U]ndo[T]ree"})

;;Tmux-Navigator
(vim.keymap.set :n :<C-h> "<cmd>TmuxNavigateLeft<CR>" {})
(vim.keymap.set :n :<C-j> "<cmd>TmuxNavigateDown<CR>" {})
(vim.keymap.set :n :<C-k> "<cmd>TmuxNavigateUp<CR>" {})
(vim.keymap.set :n :<C-l> "<cmd>TmuxNavigateRight<CR>" {})
