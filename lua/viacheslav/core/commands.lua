vim.api.nvim_create_user_command('Kiro', function(opts)
  local question = opts.args
  vim.cmd('split | terminal kiro-cli chat "' .. question .. '"')
end, { nargs = 1 })

vim.api.nvim_create_user_command('KiroSelection', function()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local lines = vim.fn.getline(start_pos[2], end_pos[2])

  if #lines == 1 then
    lines[1] = string.sub(lines[1], start_pos[3], end_pos[3])
  else
    lines[1] = string.sub(lines[1], start_pos[3])
    lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
  end

  local text = table.concat(lines, '\n'):gsub('"', '\\"')
  vim.cmd('split | terminal kiro-cli chat "' .. text .. '"')
end, { range = true })
