[
 {1 :nvim-orgmode/orgmode

 :cmd ["Org"]
 :ft ["org"]
 :dependencies ["nvim-orgmode/org-bullets.nvim"]
 :config (fn []
           ((. (require :orgmode) :setup) {
                                          :org_agenda_files "~/Sync/org/**/*"
                                          :org_default_notes_file "~/Sync/org/refile.org"
                                          :org_highlight_latex_and_related "entities"
                                          :org_startup_indented true
                                          })
           ((. (require :org-bullets) :setup))
           nil)
 }
 {1 :chipsenkbeil/org-roam.nvim

 :lazy true
 :ft ["org"]
 :dependencies ["nvim-orgmode/orgmode"]
 :config (fn []
           ((. (require :org-roam) :setup) {
                                           :directory "~/Sync/org/notes/"
                                           })
           nil)
 }
 ]
