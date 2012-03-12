" Vim syntax file
" Language:     m2sh
" Maintainer:   Eimantas Vaiciunas <eimantas@walkingsmarts.com>
" Last Change:  2011 Apr 27
" Remark:       Initial release

if exists("b:current_syntax")
    finish
endif

syntax case match

" keyword setup
syntax keyword m2Sections Server Host Route Dir Proxy Handler Log MIMEType Setting

syntax keyword m2ServerSettings uuid chroot access_log error_log pid_file default_host port hosts contained
syntax keyword m2HostSettings name matching server maintenance routes contained
syntax keyword m2RouteSettings path reversed host target contained
syntax keyword m2DirSettings base index_file default_ctype cache_ttl contained
syntax keyword m2ProxySettings addr port contained
syntax keyword m2HandlerSettings send_spec send_ident recv_spec recv_ident protocol contained

syntax keyword m2KeywordIdentifiers servers settings mimetypes

" pattern/region matching
syntax match m2Comment /#.*/
syntax match m2Integer /\<\d\+\>/ contained
syntax match m2Identifier /\<[a-zA-Z_][a-zA-Z0-9_]*\>/
syntax region m2DQString start=/"/ skip=/\\"/ end=/"/
syntax region m2SQString start=/'/ skip=/\\'/ end=/'/
syntax region m2Routes start=/{/ end=/}/ contains=ALLBUT,m2KeywordIdentifiers
syntax region m2Array start=/\[/ end=/\]/ contains=ALLBUT,m2KeywordIdentifiers
syntax region m2Section start=/(/ end=/)/ contains=ALLBUT,m2KeywordIdentifiers

" highlight links
hi link m2Sections Keyword
hi link m2ServerSettings Type
hi link m2HostSettings Type
hi link m2RouteSettings Type
hi link m2DirSettings Type
hi link m2ProxySettings Type
hi link m2HandlerSettings Type
hi link m2KeywordIdentifiers Constant

hi link m2Comment Comment
hi link m2DQString String
hi link m2SQString String
hi link m2Integer Number
hi link m2Identifier Identifier

" finale
let b:current_syntax = "m2sh"

