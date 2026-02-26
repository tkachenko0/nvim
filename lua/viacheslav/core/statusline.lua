local function git_branch()
  local head = vim.b.gitsigns_head
  if head and head ~= '' then return ' %#Type# ' .. head .. '%*' end
  return ''
end

local function diagnostics()
  local diags = vim.diagnostic.get(0)
  if vim.tbl_isempty(diags) then return '' end

  local counts = { E = 0, W = 0, H = 0, I = 0 }

  for _, d in ipairs(diags) do
    if d.severity == vim.diagnostic.severity.ERROR then counts.E = counts.E + 1 end
    if d.severity == vim.diagnostic.severity.WARN then counts.W = counts.W + 1 end
    if d.severity == vim.diagnostic.severity.HINT then counts.H = counts.H + 1 end
    if d.severity == vim.diagnostic.severity.INFO then counts.I = counts.I + 1 end
  end

  local parts = {}
  if counts.E > 0 then table.insert(parts, '%#DiagnosticError#E' .. counts.E .. '%*') end
  if counts.W > 0 then table.insert(parts, '%#DiagnosticWarn#W' .. counts.W .. '%*') end
  if counts.H > 0 then table.insert(parts, '%#DiagnosticHint#H' .. counts.H .. '%*') end
  if counts.I > 0 then table.insert(parts, '%#DiagnosticInfo#I' .. counts.I .. '%*') end

  return ' ' .. table.concat(parts, ' ')
end

local function filetype() return vim.bo.filetype ~= '' and ' ' .. vim.bo.filetype or '' end

function _G.statusline()
  return table.concat {
    git_branch(),
    ' %t',
    diagnostics(),
    '%=',
    filetype(),
  }
end

vim.o.statusline = '%!v:lua.statusline()'
