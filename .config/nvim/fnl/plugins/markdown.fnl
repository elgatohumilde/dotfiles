[
 {1 :iamcco/markdown-preview.nvim

 :cmd [ "MarkdownPreviewToggle" "MarkdownPreview" "MarkdownPreviewStop" ]
 :build "cd app && yarn install"
 :init (fn []
         (set vim.g.mkdp_filetypes [ "markdown" ])
         (set vim.g.mkdp_browser "/usr/bin/librewolf")
         nil)
 :ft [ "markdown" ]
 }
 ]
