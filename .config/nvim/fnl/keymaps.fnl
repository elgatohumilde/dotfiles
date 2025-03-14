;;General
(vim.api.nvim_set_keymap :n "q:" :<nop> {})
(vim.api.nvim_set_keymap :n "U" :<C-r> {:desc "Redo"})
(vim.api.nvim_set_keymap :n :<Esc> :<cmd>nohlsearch<CR> {:desc "Clear highlights"})
(vim.api.nvim_set_keymap :n :<leader>| :<cmd>vsplit<CR> {:desc "[|] Vertical split"})
(vim.api.nvim_set_keymap :n :<leader>- :<cmd>split<CR> {:desc "[-] Horizontal split"})
(vim.api.nvim_set_keymap :n :\ :<cmd>Lexplore<CR> {:desc "Open Netrw"})
(vim.api.nvim_set_keymap :t :<Esc><Esc> :<C-\><C-n> {:desc "Exit terminal mode"})
(for [i 1 9]
  (vim.api.nvim_set_keymap :n (.. "<A-" i ">") (.. i "gt") {:noremap true :silent true}))

;;Mini Pick
(vim.api.nvim_set_keymap :n :<leader>sf "<cmd>Pick cli command={\"fd\" \"-I\"}<CR>" {:desc "[S]earch [F]iles"})
(vim.api.nvim_set_keymap :n :<leader>sh "<cmd>Pick cli command={\"fd\" \"-H\" \"-I\"}<CR>" {:desc "[S]earch [H]idden"})
(vim.api.nvim_set_keymap :n :<leader>sk "<cmd>Pick keymaps<CR>" {:desc "[S]earch [K]eymaps"})
(vim.api.nvim_set_keymap :n :<leader>sn "<cmd>Pick cli command={\"fd\" \"-H\" \"-I\" \".\" \"/home/joaquin/.config/nvim/\"}<CR>" {:desc "[S]earch [N]eovim files"})
(vim.api.nvim_set_keymap :n :<leader>sc "<cmd>Pick cli command={\"fd\" \"-H\" \"-I\" \".\" \"/home/joaquin/.dotfiles/\"}<CR>" {:desc "[S]earch [C]onfiguration"})
(vim.api.nvim_set_keymap :n :<leader>/ "<cmd>Pick buf_lines<CR>" {:desc "[/] Search current buffer"})
(vim.api.nvim_set_keymap :n :<leader><leader> "<cmd>Pick buffers<CR>" {:desc "[ ] Search existing buffers"})

;;LSP
(vim.api.nvim_set_keymap :n :<leader>rn "<cmd>lua vim.lsp.buf.rename()<CR>" {:desc "[R]e[N]ame"})
(vim.api.nvim_set_keymap :n :<leader>ca "<cmd>lua vim.lsp.buf.code_action()<CR>" {:desc "[C]ode [A]ction"})
(vim.api.nvim_set_keymap :v :<leader>ca "<cmd>lua vim.lsp.buf.range_code_action()<CR>" {:desc "[C]ode [A]ction"})
(vim.api.nvim_set_keymap :n :<leader>od "<cmd>lua vim.diagnostic.open_float()<CR>" {:desc "[O]pen [D]iagnostic"})
(vim.api.nvim_set_keymap :n :gd "<cmd>lua vim.lsp.buf.definition()<CR>" {:desc "[G]oto [D]efinition"})
(vim.api.nvim_set_keymap :n :gD "<cmd>lua vim.lsp.buf.declaration()<CR>" {:desc "[G]oto [D]eclaration"})
(vim.api.nvim_set_keymap :n :gi "<cmd>lua vim.lsp.buf.implementation()<CR>" {:desc "[G]oto [I]mplementation"})
(vim.api.nvim_set_keymap :n :gr "<cmd>lua vim.lsp.buf.references()<CR>" {:desc "[G]et [R]eferences"})

;;which-key
(vim.api.nvim_set_keymap :n :<leader>? "<cmd>lua require(\"which-key\").show({global = false})<CR>" {:desc "[?] Buffer Local Keymaps"})

;;Conform
(vim.api.nvim_set_keymap :n :<leader>f "<cmd>lua require(\"conform\").format { async = true, lsp_format = 'fallback' }<CR>" {:desc "[F]ormat buffer"})
