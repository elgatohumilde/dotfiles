[
 {1 :iamcco/markdown-preview.nvim

 :ft [ "markdown" ]
 :cmd [ "MarkdownPreviewToggle" "MarkdownPreview" "MarkdownPreviewStop" ]
 :build "cd app && yarn install"
 :init (fn []
         (set vim.g.mkdp_filetypes [ "markdown" ])
         (set vim.g.mkdp_browser "/usr/bin/librewolf")
         nil)
 }
 {1 :OXY2DEV/markview.nvim

 :ft [ "markdown" ]
 :opts {
 :preview {:hybrid_modes ["n"]}
 :latex {:enable false}
 :markdown {:block_quotes {
 :DEFINITION {:hl "MarkviewBlockQuoteSpecial" :preview " Definition" :border "▋"}
 :THEOREM {:hl "MarkviewBlockQuoteSpecial" :preview " Theorem" :border "▋"}
 :LEMMA {:hl "MarkviewBlockQuoteSpecial" :preview " Lemma" :border "▋"}
 :COROLLARY {:hl "MarkviewBlockQuoteSpecial" :preview " Corollary" :border "▋"}
 :PROPERTY {:hl "MarkviewBlockQuoteSpecial" :preview " Property" :border "▋"}
 :OBSERVATION {:hl "MarkviewBlockQuoteSpecial" :preview " Observation" :border "▋"}
 :PROOF {:hl "MarkviewBlockQuoteSpecial" :preview " Proof" :border "▋"}
 :EXERCISE {:hl "MarkviewBlockQuoteSpecial" :preview " Exercise" :border "▋"}
 }}
 }
 }
 ]
