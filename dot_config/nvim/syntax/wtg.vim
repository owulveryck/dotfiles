syntax keyword wtgKeyword evolution color title label stage1 stage2 stage3 stage4
syntax match wtgPipe /|/
syntax match wtgBlock /{/
syntax match wtgBlock /}/
syntax match wtgColon /:/

syntax match wtgDot /\./ containedin=ALL

syntax region wtgComment start=/\/\*/ end=/\*\// contains=wtgTodo
syntax match wtgComment /\/\/.*$/ contained
syntax match wtgX /\(\.\|.\)\@<=x\(\.\|.\)\@=/
syntax match wtgDashes / \zs-\+\ze / containedin=ALL


highlight wtgX guifg=#ff0000
highlight wtgDashes guifg=#00ff00
highlight wtgPipe guifg=#00ff00
highlight wtgBlock guifg=#bbbbbb
highlight wtgColon guifg=#bbbbbb
highlight wtgKeyword guifg=#ffa500
highlight wtgComment guifg=#aaaaaa
highlight wtgDot guifg=#888888

