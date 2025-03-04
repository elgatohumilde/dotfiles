vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.o.termguicolors = true
vim.g.have_nerd_font = true
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_hide = 0
vim.g.netrw_liststyle = 0
vim.g.netrw_winsize = 30

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt.spell = true
vim.opt.spelllang = { 'es', 'en_us' }

vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<leader>mp', vim.cmd.MarkdownPreviewToggle, { desc = 'Toggle Markdown Preview' })
vim.keymap.set('n', '\\', vim.cmd.Lexplore, { desc = 'Open Netrw' })
vim.keymap.set('n', '<leader>|', '<cmd>vsplit<CR>')
vim.keymap.set('n', '<leader>_', '<cmd>split<CR>')
-- fast tab switching
for i = 1, 9 do
  vim.api.nvim_set_keymap('n', '<A-'..i..'>', i..'gt', { noremap = true, silent = true })
end

vim.api.nvim_create_autocmd({"VimLeave"},{
    command = "set guicursor=a:ver20",
})

