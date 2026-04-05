local function git_branch()
    local head = vim.b.gitsigns_head
    if head and head ~= '' then return ' %#Type# [' .. head .. ']%*' end
    return ''
end

local function git_diff()
    local s = vim.b.gitsigns_status_dict
    if not s then return '' end

    local parts = {}
    if (s.added or 0) > 0 then table.insert(parts, '%#DiffAdd#+' .. s.added .. '%*') end
    if (s.changed or 0) > 0 then table.insert(parts, '%#DiffChange#~' .. s.changed .. '%*') end
    if (s.removed or 0) > 0 then table.insert(parts, '%#DiffDelete#-' .. s.removed .. '%*') end

    if #parts == 0 then return '' end
    return ' ' .. table.concat(parts, ' ')
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

local function lsp_status()
    local clients = vim.lsp.get_clients { bufnr = 0 }
    if #clients == 0 then return '' end
    local names = {}
    for _, client in ipairs(clients) do
        table.insert(names, client.name)
    end
    return ' %#Type#[' .. table.concat(names, ', ') .. ']%*'
end


function _G.statusline()
    return table.concat {
        git_branch(),
        git_diff(),
        ' %t',
        vim.bo.modified and ' [+]' or '',
        diagnostics(),
        '%=',
        lsp_status(),
        vim.bo.filetype ~= '' and ' ' .. vim.bo.filetype or '',
    }
end

vim.o.statusline = '%!v:lua.statusline()'
