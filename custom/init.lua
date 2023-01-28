

use { "catppuccin/nvim", as = "catppuccin" }

-- Harpoon install
use { 'ThePrimeagen/harpoon', requires = { 'nvim-lua/plenary.nvim' } }
vim.cmd [[colorscheme catppuccin]]
-- Set border scroll off limit 
vim.opt.scrolloff = 10
vim.opt.signcolumn = 'yes'

require('catppuccin').setup ({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'catppuccin',
    component_separators = '|',
    section_separators = '',
  },
}

vim.keymap.set('n', '<leader>ma', require('harpoon.mark').add_file, { desc = '[M]ark [A]dd' })
vim.keymap.set('n', '<C-e>', require('harpoon.ui').toggle_quick_menu, { desc = 'Tooggl[e] Quick Menu' })
vim.keymap.set('n', '<C-p>', require('harpoon.ui').nav_prev, { desc = 'Goto [P]revious Mark' })
vim.keymap.set('n', '<C-n>', require('harpoon.ui').nav_next, { desc = 'Goto [N]ext Mark' })
vim.keymap.set('n', '<C-h>', function() require('harpoon.ui').nav_file(1)end, { desc = 'Quick Nav Mark 1' })
vim.keymap.set('n', '<C-j>', function() require('harpoon.ui').nav_file(2)end, { desc = 'Quick Nav Mark 2' })
vim.keymap.set('n', '<C-k>', function() require('harpoon.ui').nav_file(3)end, { desc = 'Quick Nav Mark 3' })
vim.keymap.set('n', '<C-l>', function() require('harpoon.ui').nav_file(4)end, { desc = 'Quick Nav Mark 4' })

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
