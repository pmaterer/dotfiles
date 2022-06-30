local map = vim.keymap.set
local default_options = {noremap = true, silent = true}
local cmd = vim.cmd

map('n', '<leader>sv', ':source $MYVIMRC<cr>', default_options)

-- movement
map('n', 'H', '^', default_options)
map('n', 'L', '$', default_options)

-- delete line
map('n', '<C-d>', 'dd', default_options)
map('i', '<C-d>', '<esc>ddi', default_options)

-- uppercase word
map('n', '<C-u>', 'viwU', default_options)
map('i', '<C-u>', '<esc>viwUi', default_options)

-- save/quit
map('n', '<C-q>', ':qa!<cr>', default_options)
map('n', '<C-s>', ':w<cr>', default_options)

-- disable arrow keys
map('n', '<up>', '<nop>', default_options)
map('n', '<right>', '<nop>', default_options)
map('n', '<down>', '<nop>', default_options)
map('n', '<left>', '<nop>', default_options)

-- window switching
map('n', '<C-h>', '<C-w>h', default_options)
map('n', '<C-j>', '<C-w>j', default_options)
map('n', '<C-k>', '<C-w>k', default_options)
map('n', '<C-l>', '<C-w>l', default_options)

-- folding
map('n', '<F9>', 'za', default_options)

-- quote word
map('n', '<leader>"', 'viw<esc>a"<esc>bi"<esc>lel', default_options)
map('n', '<leader>\'', 'viw<esc>a\'<esc>bi\'<esc>lel', default_options)

-- quote visual selection
map('v', '<leader>"', '<esc>a"<esc>`<i"<esc>', default_options)
map('v', '<leader>"', '<esc>a\'<esc>`<i\'<esc>', default_options)

-- abbreviations
cmd('iabbrev adn and')
cmd('iabbrev waht what')
cmd('iabbrev tehn then')

cmd('iabbrev @@ materer@protonmail.com')

-- file explorer
map('n', '<C-n>', ':NvimTreeToggle<CR>', default_options)
map('n', '<leader>r', ':NvimTreeRefresh<CR>', default_options)
map('n', '<leader>n', ':NvimTreeFindFile<CR>', default_options)
