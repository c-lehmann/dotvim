if exists('loaded_taglist')
  nmap <silent> <F8> :TlistToggle<CR>
endif

if exists(':NERDTree')
  nmap <silent> <F15> :NERDTreeToggle<CR>
endif

let NERDTreeMinimalUI = 1

" Arrows instead of ASCII-'art'
let NERDTreeDirArrows = 1
let NERDTreeWinSize = 40
