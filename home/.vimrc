" from http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" se nu
" set autoindent

syntax off
set number  " show line numbers
set ruler " show ruler at bottom right
set incsearch  " search as characters are entered
set hlsearch  " highlight matches

" redefine tab as 4 spaces https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
