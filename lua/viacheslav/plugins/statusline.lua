local function git_branch()
  local branch = vim.fn.system "git branch --show-current 2>/dev/null | tr -d '\n'"
  return branch ~= '' and ' %#Type#[' .. branch .. ']%*' or ''
end

local function diagnostics()
  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

  local parts = {}
  if errors > 0 then table.insert(parts, '%#DiagnosticError#E:' .. errors .. '%*') end
  if warnings > 0 then table.insert(parts, '%#DiagnosticWarn#W:' .. warnings .. '%*') end
  if hints > 0 then table.insert(parts, '%#DiagnosticHint#H:' .. hints .. '%*') end
  if info > 0 then table.insert(parts, '%#DiagnosticInfo#I:' .. info .. '%*') end

  return #parts > 0 and ' ' .. table.concat(parts, ' ') or ''
end

function _G.statusline()
  return table.concat {
    git_branch(),
    ' %t',
    diagnostics(),
    '%=',
    '%y',
  }
end

vim.o.statusline = '%!v:lua.statusline()'

return {}
