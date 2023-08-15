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
        u = { "<cmd>UndotreeToggle<cr>", "Undo" },
        w = { "<cmd>up<cr>", "Save" },
        b = {
            name = "Buffer",
            j = { "<cmd>BufferLinePick<CR>", "Jump" },
            f = { "<cmd>Telescope buffers theme=dropdown<CR>", "Find" },
            w = { "<cmd>BufferWipeout<CR>", "Wipeout" },
            h = { "<cmd>BufferLineCloseLeft<CR>", "Close all to the left" },
            l = { "<cmd>BufferLineCloseRight<CR>", "Close all to the right" },
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
        },
		t = {
			name = "Terminal",
			k = { "<cmd>ToggleTerm direction=float<CR>", "Terminal float" },
			l = { "<cmd>ToggleTerm direction=vertical<CR>", "Terminal left" },
			j = { "<cmd>ToggleTerm direction=horizontal<CR>", "Terminal bottom" },
			h = { "<cmd>ToggleTerm direction=tab<CR>", "Terminal tab" },
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
