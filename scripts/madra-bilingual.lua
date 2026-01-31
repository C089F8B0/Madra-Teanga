-- Madra Bilingual View Plugin
-- Toggle the view of the corresponding English file from the Béarla branch.

local M = {}

-- Mapping definition: Irish filename/dir -> English filename/dir
-- This simple replacement strategy relies on unique segment names.
local replacements = {
    ["feidhmchlár"] = "app",
    ["comhéadan"] = "ui",
    ["scáileáin"] = "screens",
    ["giuirléidí"] = "widgets",
    ["teagmhais.cljd"] = "events.cljd",
    ["bunachar.cljd"] = "db.cljd",
    ["síntiúis.cljd"] = "subs.cljd",
    ["éifeachtaí.cljd"] = "effects.cljd",
    ["príomh.cljd"] = "main.cljd",
    ["ceachtanna.cljd"] = "lessons.cljd",
    ["coitianta.cljd"] = "common.cljd",
}

-- Resolve the English path from the current Irish path
local function get_english_path(irish_path)
    local english_path = irish_path
    for irish, english in pairs(replacements) do
        -- Use simple string replacement. 
        -- Note: This might replace substrings incorrectly if names overlap, 
        -- but given the specific vocabulary it should be safe for this project.
        english_path = string.gsub(english_path, irish, english)
    end
    return english_path
end

local english_buf = nil
local english_win = nil

function M.toggle_english_view()
    -- 1. Check if view is already open; if so, close it.
    if english_win and vim.api.nvim_win_is_valid(english_win) then
        vim.api.nvim_win_close(english_win, true)
        english_win = nil
        english_buf = nil
        print("Madra: English view closed.")
        return
    end

    -- 2. Get current file path (relative to git root ideally)
    local current_file = vim.fn.expand("%:.") -- Relative to CWD
    
    -- 3. Calculate English path
    local english_path = get_english_path(current_file)
    print("Madra: Fetching " .. english_path .. " from Béarla branch...")

    -- 4. Fetch content from git
    -- Command: git show Béarla:<path>
    local cmd = "git show Béarla:" .. english_path
    local handle = io.popen(cmd)
    local content = handle:read("*a")
    handle:close()

    if not content or content == "" or string.match(content, "^fatal:") then
        print("Madra: Could not find " .. english_path .. " in Béarla branch.")
        return
    end

    -- 5. Create a scratch buffer
    english_buf = vim.api.nvim_create_buf(false, true) -- no file, scratch
    vim.api.nvim_buf_set_lines(english_buf, 0, -1, false, vim.split(content, "\n"))
    
    -- 6. Set syntax/filetype (copy from current buffer)
    local ft = vim.bo.filetype
    vim.api.nvim_buf_set_option(english_buf, "filetype", ft)
    vim.api.nvim_buf_set_name(english_buf, "Béarla: " .. english_path)

    -- 7. Open split window (right)
    vim.cmd("botright vsplit")
    english_win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(english_win, english_buf)
    
    -- Optional: Make it read-only
    vim.api.nvim_buf_set_option(english_buf, "readonly", true)
    vim.api.nvim_buf_set_option(english_buf, "modifiable", false)
    
    -- Return focus to original window? Or stay in English view?
    -- Usually better to stay in code, so verify usage.
    -- Let's jump back to previous window for convenience.
    vim.cmd("wincmd k")
end

-- Create user command
vim.api.nvim_create_user_command('MadraToggle', M.toggle_english_view, {})

return M
