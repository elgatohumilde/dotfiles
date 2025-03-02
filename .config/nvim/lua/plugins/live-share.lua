return {
  {
    "azratul/live-share.nvim",
    dependencies = {
      {
        "jbyuki/instant.nvim",
        config = function()
          vim.g.instant_username = "elgatohumilde"
        end
      },
    },
    opts = {}
  },
}
