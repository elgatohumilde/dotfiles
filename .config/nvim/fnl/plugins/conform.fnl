[
 {1 :stevearc/conform.nvim

 :event [ "BufWritePre" ]
 :cmd [ "ConformInfo" ]
 :opts {
 :formatters_by_ft {
 :c [ "clang-format" ]
 :cpp [ "clang-format" ]
 }
 :notify_on_error false
 }
 }
 ]
