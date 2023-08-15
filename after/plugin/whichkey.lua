local config = {
    setup = {
        icons = {
            breadcrumb = "»",
            separator = "➜",
            group = " ",
        },
    },
    opts = {
        mode = "n",
        prefix = "<leader>",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = true,
    },
    maps = {
        c = { "<cmd>BufferKill<cr>", "Close Buffer" },
        e = { "<cmd>Ex<cr>", "Explorer" },
        h = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace all" },
        p = { "\"_dP", "Paste without copy" },
        q = { "<cmd>q!<cr>", "Quit" },
        w = { "<cmd>up<cr>", "Save" },
        b = {
            name = "Buffer",
            j = { "<cmd>BufferLinePick<cr>", "Jump" },
            w = { "<cmd>BufferWipeout<cr>", "Wipeout" },
            h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
            l = { "<cmd>BufferLineCloseRight<cr>", "Close all to the right" },
        },
        f = {
            name = "Finder",
            f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Files" },
            g = { "<cmd>lua require('telescope.builtin').git_files()<cr>", "Git Files" },
            s = {
                function()
                    require('telescope.builtin')
                        .grep_string({ search = vim.fn.input("Grep > ") })
                end,
                "Search"
            }
        },
        g = {
            name = "Git",
            l = { "<cmd>GitBlameOpenFileURL<cr>", "Open line url" },
            c = { "<cmd>GitBlameOpenCommitURL<cr>", "Open commit url" },
            C = { "<cmd>GitBlameCopySHA<cr>", "Copy commit SHA" },
        },
        l = {
            name = "LSP",
            a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
            e = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Dianogstics" },
            f = { "<cmd>lua vim.lsp.buf.format({async = false, timeout_ms = 10000})<cr>", "Format" },
            l = { "<cmd>LspInfo<cr>", "Info" },
            r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
            i = { "<cmd>Telescope lsp_references<cr>", "References" },
            I = { "<cmd>Telescope lsp_implementations<cr>", "Implementations" },
            d = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" },
            D = { "<cmd>Telescope lsp_type_definitions<cr>", "Type definitions" },
            s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        },
        t = {
            name = "Terminal",
            f = { "<cmd>ToggleTerm direction=float<cr>", "Terminal float" },
            b = { "<cmd>ToggleTerm direction=horizontal<cr>", "Terminal bottom" },
            t = { "<cmd>ToggleTerm<cr>", "Toggle" },
        },
        u = {
            name = "Utilities",
            j = { "<cmd>TSJToggle<cr>", "Toggle Splitting & Joining" },
            u = { "<cmd>UndotreeToggle<cr>", "Undo" },
        },
        v = {
            name = "View Split",
            v = { "<cmd>vs<cr>", "Split vertical" },
            h = { "<cmd>sp<cr>", "Split horizontal" },
        },
    },
}

local whichkey = require("which-key")

whichkey.setup(config.setup)
whichkey.register(config.maps, config.opts)
