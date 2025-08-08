-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    { 'neoclide/coc.nvim', branch = 'release' },
    'NLKNguyen/papercolor-theme',
    'tmsvg/pear-tree',
    'lervag/vimtex',
    'pangloss/vim-javascript',
    'rebelot/kanagawa.nvim',
    'xiyaowong/transparent.nvim',
    {
        'iamcco/markdown-preview.nvim',
        build = 'cd app && npx --yes yarn install'
    },
    'mhinz/vim-startify',
    'mcchrish/nnn.vim',
--    'vim-airline/vim-airline'
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "kanagawa" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Filetype and syntax options
vim.cmd [[
    filetype plugin indent on
    syntax enable
]]

-- configure transparency
require("transparent").setup({
  exclude_groups = {
    "CursorLine",
    "StatusLine",
    "StatusLineNC",
  }
})

-- General settings

vim.cmd [[colorscheme habamax]]        -- Set colorscheme
vim.opt.termguicolors = true
vim.opt.number = true              -- Line numbers
vim.opt.showmatch = true           -- Show matching parentheses
vim.opt.mouse = 'a'                -- Enable mouse navigation
vim.opt.cursorline = true          -- Highlight current cursor line
vim.opt.autoindent = true          -- Maintain indentation on new line
vim.opt.ttyfast = true             -- Faster scrolling
vim.opt.wildmenu = true            -- Enhanced command-line completion
vim.opt.showmode = false           -- Disable mode on own line
-- vim.opt.showmode = false
-- vim.opt.wildmode = { 'longest', 'list' }
vim.opt.tabstop = 4                -- Set tab width to 4 spaces
vim.opt.shiftwidth = 4             -- Indent width of 4 spaces
vim.opt.expandtab = true           -- Use spaces instead of tabs
vim.opt.scrolloff = 999            -- Center cursor by filling 'scrolloff'

-- Define mode string function
function _G.mode_str()
  local mode_map = {
    n = "normal",
    i = "insert",
    v = "visual",
    V = "v-line",
    ["\22"] = "v-block",
    c = "command",
    R = "replace",
    s = "select",
    S = "s-line",
    ["\19"] = "s-block",
    t = "terminal",
  }
  local mode = vim.api.nvim_get_mode().mode
  return mode_map[mode] or mode
end

-- Set up the statusline
vim.o.statusline = "[%{%v:lua.mode_str()%}] [%f] %m %= %y [%l:%c] [%p%%]"

-- Tab behavior in insert mode
vim.keymap.set('i', '<TAB>', function()
    if vim.fn.pumvisible() == 1 then
        return vim.api.nvim_replace_termcodes('<C-y>', true, true, true)
    else
        return vim.api.nvim_replace_termcodes('<C-g>u<TAB>', true, true, true)
    end
end, { expr = true, noremap = true })

-- VimTeX configuration
vim.g.vimtex_quickfix_enabled = 1
vim.g.vimtex_quickfix_ignore_filters = { 'Underfull', 'Overfull', 'Warning' }

-- Split navigation shortcuts
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { silent = true })
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { silent = true })
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { silent = true })
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { silent = true })

-- Startify header configuration
local header_cmd = 'echo "Neovim!!"'
vim.g.startify_custom_header = vim.fn['startify#pad'](vim.split(vim.fn.system(header_cmd), '\n'))
