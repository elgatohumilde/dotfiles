[
 {1 :nvim-treesitter/nvim-treesitter

 :build ":TSUpdate"
 :event ["BufReadPost" "BufNewFile"]
 :main "nvim-treesitter.configs"
 :opts {
 :auto_install true
 :highlight {:enable true :additional_vim_regex_highlighting ["ruby"] :disable ["latex"]}
 :indent {:enable true :disable ["ruby"]}
 }
 }
 ]
