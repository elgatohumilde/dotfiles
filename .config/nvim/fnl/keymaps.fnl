;;General
(vim.api.nvim_set_keymap :n "q:" :<nop> {})
(vim.api.nvim_set_keymap :n "U" :<C-r> {})
(vim.api.nvim_set_keymap :n :<Esc> :<cmd>nohlsearch<CR> {})
(vim.api.nvim_set_keymap :n :<leader>| :<cmd>vsplit<CR> {})
(vim.api.nvim_set_keymap :n :<leader>_ :<cmd>split<CR> {})
(vim.api.nvim_set_keymap :n :\ :<cmd>Lexplore<CR> {:desc "Open Netrw"})
(vim.api.nvim_set_keymap :t :<Esc><Esc> :<C-\><C-n> {:desc "Exit terminal mode"})
(for [i 1 9]
  (vim.api.nvim_set_keymap :n (.. "<A-" i ">") (.. i "gt") {:noremap true :silent true}))

;;Mini Pick
(vim.api.nvim_set_keymap :n :<leader>sf "<cmd>Pick cli command={\"fd\" \"-I\"}<CR>" {})
(vim.api.nvim_set_keymap :n :<leader>sh "<cmd>Pick cli command={\"fd\" \"-H\" \"-I\"}<CR>" {})
(vim.api.nvim_set_keymap :n :<leader>sk "<cmd>Pick keymaps<CR>" {})
(vim.api.nvim_set_keymap :n :<leader>sn "<cmd>Pick cli command={\"fd\" \"-H\" \"-I\" \".\" \"/home/joaquin/.config/nvim/\"}<CR>" {})
(vim.api.nvim_set_keymap :n :<leader>sc "<cmd>Pick cli command={\"fd\" \"-H\" \"-I\" \".\" \"/home/joaquin/.config/\"}<CR>" {})
(vim.api.nvim_set_keymap :n :<leader>/ "<cmd>Pick buf_lines<CR>" {})
(vim.api.nvim_set_keymap :n :<leader><leader> "<cmd>Pick buffers<CR>" {})

;;LSP
(vim.api.nvim_set_keymap :n :<leader>rn "<cmd>lua vim.lsp.buf.rename()<CR>" {})
(vim.api.nvim_set_keymap :n :<leader>ca "<cmd>lua vim.lsp.buf.code_action()<CR>" {})
(vim.api.nvim_set_keymap :n :<leader>od "<cmd>lua vim.diagnostic.open_float()<CR>" {})
