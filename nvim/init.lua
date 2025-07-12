-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Set the colorscheme
-- vim.cmd.colorscheme("unokai")
vim.cmd.colorscheme("torte")
-- vim.cmd.colorscheme("slate")

-- Make background transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })

vim.cmd([[
  augroup TransparentBackground
    autocmd!
    autocmd ColorScheme * highlight Normal      ctermbg=none guibg=none
    autocmd ColorScheme * highlight NormalFloat ctermbg=none guibg=none
    autocmd ColorScheme * highlight FloatBorder ctermbg=none guibg=none
    autocmd ColorScheme * highlight Pmenu       ctermbg=none guibg=none
  augroup END
]])
