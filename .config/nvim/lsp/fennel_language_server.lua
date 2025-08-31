return {
  cmd = { "fennel-language-server" },
  filetypes = { "fennel" },
  root_markers = { ".git" },
  settings = {
    fennel = {
      workspace = {
        library = vim.api.nvim_list_runtime_paths(),
      },
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}
