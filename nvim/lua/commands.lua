local golang_augroup_id = vim.api.nvim_create_augroup("golang", {clear = true})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    command = "nnoremap <buffer> <localleader>r :!go run .<CR>",
    group = golang_augroup_id
})

local lua_augroup_id = vim.api.nvim_create_augroup("lua", {clear = true})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    command = "nnoremap <buffer> <c-k> :call LuaFormat()<cr>",
    group = lua_augroup_id
})
vim.api.nvim_create_autocmd("BufWrite", {
    pattern = "*.lua",
    command = "call LuaFormat()",
    group = lua_augroup_id
})
