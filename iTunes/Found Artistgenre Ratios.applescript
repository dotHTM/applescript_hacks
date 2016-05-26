tell application "iTunes"
	
	
	set found_artists to {}
	
	repeat with anTrack in the selection
		try
			set this_artist to (album artist of anTrack as string)
			if found_artists does not contain this_artist then
				set found_artists to found_artists & this_artist
			end if
		end try
	end repeat
	
	repeat with anArtist in found_artists
		
		try
			if anArtist is not "" then
				set art_tracks to (tracks whose album artist is anArtist and kind contains "audio" and compilation is false and genre does not contain "soundtrack")
				
				set total_artist_count to count of (art_tracks)
				
				set max_genre to ""
				set max_g_count to 0
				set genre_ratio to 0
				set found_genre to {}
				repeat with anTtrack in art_tracks
					try
						set this_genre to genre of anTtrack
						--	if this_genre does not contain "soundtrack" and compilation of anTtrack is false then
						if found_genre does not contain this_genre then
							set found_genre to found_genre & this_genre
							set this_g_count to count of (tracks whose genre is this_genre and album artist is anArtist and kind contains "audio" and compilation is false)
							if this_g_count > max_g_count then
								set max_g_count to this_g_count
								set genre_ratio to this_g_count / total_artist_count
								set max_genre to this_genre
							end if
						end if
						--	end if
					end try
				end repeat
				
				if genre_ratio < 1 then
					repeat with anTrack in art_tracks
						set this_genre to genre of anTrack
						--	if this_genre does not contain "soundtrack" and compilation of anTrack is false then
						try
							--set episode ID of anTtrack to max_genre
							--set show of anTtrack to genre_ratio
							duplicate anTrack to playlist "ORG - Mixed Genre"
							get genre_ratio
						end try
						--	end if
					end repeat
					
					
				end if
				get genre_ratio
			end if
		end try
		
	end repeat
	
	--	get {genre_ratio, max_genre}
	
end tell