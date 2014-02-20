set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=4 "画面上でタブ文字が占める幅
" 行番号を表示
set number
" " インデント表示
set autoindent
" " 検索語のハイライト
set hlsearch
" " 行末の折り返し
set wrap
" " シンタックスハイライト
syntax on
" " シンタックスで折りたたみ
set foldmethod=syntax
" " php 関数・クラスで折りたたみ
let php_folding = 1
" " 文字コード設定
set encoding=utf-8
" ctagの設定
set tags=.tags/;

if has('vim_starting')
          set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif

  call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'


filetype plugin on

NeoBundleCheck
" ここにインストールしたいプラグインのリストを書く
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'altercation/solarized'
NeoBundle 'vim-scripts/newspaper.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'szw/vim-tags'
NeoBundle 'FuzzyFinder'
NeoBundle 'L9'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim'
filetype plugin on
filetype indent on


"-------------------------------------------------
"" neocomplcache設定
"-------------------------------------------------
""辞書ファイル
autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dictionary/php.dict filetype=php
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'
"-------------------------------------------------
"" PHP設定
"-------------------------------------------------
""" PHP用設定 """
" :makeでPHP構文チェック
au FileType php setlocal makeprg=php\ -l\ %
au FileType php setlocal errorformat=%m\ in\ %f\ on\ line\ %l
"
" PHPの関数やクラスの折りたたみ(非常に重い）
let php_folding = 0

" 文字列の中のSQLをハイライト
let php_sql_query = 1

" Baselibメソッドのハイライト
let php_baselib = 1

" HTMLもハイライト
let php_htmlInStrings = 1

" <? を無効にする→ハイライト除外にする
let php_noShortTags = 1

" ] や ) の対応エラーをハイライト
let php_parent_error_close = 1
let php_parent_error_open = 1

""" scrooloose/syntasticの設定 """
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1
let g:syntastic_php_php_args = '-l'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


"""thinca/vim-refの設定 """
let g:ref_phpmanual_path = $HOME . '/.vim/refs/php-chunked-xhtml'
""tomasr/molokaiの設定 """
colorscheme molokai
" set background=dark
let g:molokai_original = 1

"""szw/vim-tagsの設定"""
let g:vim_tags_project_tags_command = "/opt/local/bin/ctags -R {OPTIONS} {DIRECTORY} 2>/dev/null"
let g:vim_tags_gems_tags_command = "/opt/local/bin/ctags -R {OPTIONS} `bundle show --paths` 2>/dev/null"
"-------------------------------------------------
"" FuzzyFinder設定
"-------------------------------------------------
let g:fuf_keyOpen = '<Tab>'
let g:fuf_keyOpenTabpage = '<CR>'

"-------------------------------------------------
"" vim-quickhl設定
"-------------------------------------------------
" <Space>m でカーソル下の単語、もしくは選択した範囲のハイライトを行う
" 再度 <Space>m を行うとカーソル下のハイライトを解除する
" これは複数の単語のハイライトを行う事もできる
" <Space>M で全てのハイライトを解除する
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

 "-------------------------------------------------
 "" Vimスカウター設定
 "-------------------------------------------------
 function! Scouter(file, ...)
           let pat = '^\s*$\|^\s*"'
             let lines = readfile(a:file)
               if !a:0 || !a:1
                           let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
                             endif
                               return len(filter(lines,'v:val !~ pat'))
                       endfunction
                       command! -bar -bang -nargs=? -complete=file Scouter
                                               \        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)
                       command! -bar -bang -nargs=? -complete=file GScouter
                                               \        echo Scouter(empty(<q-args>) ? $MYGVIMRC : expand(<q-args>), <bang>0)
