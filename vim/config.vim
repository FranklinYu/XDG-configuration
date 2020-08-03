set number ruler
syntax on

" set location for backup and temporary file (default is `.`)
" from: http://vim.wikia.com/wiki/Remove_swap_and_backup_files_from_your_working_directory
set backupdir=./.backup,/tmp,.
set directory=./.backup,/tmp,.

set viminfo+=n~/.cache/vim/info

autocmd BufRead,BufNewFile Podfile set filetype=ruby

" set indentation for each filetypes
" may use `filetype plugin indent on` and additional files to reach same result
" from: http://vim.wikia.com/wiki/Indenting_source_code#Different_settings_for_different_file_types
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType zsh setlocal shiftwidth=4 tabstop=4
autocmd FileType c setlocal shiftwidth=4 tabstop=4
autocmd FileType cpp setlocal shiftwidth=4 tabstop=4

filetype indent plugin on

set runtimepath+=~/.config/vim,~/.config/vim/local
