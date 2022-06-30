local golang_augroup_id = vim.api.nvim_create_augroup("Golang", {clear = true})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    command = "nnoremap <buffer> <localleader>r :!go run .<CR>",
    group = golang_augroup_id
})
