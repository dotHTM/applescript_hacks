tell application "iTunes"
	
	set the_Sel to selection
	
	set found_albums to {}
	set found_artists to {}
	set found_genres to {}
	
	repeat with anSong in the_Sel
		set this_album to album of anSong
		if found_albums does not contain this_album then
			set found_albums to found_albums & this_album
		end if
		
		(*
		set this_artist to artist of anSong
		if found_artists does not contain this_artist then
			set found_artists to found_artists & this_artist
		end if
		
		set this_genre to genre of anSong
		if found_genres does not contain this_genre then
			set found_genres to found_genres & this_genre
		end if
		*)
		
	end repeat
	
	
	
	----------
	
	repeat with this_album in found_albums
		
		set these_Found_Tracks to (tracks whose album is this_album)
		set these_FTCount to count of these_Found_Tracks
		
		set found_album_artists to {}
		set artistReccordArray to {}
		repeat with an_Found_Track in these_Found_Tracks
			if kind of an_Found_Track contains "audio" then
				try
					set fnd_alb_art to artist of an_Found_Track
					if found_album_artists does not contain fnd_alb_art then
						set found_album_artists to found_album_artists & fnd_alb_art
						set artistReccordArray to artistReccordArray & {{name:fnd_alb_art, found:count of (tracks whose album is this_album and artist is fnd_alb_art)}}
					end if
				end try
			end if
		end repeat
		
		
		if (count of found_album_artists) > 1 then
			set max_art to ""
			set max_found to 0
			repeat with anRecord in artistReccordArray
				if found of anRecord > max_found then
					set max_found to found of anRecord
					set max_art to name of anRecord
				end if
			end repeat
			
			repeat with an_Found_Track in these_Found_Tracks
				if kind of an_Found_Track contains "audio" then
					try
						tell an_Found_Track
							set {episode ID, show} to {max_art, ((max_found / these_FTCount * 1000) as integer) / 1000}
						end tell
						
						duplicate an_Found_Track to playlist "ORG - Mixed Album"
					end try
				end if
			end repeat
		else
			repeat with an_Found_Track in these_Found_Tracks
				if kind of an_Found_Track contains "audio" then
					try
						--tell an_Found_Track
						--set {episode ID, show} to {item 1 of found_album_artists, 1}
						--end tell
						
						duplicate an_Found_Track to playlist "ORG - Pure Album"
					end try
				end if
				
			end repeat
		end if
		
		
	end repeat
	
end tell