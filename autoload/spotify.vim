
function! spotify#Spotify(command)

	if a:command ==# 'next'
		let cmd = 'osascript -e ''tell application "Spotify" to next track'''
		echo system(cmd)
	elseif a:command ==# 'prev'
		let cmd = 'osascript -e ''tell application "Spotify" to previous track'''
		echo system(cmd)
	elseif a:command ==# 'play'
		let cmd = 'osascript -e ''tell application "Spotify" to play'''
		echo system(cmd)
	elseif a:command ==# 'pause'
		let cmd = 'osascript -e ''tell application "Spotify" to pause'''
		echo system(cmd)
	elseif a:command ==# 'toggle'
		if s:SpotifyStatus() ==# 'playing'
			call spotify#Spotify('pause')
		else
			call spotify#Spotify('play')
		endif
	elseif a:command ==# 'what'
		let cmd = 'osascript -e ''tell application "Spotify" to (get name of current track) & " by " & (get artist of current track)'''
		let name = system(cmd)[:-2]
		if strlen(name) == 4
			echo 'Not playing here'
		else
			echo name
		endif
	else
		echo 'Unknown command'
	endif
	
endfunction

function! s:SpotifyStatus()

	let cmd = 'osascript -e ''tell application "Spotify" to get player state'''
	let result = system(cmd)[:-2]
	return result

endfunction

