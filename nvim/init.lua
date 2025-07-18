-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Set the colorscheme
-- vim.cmd.colorscheme("unokai")
-- vim.cmd.colorscheme("torte")
vim.cmd.colorscheme("slate")

vim.g.mapleader = " "
vim.keymap.set("n", "<C-j>", ":bprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", ":bnext<CR>", { noremap = true, silent = true })
vim.g.autoformat = false

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

-- Add keymap to nvim, so that the Home and End behave like standard vi/vim
vim.keymap.set({'n', 'v'}, '<Home>', '^')
vim.keymap.set({'n', 'v'}, '<End>', '$')
vim.keymap.set({'n', 'v'}, '<Find>', '^')
vim.keymap.set({'n', 'v'}, '<Select>', '$')

vim.keymap.set('i', '<Home>', '<C-o>^')
vim.keymap.set('i', '<End>', '<C-o>$')
vim.keymap.set('i', '<Find>', '<C-o>^')
vim.keymap.set('i', '<Select>', '<C-o>$')

--vim.api.nvim_create_autocmd("VimEnter", {
--  callback = function()
--    vim.cmd("Neotree show")
--  end,
--})

--vim.api.nvim_create_autocmd("VimEnter", {
--  callback = function()
--    require("nvim-tree.api").tree.open()
--  end,
--})
