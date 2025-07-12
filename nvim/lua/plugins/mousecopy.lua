return {
  dir = vim.fn.stdpath("config") .. "/lua/mousecopy",
  name = "mousecopy",
  config = function()
    require("mousecopy").setup()
  end,
  lazy = false,  -- Load on startup
}

