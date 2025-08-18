local handlers = require "vim.lsp.handlers"

local env = {
    HOME = vim.uv.os_homedir(),
    XDG_CACHE_HOME = os.getenv "XDG_CACHE_HOME",
}

local function get_cache_dir()
    return env.XDG_CACHE_HOME and env.XDG_CACHE_HOME or env.HOME .. "/.cache"
end

local function get_jdtls_cache_dir()
    return get_cache_dir() .. "/jdtls"
end

local function get_jdtls_config_dir()
    return get_jdtls_cache_dir() .. "/config"
end

local function get_jdtls_workspace_dir()
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    return get_jdtls_cache_dir() .. "/workspace/" .. project_name
end

local function get_jdtls_jvm_args()
    local args = {
        "--jvm-arg=-javaagent:" .. env.HOME .. "/.local/share/nvim/mason/share/jdtls/lombok.jar",
    }

    return unpack(args)
end

local function fix_zero_version(workspace_edit)
    if workspace_edit and workspace_edit.documentChanges then
        for _, change in pairs(workspace_edit.documentChanges) do
            local text_document = change.textDocument
            if text_document and text_document.version and text_document.version == 0 then
                text_document.version = nil
            end
        end
    end
    return workspace_edit
end

local function on_textdocument_codeaction(err, actions, ctx)
    for _, action in ipairs(actions) do
        if action.command == "java.apply.workspaceEdit" then
            action.edit = fix_zero_version(action.edit or action.arguments[1])
        elseif type(action.command) == "table" and action.command.command == "java.apply.workspaceEdit" then
            action.edit = fix_zero_version(action.edit or action.command.arguments[1])
        end
    end

    handlers[ctx.method](err, actions, ctx)
end

local function on_textdocument_rename(err, workspace_edit, ctx)
    handlers[ctx.method](err, fix_zero_version(workspace_edit), ctx)
end

local function on_workspace_applyedit(err, workspace_edit, ctx)
    handlers[ctx.method](err, fix_zero_version(workspace_edit), ctx)
end

local function on_language_status(_, result)
    local command = vim.api.nvim_command
    command "echohl ModeMsg"
    command(string.format("echo \"%s\"", result.message))
    command "echohl None"
end

return {
    cmd = {
        "jdtls",
        "-configuration",
        get_jdtls_config_dir(),
        "-data",
        get_jdtls_workspace_dir(),
        get_jdtls_jvm_args(),
    },
    filetypes = { "java" },
    root_markers = {
        ".git",
        "pom.xml",
        "build.xml",
        "build.mill",
        "build.gradle",
        "build.gradle.kts",
        "settings.gradle",
        "settings.gradle.kts",
    },
    init_options = {
        workspace = get_jdtls_workspace_dir(),
        jvm_args = {},
        os_config = nil,
    },
    handlers = {
        ["textDocument/codeAction"] = on_textdocument_codeaction,
        ["textDocument/rename"] = on_textdocument_rename,
        ["workspace/applyEdit"] = on_workspace_applyedit,
        ["language/status"] = vim.schedule_wrap(on_language_status),
    },
}
