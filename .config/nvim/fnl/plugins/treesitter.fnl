(import-macros {: pack} :macros)

[
 (pack :nvim-treesitter/nvim-treesitter
       {
       :build ":TSUpdate"
       :event ["BufReadPost" "BufNewFile"]
       :main "nvim-treesitter.configs"
       :opts {:ensure_installed "all"
              :auto_install true
              :highlight {:enable true :additional_vim_regex_highlighting ["ruby"] :disable ["latex"]}
              :indent {:enable true :disable ["ruby"]}
              }
      }
 )
 (pack :nvim-treesitter/nvim-treesitter-context
       {
       :dependencies ["nvim-treesitter/nvim-treesitter"]
       :event ["BufReadPost" "BufNewFile"]
       :opts {}
      }
 )
]
