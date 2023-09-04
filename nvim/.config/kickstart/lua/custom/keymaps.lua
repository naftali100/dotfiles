-- in insert mode, use ctrl+/ to add commnet
-- vim.api.nvim_set_keymap('i', '<C-/>', '<C-\\><C-o>:stopinsert<CR>:lua require("Comment.api").insert.blockwise.eol()<CR>', noremap = true, silent = false })
-- Map Alt+Up to move the current line up
-- inoremap <M-Up> <Esc>:m-2<CR>i
-- vim.keymap.set('i', '<M-Up>', '<Esc>:m-2<CR>i')
-- vim.keymap.set('i', '<M-k>', function()
--   print('in M-Up')
-- end)
-- -- Map Alt+Down to move the current line down
-- -- inoremap <M-Down> <Esc>:m+1<CR>i
-- vim.keymap.set('n', '<M-q>', function()
--   print('blalaflfa')
-- end)

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set("n", "Q", "<nop>")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- from ThePrimagen's dotfiles
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
