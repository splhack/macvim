" Vim syntax file
" Language:	msql
" Maintainer:	Lutz Eymers <ixtab@polzin.com>
" URL:		http://www.isp.de/data/msql.vim
" Email:	Subject: send syntax_vim.tgz
" Last Change:	2001 May 10
"
" Options	msql_sql_query = 1 for SQL syntax highligthing inside strings
"		msql_minlines = x     to sync at least x lines backwards

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'msql'
endif

runtime! syntax/html.vim
unlet b:current_syntax

syn cluster htmlPreproc add=msqlRegion

syn case match

" Internal Variables
syn keyword msqlIntVar ERRMSG contained

" Env Variables
syn keyword msqlEnvVar SERVER_SOFTWARE SERVER_NAME SERVER_URL GATEWAY_INTERFACE contained
syn keyword msqlEnvVar SERVER_PROTOCOL SERVER_PORT REQUEST_METHOD PATH_INFO  contained
syn keyword msqlEnvVar PATH_TRANSLATED SCRIPT_NAME QUERY_STRING REMOTE_HOST contained
syn keyword msqlEnvVar REMOTE_ADDR AUTH_TYPE REMOTE_USER CONTEN_TYPE  contained
syn keyword msqlEnvVar CONTENT_LENGTH HTTPS HTTPS_KEYSIZE HTTPS_SECRETKEYSIZE  contained
syn keyword msqlEnvVar HTTP_ACCECT HTTP_USER_AGENT HTTP_IF_MODIFIED_SINCE  contained
syn keyword msqlEnvVar HTTP_FROM HTTP_REFERER contained

" Inlclude lLite
syn include @msqlLite <sfile>:p:h/lite.vim

" Msql Region
syn region msqlRegion matchgroup=Delimiter start="<!$" start="<![^!->D]" end=">" contains=@msqlLite,msql.*

" sync
if exists("msql_minlines")
  exec "syn sync minlines=" . msql_minlines
else
  syn sync minlines=100
endif

" Define the default highlighting.
" Only when an item doesn't have highlighting yet
command -nargs=+ HiLink hi def link <args>

HiLink msqlComment		Comment
HiLink msqlString		String
HiLink msqlNumber		Number
HiLink msqlFloat		Float
HiLink msqlIdentifier	Identifier
HiLink msqlGlobalIdentifier	Identifier
HiLink msqlIntVar		Identifier
HiLink msqlEnvVar		Identifier
HiLink msqlFunctions		Function
HiLink msqlRepeat		Repeat
HiLink msqlConditional	Conditional
HiLink msqlStatement		Statement
HiLink msqlType		Type
HiLink msqlInclude		Include
HiLink msqlDefine		Define
HiLink msqlSpecialChar	SpecialChar
HiLink msqlParentError	Error
HiLink msqlTodo		Todo
HiLink msqlOperator		Operator
HiLink msqlRelation		Operator

delcommand HiLink

let b:current_syntax = "msql"

if main_syntax == 'msql'
  unlet main_syntax
endif

" vim: ts=8
