" Vim color file
" Converted from Textmate theme [ Argonaut ] using Coloration v0.2.5 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "argonaut"

hi Cursor guifg=NONE guibg=DarkOrange3 gui=NONE ctermfg=NONE ctermbg=166 cterm=NONE
hi Visual guifg=NONE guibg=#002fFF gui=NONE ctermfg=NONE ctermbg=12 cterm=NONE
hi CursorLine guifg=NONE guibg=#000c16 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi CursorColumn guifg=NONE guibg=#000c16 gui=NONE ctermfg=NONE ctermbg=16 cterm=NONE
hi LineNr guifg=#606268 guibg=#0e111d gui=NONE ctermfg=59 ctermbg=16 cterm=NONE
hi VertSplit guifg=#2d3039 guibg=#2d3039 gui=NONE ctermfg=23 ctermbg=23 cterm=NONE
hi MatchParen guifg=#ffffff guibg=DarkMagenta gui=bold ctermfg=231 ctermbg=5 cterm=bold
hi StatusLine guifg=#b2b2b2 guibg=#2d3039 gui=bold ctermfg=145 ctermbg=23 cterm=bold
hi StatusLineNC guifg=#b2b2b2 guibg=#2d3039 gui=NONE ctermfg=145 ctermbg=23 cterm=NONE
hi Pmenu guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi PmenuSel guifg=NONE guibg=#002f53 gui=NONE ctermfg=NONE ctermbg=17 cterm=NONE
hi IncSearch guifg=#FFFFFF guibg=#FF9933 gui=NONE ctermfg=231 ctermbg=209 cterm=NONE
hi Search guifg=#FFFFFF guibg=#FF9933 gui=NONE ctermfg=231 ctermbg=209 cterm=NONE
hi Directory guifg=#a4ed2d guibg=NONE gui=bold ctermfg=154 ctermbg=NONE cterm=bold
hi Folded guifg=#00a6ff guibg=#0e111d gui=NONE ctermfg=39 ctermbg=16 cterm=NONE
hi Normal guifg=#b2b2b2 guibg=#0e111d gui=NONE ctermfg=145 ctermbg=16 cterm=NONE
hi Boolean guifg=#a4ed2d guibg=NONE gui=bold ctermfg=154 ctermbg=NONE cterm=bold
hi Character guifg=#a4ed2d guibg=NONE gui=bold ctermfg=154 ctermbg=NONE cterm=bold
hi Comment guifg=#4C9900 guibg=NONE gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
hi Conditional guifg=#ffffff guibg=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
hi Constant guifg=#a4ed2d guibg=NONE gui=bold ctermfg=154 ctermbg=NONE cterm=bold
hi Define guifg=#ffffff guibg=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
hi ErrorMsg guifg=#ffffff guibg=#990000 gui=NONE ctermfg=231 ctermbg=88 cterm=NONE
hi WarningMsg guifg=#ffffff guibg=#990000 gui=NONE ctermfg=231 ctermbg=88 cterm=NONE
hi Float guifg=#d70000 guibg=NONE gui=NONE ctermfg=160 ctermbg=NONE cterm=NONE
hi Function guifg=#ffca00 guibg=NONE gui=bold ctermfg=220 ctermbg=NONE cterm=bold
hi Identifier guifg=#ffffff guibg=NONE gui=bold ctermfg=2 ctermbg=NONE cterm=NONE
hi Keyword guifg=#ffffff guibg=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
hi Label guifg=#6497c5 guibg=NONE gui=NONE ctermfg=68 ctermbg=NONE cterm=NONE
hi NonText guifg=#ffb500 guibg=#000c16 gui=NONE ctermfg=214 ctermbg=16 cterm=NONE
hi Number guifg=#CC0066 guibg=NONE gui=NONE ctermfg=161 ctermbg=NONE cterm=NONE
hi Operator guifg=#ffffff guibg=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
hi PreProc guifg=#ffffff guibg=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
hi Special guifg=#b2b2b2 guibg=NONE gui=NONE ctermfg=9 ctermbg=NONE cterm=NONE
hi SpecialKey guifg=#ffb500 guibg=#000c16 gui=NONE ctermfg=214 ctermbg=16 cterm=NONE
hi Statement guifg=#ffffff guibg=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
hi StorageClass guifg=#ffffff guibg=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
hi String guifg=#6497c5 guibg=NONE gui=NONE ctermfg=68 ctermbg=NONE cterm=NONE
hi Tag guifg=#0065d3 guibg=NONE gui=NONE ctermfg=26 ctermbg=NONE cterm=NONE
hi Title guifg=#b2b2b2 guibg=NONE gui=bold ctermfg=145 ctermbg=NONE cterm=bold
hi Todo guifg=#00a6ff guibg=NONE gui=inverse,bold ctermfg=39 ctermbg=NONE cterm=inverse,bold
hi Type guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Underlined guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
hi rubyClass guifg=#ffffff guibg=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
hi rubyFunction guifg=#ffca00 guibg=NONE gui=bold ctermfg=220 ctermbg=NONE cterm=bold
hi rubyInterpolationDelimiter guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi rubySymbol guifg=#a4ed2d guibg=NONE gui=bold ctermfg=154 ctermbg=NONE cterm=bold
hi rubyConstant guifg=#7a88f6 guibg=NONE gui=bold ctermfg=105 ctermbg=NONE cterm=bold
hi rubyStringDelimiter guifg=#6497c5 guibg=NONE gui=NONE ctermfg=68 ctermbg=NONE cterm=NONE
hi rubyBlockParameter guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi rubyInstanceVariable guifg=#0068c5 guibg=NONE gui=NONE ctermfg=26 ctermbg=NONE cterm=NONE
hi rubyInclude guifg=#ffffff guibg=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
hi rubyGlobalVariable guifg=#0068c5 guibg=NONE gui=NONE ctermfg=26 ctermbg=NONE cterm=NONE
hi rubyRegexp guifg=#6497c5 guibg=NONE gui=NONE ctermfg=68 ctermbg=NONE cterm=NONE
hi rubyRegexpDelimiter guifg=#6497c5 guibg=NONE gui=NONE ctermfg=68 ctermbg=NONE cterm=NONE
hi rubyEscape guifg=#a4ed2d guibg=NONE gui=bold ctermfg=154 ctermbg=NONE cterm=bold
hi rubyControl guifg=#ffffff guibg=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
hi rubyClassVariable guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi rubyOperator guifg=#ffffff guibg=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
hi rubyException guifg=#ffffff guibg=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
hi rubyPseudoVariable guifg=#0068c5 guibg=NONE gui=NONE ctermfg=26 ctermbg=NONE cterm=NONE
hi rubyRailsUserClass guifg=#7a88f6 guibg=NONE gui=bold ctermfg=105 ctermbg=NONE cterm=bold
hi rubyRailsARAssociationMethod guifg=#815db3 guibg=NONE gui=NONE ctermfg=97 ctermbg=NONE cterm=NONE
hi rubyRailsARMethod guifg=#815db3 guibg=NONE gui=NONE ctermfg=97 ctermbg=NONE cterm=NONE
hi rubyRailsRenderMethod guifg=#815db3 guibg=NONE gui=NONE ctermfg=97 ctermbg=NONE cterm=NONE
hi rubyRailsMethod guifg=#815db3 guibg=NONE gui=NONE ctermfg=97 ctermbg=NONE cterm=NONE
hi erubyDelimiter guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi erubyComment guifg=#00a6ff guibg=NONE gui=NONE ctermfg=39 ctermbg=NONE cterm=NONE
hi erubyRailsMethod guifg=#815db3 guibg=NONE gui=NONE ctermfg=97 ctermbg=NONE cterm=NONE
hi htmlTag guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi htmlEndTag guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi htmlTagName guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi htmlArg guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi htmlSpecialChar guifg=#a4ed2d guibg=NONE gui=bold ctermfg=154 ctermbg=NONE cterm=bold
hi javaScriptFunction guifg=#ffffff guibg=NONE gui=bold ctermfg=231 ctermbg=NONE cterm=bold
hi javaScriptRailsFunction guifg=#815db3 guibg=NONE gui=NONE ctermfg=97 ctermbg=NONE cterm=NONE
hi javaScriptBraces guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi yamlKey guifg=#0065d3 guibg=NONE gui=NONE ctermfg=26 ctermbg=NONE cterm=NONE
hi yamlAnchor guifg=#0068c5 guibg=NONE gui=NONE ctermfg=26 ctermbg=NONE cterm=NONE
hi yamlAlias guifg=#0068c5 guibg=NONE gui=NONE ctermfg=26 ctermbg=NONE cterm=NONE
hi yamlDocumentHeader guifg=NONE guibg=#090c15 gui=NONE ctermfg=NONE ctermbg=16 cterm=NONE
hi cssURL guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi cssFunctionName guifg=#815db3 guibg=NONE gui=NONE ctermfg=97 ctermbg=NONE cterm=NONE
hi cssColor guifg=#a4ed2d guibg=NONE gui=bold ctermfg=154 ctermbg=NONE cterm=bold
hi cssPseudoClassId guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi cssClassName guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi cssValueLength guifg=#d70000 guibg=NONE gui=NONE ctermfg=160 ctermbg=NONE cterm=NONE
hi cssCommonAttr guifg=#06960e guibg=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE
hi cssBraces guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE

" LWT settings
hi SpellBad term=underline ctermbg=55 ctermfg=white guibg=Brown guifg=White
