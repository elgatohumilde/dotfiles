(set vim.opt.encoding :UTF-8)
(set vim.opt.number true)
(set vim.opt.relativenumber true)
(set vim.opt.autoindent true)
(set vim.opt.tabstop 4)
(set vim.opt.shiftwidth 4)
(set vim.opt.smarttab true)
(set vim.opt.expandtab true)
(set vim.opt.showmode false)
(set vim.opt.cursorline true)
(set vim.opt.mouse :a)
(set vim.opt.breakindent true)
(set vim.opt.undofile true)
(set vim.opt.ignorecase true)
(set vim.opt.smartcase true)
(set vim.opt.wrap true)
(set vim.opt.swapfile false)
(set vim.opt.splitright true)
(set vim.opt.splitbelow true)
(set vim.opt.background :dark)
(set vim.o.termguicolors true)
(set vim.g.have_nerd_font true)
(set vim.g.netrw_keepdir 0)
(set vim.g.netrw_winsize 30)
(set vim.g.netrw_browser_split 0)
(set vim.g.netrw_localcopydircmd "cp -r")
(set vim.g.netrw_banner 0)
(set vim.g.netrw_hide 0)
(set vim.g.netrw_liststyle 3)
(set vim.o.colorcolumn :80)

(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")

(set vim.opt.spell true)
(set vim.opt.spelllang [ "es" "en_us" ])

(set vim.o.foldenable true)
(set vim.o.foldlevel 99)
(set vim.o.foldmethod "expr")
(set vim.o.foldexpr "v:lua.vim.treesitter.foldexpr()")
(set vim.o.foldtext "")
(set vim.opt.foldcolumn "0")
(vim.opt.fillchars:append {:fold " "})

(vim.api.nvim_create_autocmd "TextYankPost"
                             {
                             :desc "Highlight when yanking text"
                             :callback (fn []
                                         (vim.highlight.on_yank)
                                         nil)
                             })

(vim.api.nvim_create_autocmd ["CursorMoved" "CursorMovedI"]
                             {:callback (fn []
                                          (local pos (vim.fn.getpos "."))
                                          (vim.cmd "normal! zz")
                                          (vim.fn.setpos "." pos)
                                          nil)}
                             )

(vim.schedule (fn init []
                (set vim.opt.clipboard :unnamedplus)
                nil
                )
              )

(vim.api.nvim_create_autocmd ["VimLeave"]
                             {:command "set guicursor=a:ver20"}
                             )
