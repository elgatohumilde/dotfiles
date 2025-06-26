(local home vim.env.HOME)

(local jdtls (require :jdtls))
(local project_name (vim.fn.fnamemodify (vim.fn.getcwd) ":p:h:t"))
(local workspace_dir (.. home "/jdtls-workspace/" project_name))

(local system_os "linux")

(local launcher_jar
  (vim.fn.glob (.. home "/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")))

(local bundles [
                (vim.fn.glob (.. home "/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"))
                ])

(vim.list_extend bundles (vim.split (vim.fn.glob (.. home "/.local/share/nvim/mason/share/java-test/*.jar") 1) "\n"))

(local config {
       :cmd [
             "java"
             "-Declipse.application=org.eclipse.jdt.ls.core.id1"
             "-Dosgi.bundles.defaultStartLevel=4"
             "-Declipse.product=org.eclipse.jdt.ls.core.product"
             "-Dlog.protocol=true"
             "-Dlog.level=ALL"
             (.. "-javaagent:" home "/.local/share/nvim/mason/share/jdtls/lombok.jar")
             "-Xmx4g"
             "--add-opens" "java.base/java.util=ALL-UNNAMED"
             "--add-opens" "java.base/java.lang=ALL-UNNAMED"
             "-jar"
             launcher_jar
             "-configuration"
             (.. home "/.local/share/nvim/mason/packages/jdtls/config_" system_os)
             "-data"
             workspace_dir
             ]
       :root_dir ((. (require :jdtls.setup) :find_root) [".git" "mvnw" "pom.xml" "build.gradle"])
       :settings {
       :java {
       :home "/usr/lib/jvm/java-24-openjdk"
       :eclipse {:downloadSources true}
       :configuration {
       :updateBuildConfiguration "interactive"
       :runtimes [{:name "JavaSE-24" :path "/usr/lib/jvm/java-24-openjdk"}]
       }
       :maven {:downloadSources true}
       :implementationsCodeLens {:enabled true}
       :referencesCodeLens {:enabled true}
       :references {:includeDecompiledSources true}
       :signatureHelp {:enabled true}
       :format {:enabled true}
       :completion {
       :favoriteStaticMembers [
                               "org.hamcrest.MatcherAssert.assertThat"
                               "org.hamcrest.Matchers.*"
                               "org.hamcrest.CoreMatchers.*"
                               "org.junit.jupiter.api.Assertions.*"
                               "java.util.Objects.requireNonNull"
                               "java.util.Objects.requireNonNullElse"
                               "org.mockito.Mockito.*"
                               ]
       :importOrder [
                     "java"
                     "javax"
                     "com"
                     "org"
                     ]
       }
       :sources {:organizeImports {:starThreshold 9999 :staticStarThreshold 9999}}
       :CodeGeneration {:toString {:template "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"} :useBlocks true}
       }
       }
       :capabilities ((. (require "blink.cmp") :get_lsp_capabilities))
       :flags {:allow_incremental_sync true}
       :init_options {:bundles bundles :extendedClientCapabilities jdtls.extendedClientCapabilities}
       })

(set (. config "on_attach") (fn [client bufnr]
                              (jdtls.setup_dap {:hotcodereplace "auto"})
                              ((. (require :jdtls.dap) :setup_dap_main_class_configs))
                              nil))

(jdtls.start_or_attach config)
