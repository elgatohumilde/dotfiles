(import-macros {: pack} :macros)

[
 (pack :folke/which-key.nvim
       {
       :event "VeryLazy"
       :opts {:delay 250 :win {:border "single"} :preset "helix"}
       })
]
