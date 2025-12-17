local session_dir = vim.fn.stdpath("data") .. "/sessions"
vim.fn.mkdir(session_dir, "p")

-- Detect if Neovim is opened by Git (commit, rebase, merge)
local function is_git_session()
    -- Git sets this env var when invoking the editor
    if vim.env.GIT_DIR ~= nil then
        return true
    end

    -- Common git-related buffer names
    local bufname = vim.fn.expand("%:t")
    local git_buffers = {
        "COMMIT_EDITMSG",
        "MERGE_MSG",
        "git-rebase-todo",
    }

    for _, name in ipairs(git_buffers) do
        if bufname == name then
            return true
        end
    end

    return false
end

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

-- Save session on exit (skip git sessions)
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        if is_git_session() then
            return
        end
        vim.cmd("mksession! " .. vim.fn.fnameescape(session_name()))
    end,
})

-- Load session after startup is complete (skip git sessions)
vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        if is_git_session() then
            return
        end

        local session = session_name()
        if vim.fn.filereadable(session) == 1 then
            vim.schedule(function()
                vim.cmd("source " .. vim.fn.fnameescape(session))
            end)
        end
    end,
})
