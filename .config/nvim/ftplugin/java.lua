local home = vim.env.HOME

local config = {
    cmd = {
        "jdtls",
        "--jvm-arg=-javaagent:" .. home .. "/.local/share/nvim/mason/share/jdtls/lombok.jar"
    },
    root_dir = vim.fs.root(0, {
        ".git",
        "pom.xml",
        "build.mill",
        "build.gradle",
        "build.gradle.kts",
    })
}

require "jdtls".start_or_attach(config)
