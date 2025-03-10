(lambda pack [identifier ?options]
  "A workaround around the lack of mixed tables in Fennel.
  Has special `options` keys for enhanced utility."
  (let [options (or ?options {})
        options (collect [k v (pairs options)]
                  (match k
                    :require* (values :config `#(require ,v))
                    _ (values k v)))]
    (doto options (tset 1 identifier))))

{: pack}
