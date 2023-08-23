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
        [","] = { "<cmd>BufferLineCyclePrev<cr>", "Prev Buffer" },
        ["."] = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer" },
        e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
        h = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace all" },
        q = { "<cmd>q!<cr>", "Quit" },
        s = { "<cmd>up<cr>", "Save" },
        b = {
            name = "Buffer",
            r = { "<cmd>BufferLineSortByDirectory<cr>", "Re-ordering" },
            p = { "<cmd>BufferLinePick<cr>", "Pick" },
            P = { "<cmd>BufferLinePickClose<cr>", "Pick Close" },
            C = { "<cmd>BufferLineCloseOthers<cr>", "Close others" },
        },
        d = {
            name = "Document",
            m = { ":MarkdownPreviewToggle<cr>", "Markdown Toggle" },
            M = { ":MarkdownPreviewStop<cr>", "Markdown Close" },
            p = { "<cmd>!pandoc -o %:r.pdf %<cr><cr>", "To PDF" },
            P = { "<cmd>!pandoc -o %:r.pdf %<cr>", "To PDF cmd" },
        },
        f = {
            name = "Finder",
            a = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Files" },
            f = { "<cmd>lua require('telescope.builtin').git_files()<cr>", "Git Files" },
            s = { function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") }) end, "Search" }
        },
        g = {
            name = "Git",
            g = { "<cmd>lua require('gitsigns').next_hunk()<cr>", "Next hunk" },
            G = { "<cmd>lua require('gitsigns').prev_hunk()<cr>", "Previous hunk" },
            p = { "<cmd>lua require('gitsigns').preview_hunk()<cr>", "Preview hunk" },
            r = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "Reset hunk" },
            R = { "<cmd>lua require('gitsigns').reset_buffer()<cr>", "Reset buffer" },
            s = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "Stage hunk" },
            S = { "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", "Undo stage hunk" },

            f = { ":DiffviewFileHistory %<CR>", "File history %" },
            F = { ":DiffviewFileHistory<CR>", "File history" },
            d = { ":DiffviewOpen<CR>", "Git diff" },
            q = { ":DiffviewClose<CR>", "Close Git diff" },

            l = { "<cmd>GitBlameOpenFileURL<cr>", "Open line url" },
            c = { "<cmd>GitBlameOpenCommitURL<cr>", "Open commit url" },
            C = { "<cmd>GitBlameCopySHA<cr>", "Copy commit SHA" },
        },
        l = {
            name = "LSP",
            a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
            e = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Dianogstics" },
            f = { "<cmd>lua vim.lsp.buf.format({async = false, timeout_ms = 10000})<cr>", "Format" },
            r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
            i = { "<cmd>Telescope lsp_references<cr>", "References" },
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
            j = { "<cmd>lua require('treesj').toggle()<cr>", "Toggle Splitting & Joining" },
            o = { "<cmd>!open %<cr><cr>", "Open with default app" },
            u = { "<cmd>UndotreeToggle<cr>", "Undo" },
        },
        v = {
            name = "View Split",
            v = { "<cmd>vs<cr>", "Split vertical" },
            h = { "<cmd>sp<cr>", "Split horizontal" },
        },
        w = {
            name = "Window",
            ["j"] = { "<C-w>j", "Navigate down" },
            [","] = { "<C-w>h", "Navigate left" },
            ["."] = { "<C-w>l", "Navigate right" },
            ["k"] = { "<C-w>k", "Navigate up" },
            ["w"] = { "<C-w>w", "Navigate next" },
        },
    },
}

local whichkey = require("which-key")

whichkey.setup(config.setup)
whichkey.register(config.maps, config.opts)
