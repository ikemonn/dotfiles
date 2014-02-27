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
scriptencoding utf-8
" ctagの設定
set tags=.tags/;

" pasteオプショントグルをF5にする
set pastetoggle=<f5>
" swapファイルを作らない
set noswapfile

"-------------------------------------------------
"" insertモード時の設定
"-------------------------------------------------
" 対応する括弧を補完
inoremap { {}
inoremap [ []
inoremap ( ()
inoremap " ""
inoremap ' ''
" insertモードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" insertモードから抜ける
inoremap <silent> jj <ESC>
"-------------------------------------------------
"" ビジュアルモード時の設定
"-------------------------------------------------
vnoremap { "zdi{z}
vnoremap {" "zdi{"z"}
vnoremap {' "zdi{'z'}
vnoremap [ "zdi[z]
vnoremap [" "zdi["z"]
vnoremap [' "zdi['z']
vnoremap ( "zdi(z)
vnoremap (" "zdi("z")
vnoremap (' "zdi('z')
vnoremap " "zdi"z"
vnoremap ' "zdi'z''"





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
NeoBundle 'Shougo/vimfiler'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Shougo/unite-ssh'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'kakkyz81/evervim'
NeoBundle 'Source-Explorer-srcexpl.vim'
NeoBundle 'trinity.vim'
NeoBundle 'git://github.com/tsukkee/unite-tag.git'
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
 "-------------------------------------------------
 "" Qiita連携設定
 "-------------------------------------------------
 

function! s:open_kobito(...)
    if a:0 == 0
        call system('open -a Kobito '.expand('%:p'))
    else
        call system('open -a Kobito '.join(a:000, ' '))
    endif
endfunction

" 引数のファイル(複数指定可)を Kobitoで開く
" （引数無しのときはカレントバッファを開く
command! -nargs=* Kobito call s:open_kobito(<f-args>)
" Kobito を閉じる
command! -nargs=0 KobitoClose call system("osascript -e 'tell application \"Kobito\" to quit'")
" Kobito にフォーカスを移す
command! -nargs=0 KobitoFocus call system("osascript -e 'tell application \"Kobito\" to activate'")
 
 "-------------------------------------------------
 " VimFiler連携設定
 "-------------------------------------------------
" autocmd VimEnter * VimFiler -split -simple -winwidth=30 -no-quit
let g:vimfiler_as_default_explorer = 1 "セーフモードを無効にした状態
" unite#custom_default_action('source/bookmark/directory' , 'vimfiler') "VimFilerを通さなくてもUnite bookmark出来るようにする
nnoremap <F10> :VimFiler -split -simple -winwidth=35 -no-quit
nnoremap <F11> :UniteBookmarkAdd
nnoremap <F12> :Unite bookmark

"-------------------------------------------------
 " Tlist連携設定
 "-------------------------------------------------
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"  " ctagsのコマンド
let Tlist_Show_One_File = 1                         " 現在表示中のファイルのみのタグしか表示しない
let Tlist_Use_Right_Window = 1                    " 右側にtag listのウインドうを表示する
let Tlist_Exit_OnlyWindow = 1                      " taglistのウインドウだけならVimを閉じる

"-------------------------------------------------
" vim-gitgutterとlightline連携設定
"-------------------------------------------------
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '✘'

" lightline.vim
let g:lightline = {
        \ 'colorscheme': 'landscape',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [
        \     ['mode', 'paste'],
        \     ['fugitive', 'gitgutter', 'filename'],
        \   ],
        \   'right': [
        \     ['lineinfo', 'syntastic'],
        \     ['percent'],
        \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
        \   ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode',
        \   'syntastic': 'SyntasticStatuslineFlag',
        \   'charcode': 'MyCharCode',
        \   'gitgutter': 'MyGitGutter',
        \ },
        \ 'separator': {'left': '⮀', 'right': '⮂'},
        \ 'subseparator': {'left': '⮁', 'right': '⮃'}
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction
"-------------------------------------------------
"" vimDiff設定
"-------------------------------------------------
hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7
"-------------------------------------------------
"" tcommnet設定(http://qiita.com/alpaca_taichou/items/211cd62bee84c59ca480)
"-------------------------------------------------
" tcommentで使用する形式を追加
if !exists('g:tcomment_types')
  let g:tcomment_types = {}
endif
let g:tcomment_types = {
      \'php_surround' : "<?php %s ?>",
      \'eruby_surround' : "<%% %s %%>",
      \'eruby_surround_minus' : "<%% %s -%%>",
      \'eruby_surround_equality' : "<%%= %s %%>",
\}

" マッピングを追加
function! SetErubyMapping2()
  nmap <buffer> <C-_>c :TCommentAs eruby_surround<CR>
  nmap <buffer> <C-_>- :TCommentAs eruby_surround_minus<CR>
  nmap <buffer> <C-_>= :TCommentAs eruby_surround_equality<CR>

  vmap <buffer> <C-_>c :TCommentAs eruby_surround<CR>
  vmap <buffer> <C-_>- :TCommentAs eruby_surround_minus<CR>
  vmap <buffer> <C-_>= :TCommentAs eruby_surround_equality<CR>
endfunction

" erubyのときだけ設定を追加
au FileType eruby call SetErubyMapping2()
" phpのときだけ設定を追加
au FileType php nmap <buffer><C-_>c :TCommentAs php_surround<CR>
au FileType php vmap <buffer><C-_>c :TCommentAs php_surround<CR>
"-------------------------------------------------
"" Evervim設定
"-------------------------------------------------

"-------------------------------------------------
"" tags設定
"-------------------------------------------------
 "" tagsジャンプの時に複数ある時は一覧表示                                        
 nnoremap <C-]> g<C-]> 
