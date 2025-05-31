[
 {1 :lervag/vimtex

 :ft ["tex" "plaintex"]
 :init (fn [] 
         (set vim.g.vimtex_view_method "zathura")
         (set vim.g.vimtex_compiler_latexmk {:out_dir "build"})
         nil)
 }
 ]
