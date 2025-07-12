local M = {}

function M.setup()
  -- Yank visually selected text to clipboard on mouse left release
  vim.api.nvim_set_keymap('v', '<LeftRelease>', '"+y', { noremap = true, silent = true })
end

return M
