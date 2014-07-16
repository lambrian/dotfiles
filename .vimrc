set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

"Set highlighting
syntax enable
au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars "Handlebars indent/highlight

"colorscheme
colorscheme solarized
set background=dark

"Display line number
set number
set ruler

"Indentation
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smartindent

"Maps ;; to the escape key
imap ;; <Esc>

"Disables the arrow keys. Learn to use the home row!
inoremap   <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>l :call RunTestFile()<cr>
noremap <leader>; :call RunNearestTest()<cr>
noremap <leader>o :call RunTests('')<cr>

function! RunTestFile(...)
  if a:0
      let command_suffix = a:1
  else
      let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  let in_lotus_test_file = match(expand("%"), '\(_spec.js\)$') != -1
  if in_test_file
    :silent !echo 'in_test_file'
    call SetTestFile()
    call RunTests(t:grb_test_file . command_suffix)
  elseif !exists("t:grb_test_file")
    :silent !echo 'else'
    let t:grb_test_file = AlternateForCurrentFile()
    call RunTests(t:grb_test_file . command_suffix)
  end
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTests(filename)
  " Write the file and run tests for the given filename

  if filereadable(a:filename)
    :w
  end

  :silent !echo;echo;echo;
  :silent !echo '-----------------------';

  if match(a:filename, '_test\.rb$') != -1
      exec ":!testrbl " . a:filename
  else
      exec ":!bundle exec rspec " . a:filename
  end
endfunction

