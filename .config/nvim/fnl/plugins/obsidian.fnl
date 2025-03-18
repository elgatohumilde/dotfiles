(local note_id_func (fn [title]
                      (if title
                          (.. (tostring (os.time)) "-" title )
                          (do
                            (var suffix "")
                            (for [_ 1 4]
                              (set suffix (.. suffix (string.char (math.random 65 90))))
                              )
                            (.. (tostring (os.time)) "-" suffix )
                            ))
                      ))

[
 {1 :epwalsh/obsidian.nvim

 :lazy true
 :event [ "BufReadPre *.md"  "BufNewFile *.md" ]
 :cmd ["ObsidianBackLinks" "ObsidianCheck" "ObsidianDailies" "ObsidianDebug" "ObsidianExtractNote" "ObsidianFollowLink" "ObsidianLink" "ObsidianLinkNew" "ObsidianLinks" "ObsidianNew" "ObsidianNewFromTemplate" "ObsidianOpen" "ObsidianPasteImg" "ObisdianQuickSwitch" "ObsidianRename" "ObsidianSearch" "ObsidianTags" "ObsidianTemplate" "ObsidianTOC" "ObsidianToday" "ObsidianToggleCheckbox" "ObsidianTomorrow" "ObsidianWorkspace" "ObsidianYesterday"]
 :dependencies [ "nvim-lua/plenary.nvim" ]
 :opts {
 :workspaces [
              {:name "Personal" :path "~/Sync/Notes/"}
              {
              :name "no-vault"
              :path (fn [] (assert (vim.fs.dirname (vim.api.nvim_buf_get_name 0))))
              :overrides {:notes_subdir vim.NIL :new_notes_location "current_dir" :templates {:folder vim.NIL} :disable_frontmatter true}
              }
              ]
 :daily_notes { :folder "Journal" :default_tags ["daily"] }
 :templates { :folder "3 Resources/Templates" }
 :attachments { :img_folder "3 Resources/Images" }
 :mappings {}
 :new_notes_location "notes_subdir"
 :notes_subdir "3 Resources"
 :preferred_link_style "markdown"
 :follow_url_func (fn [url] (vim.fn.jobstart ["xdg-open" url]) nil)
 :follow_img_func (fn [img] (vim.fn.jobstart ["xdg-open" img]) nil)
 :note_id_func note_id_func
 :picker { :name "mini.pick" }
 :ui { :enable false }
 }
 }
 ]
