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
if exists('syntax_on') | syntax reset | endif
let g:colors_name = 'whitenight'

if has('gui_running')
    let s:vmode = 'gui'
else
    let s:vmode = 'cterm'
endif

let s:colors = {
\   'foreground': ['#d7d0c7', 'NONE'],
\   'background': ['#151515', 'NONE'],
\   'cursor':     ['#d7d0c7', 'NONE'],
\   'black1':     ['#101010', '0'],
\   'black2':     ['#404040', '8'],
\   'red1':       ['#e84f4f', '1'],
\   'red2':       ['#d23d3d', '9'],
\   'green1':     ['#b8d68c', '2'],
\   'green2':     ['#a0cf5d', '10'],
\   'yellow1':    ['#e1aa5d', '3'],
\   'yellow2':    ['#f39d21', '11'],
\   'blue1':      ['#7dc1cf', '4'],
\   'blue2':      ['#4e9fb1', '12'],
\   'magenta1':   ['#9b64fb', '5'],
\   'magenta2':   ['#8542ff', '13'],
\   'cyan1':      ['#6d878d', '6'],
\   'cyan2':      ['#42717b', '14'],
\   'white1':     ['#808080', '7'],
\   'white2':     ['#dddddd', '15'],
\}


" Helper function to set highlight colors.
" Arguments: group, guifg/ctermfg, guibg/ctermfg, gui, guisp
function! s:hi(group, fg, ...)
    let str = 'highlight '. a:group

    " Foreground color
    if strlen(a:fg)
        let c = get(s:colors, a:fg, [a:fg, a:fg])
        let str .= ' guifg='. c[0] .' ctermfg='. c[1]
    else
        let str .= ' guifg=NONE ctermfg=NONE'
    endif

    " Background color
    if a:0 >= 1 && strlen(a:1)
        let c = get(s:colors, a:1, [a:1, a:1])
        let str .= ' guibg='. c[0] .' ctermbg='. c[1]
    else
        let str .= ' guibg=NONE ctermbg=NONE'
    endif

    " Font attributes (bold, italic, etc.)
    if a:0 >= 2 && strlen(a:2)
        let str .= ' gui='. a:2 .' cterm='. a:2
    else
        let str .= ' gui=NONE cterm=NONE'
    endif

    " Underline/undercurl color
    if a:0 >= 3 && strlen(a:3)
        let c = get(s:colors, a:3, [a:3, a:3])
        let str .= ' guisp='. c[0]
    else
        let str .=   ' guisp=NONE'
    endif

    execute str
endfunction



" Basic highlighting
call s:hi('Normal'       , 'foreground' , 'background')
call s:hi('Comment'      , 'blue1')
call s:hi('Constant'     , 'red2')
call s:hi('Identifier'   , 'blue2')
call s:hi('Statement'    , 'green2')
call s:hi('PreProc'      , 'yellow2'    , ''            , 'bold')
call s:hi('Type'         , 'magenta1')
call s:hi('Special'      , 'yellow1')
call s:hi('Underlined'   , 'cyan1'      , ''            , 'underline')
call s:hi('Ignore'       , '')
call s:hi('Error'        , 'red1'       , ''            , 'bold')
call s:hi('Todo'         , 'yellow2'    , ''            , 'bold')
call s:hi('StorageClass' , 'blue2')


" Extended highlighting
call s:hi('String'       , 'cyan1')
call s:hi('SpecialKey'   , 'red1'    , ''        , 'bold')
call s:hi('NonText'      , 'black2'  , '')
call s:hi('StatusLine'   , 'blue1'   , 'black2')
call s:hi('StatusLineNC' , 'blue2'   , 'black2')
call s:hi('Visual'       , 'black1'  , 'blue1')
call s:hi('VisualNOS'    , 'black1'  , 'blue1'   , 'standout')
call s:hi('Directory'    , 'blue1'   , ''        , 'bold')
call s:hi('ErrorMsg'     , 'red2'    , ''        , 'bold,reverse')
call s:hi('IncSearch'    , 'yellow2' , ''        , 'reverse')
call s:hi('Search'       , 'cyan1'   , ''        , 'reverse')
call s:hi('ModeMsg'      , 'green2'  , ''        , 'bold')
call s:hi('MoreMsg'      , 'green2'  , ''        , 'bold')
call s:hi('LineNr'       , 'cyan2'   , 'black1')
call s:hi('CursorLineNr' , 'yellow2' , 'black1'  , 'bold')
call s:hi('Question'     , 'green2'  , ''        , 'bold')
call s:hi('VertSplit'    , 'black2'  , 'black2')
call s:hi('Title'        , 'blue2'   , ''        , 'bold')
call s:hi('WarningMsg'   , 'red2'    , ''        , 'bold')
"call s:hi('WildMenu'    , 'black1'  , 'yellow1' , 'bold')
call s:hi('Folded'       , 'white2'  , ''        , 'bold')
call s:hi('FoldColumn'   , 'cyan1'   , ''        , 'bold')
call s:hi('SignColumn'   , 'white2'  , ''        , 'bold')
" call s:hi('Conceal'    , 'blue1')

call s:hi('DiffAdd'    , 'green2'  , '' , 'bold')
call s:hi('DiffChange' , 'yellow2' , '' , 'bold')
call s:hi('DiffDelete' , 'red1'    , '' , 'bold')
call s:hi('DiffText'   , 'blue2'   , '' , 'reverse')

call s:hi('Spellbad'   , '' , '' , 'undercurl' , 'red2')
call s:hi('SpellCap'   , '' , '' , 'undercurl' , 'magenta2')
call s:hi('SpellRare'  , '' , '' , 'undercurl' , 'blue2')
call s:hi('SpellLocal' , '' , '' , 'undercurl' , 'yellow2')

" call s:hi('Pmenu',        'base0',  'base02')
" call s:hi('PmenuSel',     'base01', 'base2')
" call s:hi('PmenuSbar',    'base2',  'base0')
" call s:hi('PmenuThumb',   'base0',  'base03')

call s:hi('TabLine'     , 'black2' , 'black1')
call s:hi('TabLineFill' , 'white1' , 'black1')
call s:hi('TabLineSel'  , 'white2' , ''        , 'bold')

call s:hi('Cursor'       , '' , 'cursor')
call s:hi('CursorColumn' , '' , 'black2')
call s:hi('CursorLine'   , '' , 'black1')

call s:hi('ColorColumn', 'cyan2', 'cyan2')

hi link lCursor Cursor

call s:hi('MatchParen', 'yellow2', '', 'reverse')


" Diff
hi link diffAdded Statement
hi link diffline  Identifier


" " Markdown
" call s:hi('markdownHeadingDelimiter', 'green')
" call s:hi('markdownCode',             'base1')
" call s:hi('markdownCodeBlock',        'base1')
"
"
" " TagList
" hi link TagListFileName Statement
" hi link TagListComment String

" Better Whitespace plugin
call s:hi('ExtraWhitespace', '', 'red2')
