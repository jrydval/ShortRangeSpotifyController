if ! executable('osascript')
	echoerr 'osascript executable not in PATH or missing!'
	finish
end

" TODO: Detect Spotify missing


nnoremap <silent> <leader>sp> :call spotify#Spotify('next')<cr>
nnoremap <silent> <leader>sp< :call spotify#Spotify('prev')<cr>
nnoremap <silent> <leader>sp_ :call spotify#Spotify('pause')<cr>
nnoremap <silent> <leader>sp- :call spotify#Spotify('play')<cr>
nnoremap <silent> <leader>sp? :call spotify#Spotify('what')<cr>
nnoremap <silent> <leader>sp. :call spotify#Spotify('toggle')<cr>

