setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal fileformat=unix
setlocal encoding=utf-8
setlocal fileencoding=utf-8
setlocal textwidth=100
setlocal expandtab

lua << EOF
vim.api.nvim_create_augroup('pallene-vim', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'pallene-vim',
  buffer = 0,
  --pattern = '*.pallene',
  callback = function()
    local view = vim.fn.winsaveview()
    vim.api.nvim_command('silent! undojoin')
    vim.api.nvim_command('silent keepjumps keeppatterns %s/\\s\\+$//e')
    vim.fn.winrestview(view)
  end,
})

vim.bo.fixendofline = true
-- 'endofline' can be read to detect if the file contains a final newline,
-- so only change 'endofline' right before writing the file
local endofline = true
if vim.bo.endofline ~= endofline then
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = 'pallene-vim',
    buffer = 0,
    --pattern = '*.pallene',
    once = true,
    callback = function()
      vim.bo.endofline = endofline
    end,
  })
end
EOF
