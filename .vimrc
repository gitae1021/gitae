set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


""dirdff
Plugin 'will133/vim-dirdiff'
let g:DirDiffExcludes = ".svn,tags,*.pyc"

call vundle#end()            " required
filetype plugin indent on    " required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Basic
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set mouse=a
set expandtab
set nocompatible	"vi와 호환하지 않음
set encoding=utf-8
set fencs=utf-8,euc-kr,utf-16le
set fileencoding=utf-8

syntax on			"문법 색깔 바꿔줌
filetype indent on	"파일 종류에 따른 구문강조

"" Spacing
set tabstop=4		"tab을 4칸으로
set shiftwidth=4	"<<, >>를 눌렀을 때 몇칸을 이동할 것인가?
set softtabstop=4	"TAB을 눌렀을 때 몇칸을 갈 것인가?
"set et				"tab 대신 space 삽입

set nobackup
set noswapfile

set cursorline		"밑줄 보여줌
set nu				"라인 숫자 보여줌
set ruler			"커서의 위치를 항상 보이게 함

"" Seraching
set incsearch 		"키워드 입력시 점진적 검색
set hlsearch		"검색시 하이라이트
set ignorecase		"검색시 대소문자 구별 안 함

set mps+=<:>            " 괄호 짝 <> 추가

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Tags and filetype
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au BufRead *
			\ if &filetype != 'svn' && line("'\"") > 0 && line("'\"") <= line("$") |
			\    exe "norm g'\"" |
			\ endif

set tags+=./tags;$HOME

augroup Filetype
	au!
	au BufRead,BufNewFile	*{Makefile,makefile}*		set filetype=make
	au BufRead,BufNewFile	*.{ll,bc}					set filetype=llvm
	au BufRead,BufNewFile	*.td						set filetype=tablegen
	au BufRead,BufNewFile	*.rst						set filetype=rest
	au BufRead,BufNewFile	*.html						set filetype=html
	au BufRead,BufNewFile	*.scala						set filetype=scala
	au BufRead,BufNewFile	*.tex						set filetype=tex
	au BufRead,BufNewFile	*.md						set filetype=markdown
	au BufRead,BufNewFile	*.{gnuplot,gp}				set filetype=gnuplot
	" au BufRead,BufNewFile config                    set filetype=config
	au BufRead,BufNewFile	*.cl						set filetype=opencl
	au BufRead,BufNewFile	*.{dat,data,csv}			set filetype=csv
	au BufRead,BufNewFile	*.gdb						set filetype=gdb
	au BufRead,BufNewFile	*.python					set filetype=python
	au BufRead,BufNewFile	*.bb						set filetype=sh
	au BufRead,BufNewFile	*.bbclass					set filetype=python
	au BufRead,BufNewFile	*.isa						set filetype=cpp 
				" \ | exec ":call SyntaxRange#Include('^def', '}}', 'python')"
	au BufRead,BufNewFile	*.{patch,diff}				set filetype=diff
				\ | set noexpandtab


augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Colorscheme
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256
colorscheme molokai
" colorscheme peachpuff 
set colorcolumn=80

hi SpecialKey       ctermfg=239
hi Statement        ctermfg=161                     cterm=bold
hi StatusLine       ctermfg=233     ctermbg=251     cterm=none
hi StatusLineNC     ctermfg=234     ctermbg=251
hi Visual							ctermbg=8		cterm=none
hi Normal           ctermfg=15      ctermbg=232
hi Comment          ctermfg=244
hi CursorLine                       ctermbg=232	    cterm=underline
hi CursorLineNr     ctermfg=9	    ctermbg=232	    cterm=bold
hi LineNr           ctermfg=250     ctermbg=232
hi NonText          ctermfg=250     ctermbg=232
hi ColorColumn						ctermbg=234
hi DiffAdd							ctermbg=22
hi clear DiffChange
hi DiffDelete		ctermfg=52		ctermbg=232
hi DiffText							ctermbg=52		cterm=none


"colorscheme peachpuff	"colorscheme use


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" comment
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let t:Comment="#"
let t:Uncomment="#"
let t:CommentEnd=''
let t:UncommentEnd=''
let t:textw=80
let t:Space=" "

