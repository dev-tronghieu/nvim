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
		["w"] = { "<cmd>up<cr>", "Save" },
		["q"] = { "<cmd>q!<cr>", "Quit" },
        ["h"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace all" },
        ["p"] = { "\"_dP", "Paste without copy" },
		["c"] = { "<cmd>BufferKill<CR>", "Close Buffer" },
		b = {
			name = "Buffer",
			j = { "<cmd>BufferLinePick<CR>", "Jump" },
			f = { "<cmd>Telescope buffers theme=dropdown<CR>", "Find" },
			w = { "<cmd>BufferWipeout<CR>", "Wipeout" },
			h = { "<cmd>BufferLineCloseLeft<CR>", "Close all to the left" },
			l = { "<cmd>BufferLineCloseRight<CR>", "Close all to the right" },
		},
		T = {
			name = "Treesitter",
		},
		f = {
			name = "Finder",
		},
		g = {
			name = "Git",
		},
		k = {
			name = "Terminal",
			k = { "<cmd>ToggleTerm direction=float<CR>", "Terminal float" },
			l = { "<cmd>ToggleTerm direction=vertical<CR>", "Terminal left" },
			j = { "<cmd>ToggleTerm direction=horizontal<CR>", "Terminal bottom" },
			h = { "<cmd>ToggleTerm direction=tab<CR>", "Terminal tab" },
		},
	},
}

local whichkey = require("which-key")

whichkey.setup(config.setup)
whichkey.register(config.maps, config.opts)
