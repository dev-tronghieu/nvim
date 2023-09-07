local function lsp()
    -- return list of active clients
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return "No Active LSP"
    end

    local names = {}
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, vim.bo.filetype) ~= -1 then
            table.insert(names, client.name)
        end
    end
    if next(names) == nil then
        return "No Active LSP"
    end

    return "[" .. table.concat(names, ",") .. "]"
end

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { lsp, "filetype" },
        lualine_y = { "location" },
        lualine_z = { "os.date('%b %d %H:%M:%S')" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    inactive_winbar = {},
    extensions = {},
})
