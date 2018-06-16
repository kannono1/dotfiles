set noswapfile
set nobackup
set hidden "buffer hidden にするとバッファ移動時に未保存でも警告でない。
set encoding=utf-8
set fileencodings=iso-2022-jp,utf-8,euc-jp,sjis
set tabstop=4 "ファイル中の<tab>文字を、見た目で何文字分に展開するかの値
set shiftwidth=4 "vimが自動で挿入するインデントの値。cindent,autoindentなど
set softtabstop=0 "キーボードで入力した<tab>で挿入される空白の量。値が0の場合、tabstopの値が適用される。
set noexpandtab "tabの入力をspaceに置き換える
set whichwrap=b,s,<,>,[,] "左右のカーソル移動で行間移動可能にする。
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set list " TAB, 行末のスペースを表示する
set listchars=tab:▸\ ,extends:<,trail:- " Listモード (訳注: オプション 'list' がオンのとき) に使われる文字を設定する。
set clipboard=unnamed,autoselect
if has("syntax") " 全角スペース・行末のスペース・タブの可視化
    syntax on
    syn sync fromstart " PODバグ対策
    function! ActivateInvisibleIndicator()
        syntax match InvisibleJISX0208Space "　" display containedin=ALL
        highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
        syntax match InvisibleTrailedSpace "[ ]\+" display containedin=ALL
        highlight InvisibleTrailedSpace term=underline ctermbg=gray guibg=#333333 guisp=gray3
        highlight SpecialKey guifg=#333333
    endfunction
    augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
    augroup END
endif
nmap <silent> <Esc><Esc> :nohlsearch<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-Tab>   gt
nnoremap <C-S-Tab> gT
nnoremap <Space>p "0p
nnoremap <Space>P "0P
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap jj <Esc>
augroup filetype_as " Actionscript syntax
	autocmd!
augroup END
au filetype_as BufNewFile,BufRead *.as set filetype=actionscript

