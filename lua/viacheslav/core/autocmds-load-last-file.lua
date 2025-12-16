local session_dir = vim.fn.stdpath("data") .. "/sessions"
vim.fn.mkdir(session_dir, "p")

local function project_root()
    local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    if vim.v.shell_error == 0 then
        return git_root
    end
    return vim.fn.getcwd()
end

local function session_name()
    return session_dir
        .. "/"
        .. project_root():gsub("/", "%%")
        .. ".vim"
end

-- Save session on exit
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        vim.cmd("mksession! " .. vim.fn.fnameescape(session_name()))
    end,
})

-- Load session AFTER startup is complete
vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        local session = session_name()
        if vim.fn.filereadable(session) == 1 then
            vim.schedule(function()
                vim.cmd("source " .. vim.fn.fnameescape(session))
            end)
        end
    end,
})
