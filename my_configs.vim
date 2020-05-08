""""""""""""""""""""""""""""""
" Enable Mouse Support
""""""""""""""""""""""""""""""

set mouse=a

""""""""""""""""""""""""""""""
" => FZF
""""""""""""""""""""""""""""""
let g:ctrlp_map = ''
set rtp+=/usr/local/opt/fzf
map <C-f> <Esc><Esc>:Files!<CR>
inoremap <C-f> <Esc><esc>:BLines!<CR>
map <C-g> <Esc><Esc>:BCommits!<CR>
map <C-b> <Esc><Esc>:Buffers!<CR>

""""""""""""""""""""""""""""""
" => LanguageClient-neovim
""""""""""""""""""""""""""""""
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => deoplete
"
" Note: This seems to require `:UpdateRemotePlugins` on new installations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('python3')
  let g:deoplete#enable_at_startup = 1
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ deoplete#mappings#manual_complete()
  function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction"}}}
endif
