vim.cmd [[colorscheme catppuccin]]
-- Set border scroll off limit 
vim.opt.scrolloff = 10
vim.opt.signcolumn = 'yes'

-- Set tab width
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true


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


-- this doesn't actually work to override the kickstart config but the cmp mappings have to be changed for copilot right now.
-- I'm sure I can do something else but that's a problem for me in six months
-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<C-k>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-K>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
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

vim.keymap.set('n', '<C-Y>', '"+y<CR>', { desc = 'Yank to clipboard' })
