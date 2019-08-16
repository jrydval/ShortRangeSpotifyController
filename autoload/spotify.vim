
function! spotify#Spotify(command)

	if a:command ==# 'next'
		let cmd = 'osascript -e ''tell application "Spotify" to next track'''
		echomsg system(cmd)
	elseif a:command ==# 'prev'
		let cmd = 'osascript -e ''tell application "Spotify" to previous track'''
		echomsg system(cmd)
	elseif a:command ==# 'play'
		let cmd = 'osascript -e ''tell application "Spotify" to play'''
		echomsg system(cmd)
	elseif a:command ==# 'pause'
		let cmd = 'osascript -e ''tell application "Spotify" to pause'''
		echomsg system(cmd)
	elseif a:command ==# 'toggle'
		if s:SpotifyStatus() ==# 'playing'
			call spotify#Spotify('pause')
		else
			call spotify#Spotify('play')
		endif
	elseif a:command ==# 'what'
		let cmd = 'osascript -e ''tell application "Spotify" to (get name of current track) & " by " & (get artist of current track)'''
		echomsg system(cmd)[:-2]
	else
		echomsg 'Unknown command'
	endif
	
endfunction

function! s:SpotifyStatus()

	let cmd = 'osascript -e ''tell application "Spotify" to get player state'''
	let result = system(cmd)[:-2]
	return result

endfunction

