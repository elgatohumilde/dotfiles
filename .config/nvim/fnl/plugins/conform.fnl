[
 {1 :stevearc/conform.nvim

 :event [ "BufWritePre" ]
 :cmd [ "ConformInfo" ]
 :opts {
 :formatters_by_ft {
 :c [ "clang-format" ]
 :cpp [ "clang-format" ]
 :sql [ "sql_formatter" ]
 }
 :notify_on_error false
 :format_on_save (fn [bufnr]
                   (if (or vim.g.disable_autoformat (. (. vim.b bufnr) :disable_autoformat)) nil {:timeout_ms 500 :lsp_format "fallback"}))
 }
 }
 ]