augroup AutoComment
	au!
	au FileType c,cpp,verilog,php,javascript,html,idl,opencl,css,scala
				\ let t:Comment='//'      |
				\ let t:Uncomment='\/\/'
	au FileType asm,sh,python,bash,ruby,perl
				\ let t:Comment='#'     |
				\ let t:Uncomment='#'
	au FileType tex
				\ let t:Comment='%'     |
				\ let t:Uncomment='%'   
	au FileType bib
				\ let t:Comment='%'     |
				\ let t:Uncomment='%'   |
				\ let t:Space=""
	au FileType vim
				\ let t:Comment='"'     |
				\ let t:Uncomment='"'
	au FileType ini,llvm
				\ let t:Comment=';'     |
				\ let t:Uncomment=';'   
	au FileType lua
				\ let t:Comment='--'     |
				\ let t:Uncomment='--'   
augroup END

let t:compile_cmd="make"
augroup SmartConfig
	au BufRead,BufNewFile $GEM5/*
				\	let t:compile_cmd="cd $GEM5 && scons build/ALPHA/gem5.opt -j4"
				\ | set tags +=$BRANCH/gem5/src/tags
	au BufRead,BufNewFile $BRANCH/lua-5.3.0/*		set ts=2 sw=2 sts=2
				\ | set tags +=$BRANCH/
	au BufRead,BufNewFile $BRANCH/mozjs17.0.0/*
				\	let t:compile_cmd="cd $BRANCH/mozjs17.0.0/js/src/alpha && ./build.sh"
				\ | set tags +=$BRANCH/mozjs17.0.0/js/src/tags
	au BufRead,BufNewFile */alphaev67*
				\	set noexpandtab
				\ | set tabstop=8
				\ |	set shiftwidth=8
				\ | set softtabstop=8
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Shortcuts
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map     <F8>        :set spell!<CR>
" let mapleader="`"

noremap  <silent> <Tab><Tab>	<C-w><C-w>
noremap  <silent> <leader>t		:TagbarToggle<CR>
noremap  <silent> <leader>e		:NERDTreeToggle<CR>
noremap  <silent> <leader>\		:call CommentToggle()<CR>
noremap  <silent> <leader>c		:call CopyToggle()<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)))

" <C-t>	jump back from definition
" <C-]> go to definition
" <C-w ]>	split window and go do definition
" <C-A>	visual increment


command! Trim       :%s/\s\+$//
command! Html       :call Html()
command! CSVAlign   :call CSVAlign()
command! CommentToggle   :call CommentToggle()
command! Make   :call SmartCompile()


let g:html_font='Consolas'
function! Html()
	exe ':IndentLinesDisable'
	exe ':set nonu'
	exe ':colorscheme github'
	exe ':runtime! /syntax/2html.vim'
endfunction


function! CSVAlign()
	exe ':silent %!column -t'
endfunction


function! CommentToggle()
	if getline(".") =~ '^\s*'.t:Uncomment.t:Space
		exe ":norm ^".strlen(t:Comment.t:Space)."x"
	elseif getline(".") =~ '^\s*'.t:Uncomment.t:Uncomment
		" nothing
	elseif (strlen(getline(".")) > 0)
		exe ":norm^i".t:Comment.t:Space
	endif
endfunction

function! CopyToggle()
	echo &mouse
	if &mouse == 'a'
		exe ':IndentLinesDisable'
		exe ':set nonu'
		exe ':set mouse='
	else
		exe ':IndentLinesEnable'
		exe ':set nu'
		exe ':set mouse=a'
	endif
endfunction

function! Syntax()
	exe ':syntax sync fromstart'
endfunction

function! Color()
	let num = 255
	while num >= 0
		exec 'hi col_'.num.' ctermbg='.num.' ctermfg=white'
		exec 'syn match col_'.num.' "ctermbg='.num.':...." containedIn=ALL'
		call append(0, 'ctermbg='.num.':....')
		let num = num - 1
	endwhile
endfunction

function! SmartCompile()
	exe ':!'.t:compile_cmd
endfunction

