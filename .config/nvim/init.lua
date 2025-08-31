vim.loader.enable()

local function bootstrap(repo, path)
  if not vim.loop.fs_stat(path) then
    vim.fn.system({ "git", "clone", repo, path })
    vim.opt.rtp:preppend(path)
  end
end

local mini_path = vim.fn.stdpath("data") .. "/site/pack/deps/start/mini.deps"
bootstrap("https://github.com/nvim-mini/mini.deps", mini_path)
require "mini.deps".setup()

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  vim.g.have_nerd_font = true
  vim.o.autoindent = true
  vim.o.background = "dark"
  vim.o.breakindent = true
  vim.o.clipboard = "unnamedplus"
  vim.o.cursorline = true
  vim.o.encoding = "UTF-8"
  vim.o.expandtab = true
  vim.o.ignorecase = true
  vim.o.laststatus = 0
  vim.o.number = true
  vim.o.relativenumber = true
  vim.o.scrolloff = 20
  vim.o.shiftwidth = 2
  vim.o.showmode = false
  vim.o.smartcase = true
  vim.o.smartindent = true
  vim.o.smarttab = true
  vim.o.splitbelow = true
  vim.o.splitright = true
  vim.o.swapfile = false
  vim.o.tabstop = 2
  vim.o.termguicolors = true
  vim.o.undofile = true
  vim.o.virtualedit = "all"
  vim.o.winblend = 0
  vim.o.winborder = "rounded"
  vim.o.wrap = false

  vim.g.mapleader = " "
  vim.g.maplocalleader = ","
end)


now(function()
  add({ source = "blazkowolf/gruber-darker.nvim" })
  add({ source = "nvim-mini/mini.icons" })
  add({ source = "nvim-mini/mini.notify" })
  add({ source = "folke/snacks.nvim" })

  vim.cmd.colorscheme "gruber-darker"
  require "mini.icons".setup()

  require "mini.notify".setup()
  vim.notify = MiniNotify.make_notify()
end)


now(function()
  local create_autocmd = vim.api.nvim_create_autocmd

  create_autocmd("TextYankPost", {
    callback = function() vim.highlight.on_yank() end
  })
  create_autocmd("BufWritePre", {
    callback = function() vim.lsp.buf.format() end
  })
  create_autocmd("LspAttach", {
    callback = function(args)
      add({ source = "Saghen/blink.cmp", checkout = "v1.6.0" })
      require "blink-cmp".setup {
        cmdline = { enabled = false },
        signature = { enabled = true },
        sources = { default = { "lsp", "snippets", "path" } },
        completion = { documentation = { auto_show = true }, },
      }

      local bufnr = args.buf
      local map = function(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
      end

      local Snacks = require "snacks"
      map("n", "<leader>ca", vim.lsp.buf.code_action)
      map("n", "<leader>d", vim.diagnostic.open_float)
      map("n", "<leader>f", vim.lsp.buf.format)
      map("n", "<leader>rn", vim.lsp.buf.rename)
      map("n", "<leader>so", Snacks.picker.lsp_symbols)
      map("n", "K", vim.lsp.buf.hover)
      map("n", "gD", Snacks.picker.lsp_declarations)
      map("n", "gd", Snacks.picker.lsp_definitions)
      map("n", "gi", Snacks.picker.lsp_implementations)
      map("n", "gr", Snacks.picker.lsp_references)
      map("n", "gt", Snacks.picker.lsp_type_definitions)
    end
  })
end)


later(function()
  add({ source = "mason-org/mason.nvim" })
  add({ source = "nvim-treesitter/nvim-treesitter" })

  require "mason".setup()
  ---@diagnostic disable-next-line: missing-fields
  require "nvim-treesitter.configs".setup {
    auto_install = true,
    highlight = { enable = true },
  }

  vim.diagnostic.config { virtual_text = true, }
  vim.lsp.enable({ "clangd", "lua_ls", "tinymist", "verible" })
end)


later(function()
  local create_command = vim.api.nvim_create_user_command

  create_command("LspInfo", ":checkhealth vim.lsp", {})
  create_command("Oil", function()
    add({ source = "stevearc/oil.nvim" })
    require "oil".setup()
    vim.cmd "Oil"
  end, {})
end)


later(function()
  add({
    source = "jiaoshijie/undotree",
    depends = { "nvim-lua/plenary.nvim" },
  })
  require "snacks".setup()
  require "undotree".setup()

  vim.ui.select = Snacks.picker.select
  local map = vim.keymap.set

  map("n", "/", Snacks.picker.lines)
  map("n", "<A-z>", ":b#<CR>")
  map("n", "<C-s>", ":Oil<CR>")
  map("n", "<Esc>", ":nohl<CR>")
  map("n", "<leader>-", ":sp<CR>")
  map("n", "<leader>/", "/")
  map("n", "<leader><leader>", Snacks.picker.buffers)
  map("n", "<leader>Q", Snacks.bufdelete.other)
  map("n", "<leader>n", ":e $MYVIMRC<CR>")
  map("n", "<leader>q", Snacks.bufdelete.delete)
  map("n", "<leader>sd", Snacks.picker.diagnostics)
  map("n", "<leader>sf", Snacks.picker.files)
  map("n", "<leader>sg", Snacks.picker.grep)
  map("n", "<leader>sh", Snacks.picker.help)
  map("n", "<leader>ut", require("undotree").toggle)
  map("n", "<leader>|", ":vs<CR>")
  map("n", "U", "<C-r>")
  map("n", "\\", Snacks.picker.zoxide)
  map("n", "q:", "<nop>")
  map("o", "ie", ":<C-u>normal! mzggVG<CR>`z")
  map("t", "<Esc><Esc>", "<C-\\><C-n>")
  map("v", "<leader>r", "\"hy:%s/<C-r>h//g<left><left>")
  map("x", "<leader>p", "\"_dP")
  map("x", "ie", ":<C-u>normal! ggVG<CR>")
  map({ "n", "v" }, "gL", "g$")
  map({ "n", "v" }, "gh", "^")
  map({ "n", "v" }, "gl", "$")
end)


later(function()
  add({ source = "aserowy/tmux.nvim" })
  add({ source = "lewis6991/gitsigns.nvim" })
  add({ source = "nvim-mini/mini.ai" })
  add({ source = "nvim-mini/mini.pairs" })
  add({ source = "nvim-mini/mini.surround" })
  require "mini.ai".setup()
  require "mini.pairs".setup()
  require "mini.surround".setup()
  require "tmux".setup()
end)
