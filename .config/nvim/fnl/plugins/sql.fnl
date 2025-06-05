[
 {1 :kndndrj/nvim-dbee

 :dependencies ["MunifTanjim/nui.nvim"]
 :cmd "Dbee"
 :build (fn []
          ((. (require :dbee) :install))
          nil)
 :config (fn []
          ((. (require :dbee) :setup))
          nil)
 }
 ]
