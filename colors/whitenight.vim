" __        ___     _ _         _   _ _       _     _
" \ \      / / |__ (_) |_ ___  | \ | (_) __ _| |__ | |_
"  \ \ /\ / /| '_ \| | __/ _ \ |  \| | |/ _` | '_ \| __|
"   \ V  V / | | | | | ||  __/ | |\  | | (_| | | | | |_
"    \_/\_/  |_| |_|_|\__\___| |_| \_|_|\__, |_| |_|\__|
"                                       |___/
"
" A dark and colorful color scheme for GVim.
"
" Author:  Jason White
" License: Public Domain
"
" TODO: Get it working on plain-old Vim.


" Initialization
set background=dark
highlight clear
if exists('syntax_on')
	syntax reset
endif
let g:colors_name = 'whitenight'

if has('gui_running')
	let s:vmode = 'gui'
else
	let s:vmode = 'cterm'
endif


" Colors
" TODO: Add terminal colors
let s:cols = {
\	'basebg':  ['#090d0f'],
\	'base03':  ['#25353e'],
\	'base02':  ['#435f70'],
\	'base01':  ['#586e75'],
\	'base00':  ['#657b83'],
\	'base0':   ['#839496'],
\	'base1':   ['#93a1a1'],
\	'base2':   ['#eee8d5'],
\	'base3':   ['#ffffff'],
\	'yellow':  ['#fff000'],
\	'orange':  ['#ff6400'],
\	'red':     ['#ff3a36'],
\	'magenta': ['#e73b8e'],
\	'violet':  ['#8d94ff'],
\	'blue1':   ['#00aeff'],
\	'blue2':   ['#87b8dd'],
\	'green':   ['#a1e10a'],
\}


" Helper function to set highlight colors.
" Arguments: group, guifg/ctermfg, guibg/ctermfg, gui, guisp
function! s:hi(group, fg, ...)
	let str = 'highlight '. a:group

	" Foreground color
	if strlen(a:fg)
		let c = get(s:cols, a:fg, [a:fg, a:fg])
		let str .= ' guifg='. c[0]
	else
		let str .= ' guifg=NONE'
	endif

	" Background color
	if a:0 >= 1 && strlen(a:1)
		let c = get(s:cols, a:1, [a:1, a:1])
		let str .= ' guibg='. c[0]
	else
		let str .= ' guibg=NONE'
	endif

	" Font attributes (bold, italic, etc.)
	if a:0 >= 2 && strlen(a:2)
		let str .= ' gui='. a:2 .' cterm='. a:2
	else
		let str .= ' gui=NONE cterm=NONE'
	endif

	" Underline/undercurl color
	if a:0 >= 3 && strlen(a:3)
		let c = get(s:cols, a:3, [a:3, a:3])
		let str .= ' guisp='. c[0]
	else
		let str .=   ' guisp=NONE'
	endif

	execute str
endfunction



" Basic highlighting
call s:hi('Normal',     'base3',   'basebg')
call s:hi('Comment',    'blue2')
call s:hi('Constant',   'green')
call s:hi('Identifier', 'blue1')
call s:hi('Statement',  'red', '', 'bold')
call s:hi('PreProc',    'orange', '', 'bold')
call s:hi('Type',       'blue1', '', 'bold')
call s:hi('Special',    'red')
call s:hi('Underlined', 'violet')
call s:hi('Ignore',     'basebg')
call s:hi('Error',      'red')
call s:hi('Todo',       'blue2', '', 'bold,underline')
call s:hi('StorageClass', 'base0', '', 'bold')


" Extended highlighting
call s:hi('String',       'base1')
call s:hi('SpecialKey',   'base00', 'base02', 'bold')
call s:hi('NonText',      'base00', '',       'bold')
call s:hi('StatusLine',   'blue1',   'base03')
call s:hi('StatusLineNC', 'base1',  'base03')
call s:hi('Visual',       'base2',  'base02')
call s:hi('VisualNOS',    '',       'base02', 'standout')
call s:hi('Directory',    'blue1', '', 'bold')
call s:hi('ErrorMsg',     'red',    '',       'bold,reverse')
call s:hi('IncSearch',    'orange', '',       'standout')
call s:hi('Search',       'yellow', '',       'reverse')
call s:hi('MoreMsg',      'blue1')
call s:hi('ModeMsg',      'blue1')
call s:hi('LineNr',       'base0',  'base03')
call s:hi('Question',     'blue2',   '',       'bold')
call s:hi('VertSplit',    'red',    'base03', 'bold')
call s:hi('Title',        'blue2')
call s:hi('WarningMsg',   'red',    '',       'bold')
call s:hi('WildMenu',     'base2',  'base02')
call s:hi('Folded',       'base0',  'base02', 'bold,underline', 'base03')
call s:hi('FoldColumn',   'base0',  'base02')
call s:hi('SignColumn',   'base0')
call s:hi('Conceal',      'blue1')

call s:hi('DiffAdd',      'green',  '',       'reverse',        'green')
call s:hi('DiffChange',   'yellow', '',       'reverse',        'yellow')
call s:hi('DiffDelete',   'red',    '',       'reverse')
call s:hi('DiffText',     'blue1',   '',       'reverse',        'blue1')

call s:hi('Spellbad',     '',       '',       'undercurl',      'red')
call s:hi('SpellCap',     '',       '',       'undercurl',      'violet')
call s:hi('SpellRare',    '',       '',       'undercurl',      'blue2')
call s:hi('SpellLocal',   '',       '',       'undercurl',      'yellow')

call s:hi('Pmenu',        'base0',  'base02')
call s:hi('PmenuSel',     'base01', 'base2')
call s:hi('PmenuSbar',    'base2',  'base0')
call s:hi('PmenuThumb',   'base0',  'base03')

call s:hi('TabLine',      'base0',  'base02', 'underline',      'base0')
call s:hi('TabLineFill',  'base0',  'base02', 'underline',      'base0')
call s:hi('TabLineSel',   'base01', 'base2',  'underline',      'base0')

call s:hi('CursorColumn', '',       'base03')
call s:hi('CursorLine',   '',       'base03')

call s:hi('ColorColumn',  '',       'base02')

call s:hi('Cursor',     'base03', 'blue1')
hi link lCursor Cursor

call s:hi('MatchParen', 'red',    '',     'bold,underline')


" Vim
"hi link vimVar           Identifier
hi link vimFunc          Function
hi link vimUserFunc      Function
"hi link vimParenSep      Special
hi link vimSet           Normal
hi link vimSetEqual      Normal
hi link vimCommentString String
hi link vimCommentTitle  Todo

call s:hi('vimCommand',    'base1', '', 'bold')
"call s:hi('vimCmdSep',     'blue1',   '', 'bold')
call s:hi('vimIsCommand',  'base1')
call s:hi('vimSynMtchOpt', 'yellow')
call s:hi('vimSynType',    'blue2')
call s:hi('vimHiLink',     'blue1')
call s:hi('vimHiGroup',    'blue1')
call s:hi('vimGroup',      'blue1')


" Help
hi link helpSpecial	Special

call s:hi('helpExample',        'base1')
call s:hi('helpOption',         'blue2')
call s:hi('helpNote',           'magenta')
call s:hi('helpVim',            'magenta')
call s:hi('helpHyperTextJump',  'blue1')
call s:hi('helpHyperTextEntry', 'green')


" Diff
hi link diffAdded	Statement
hi link diffline	Identifier


" Git
hi link gitcommitUntracked      gitcommitComment
hi link gitcommitDiscarded      gitcommitComment
hi link gitcommitSelected       gitcommitComment
hi link gitcommitNoBranch       gitcommitBranch
hi link gitcommitDiscardedArrow gitcommitDiscardedFile
hi link gitcommitSelectedArrow  gitcommitSelectedFile
hi link gitcommitUnmergedArrow  gitcommitUnmergedFile
call s:hi('gitcommitComment',       'base01',  '', 'italic')
call s:hi('gitcommitUnmerged',      'green',   '', 'bold')
call s:hi('gitcommitOnBranch',      'base01',  '', 'bold')
call s:hi('gitcommitBranch',        'magenta', '', 'bold')
call s:hi('gitcommitDiscardedType', 'red')
call s:hi('gitcommitSelectedType',  'green')
call s:hi('gitcommitHeader',        'base01')
call s:hi('gitcommitUntrackedFile', 'blue2',    '', 'bold')
call s:hi('gitcommitDiscardedFile', 'red',     '', 'bold')
call s:hi('gitcommitSelectedFile',  'green',   '', 'bold')
call s:hi('gitcommitUnmergedFile',  'yellow',  '', 'bold')
call s:hi('gitcommitFile',          'base0',   '', 'bold')


" HTML
call s:hi('htmlTag',            'base2')
call s:hi('htmlEndTag',         'base2')
call s:hi('htmlTagN',           'base1')
call s:hi('htmlTagName',        'blue1')
call s:hi('htmlSpecialTagName', 'blue1')
call s:hi('htmlArg',            'yellow')
call s:hi('javaScript',         'yellow')


" Perl
call s:hi('perlHereDoc',           'base1')
call s:hi('perlVarPlain',          'yellow')
call s:hi('perlStatementFileDesc', 'blue2')


" Markdown
call s:hi('markdownHeadingDelimiter', 'green')
call s:hi('markdownCode',             'base1')
call s:hi('markdownCodeBlock',        'base1')


" TagList
hi link TagListFileName	Statement
hi link TagListComment String


" Custom syntax
function! s:extrasyntax( syntax )
	" Match trailing white space or spaces preceding a tab
	if !exists('w:wn_whitespace')
		let w:wn_whitespace = matchadd('ExtraWhitespace', '\s\+$\| \+\ze\t')
	endif

	" Match any character exceeding column 80
	if !exists('w:wn_rightmargin')
		let w:wn_rightmargin = matchadd('RightMargin', '\%>80v.\+')
	endif
endfunction

augroup whitenight
	autocmd!
	autocmd Syntax * call s:extrasyntax(expand('<amatch>'))
augroup end

call s:hi('ExtraWhitespace', 'red', '',       'underline')
call s:hi('RightMargin',     '',    'base03')
