property playlistPrefix : "OrgScan - "


tell mlcHelper
	
	mainSort()
	
	--	devSort()
	
	
end tell


script mlcHelper
	property parent : application "iTunes"
	
	----
	
	on mainSort()
		--	set trackScope to selection
		set trackScope to getAllMusicTracks()
		
		sortAlbumsWithMoreThanOneGenre(trackScope)
		sortArtistsWithMoreThanOneGenre(trackScope)
		likelyIncompleteAlbum(trackScope)
		
	end mainSort
	
	on devSort()
		
		--set trackScope to selection
		set trackScope to getAllMusicTracks()
		
		likelyIncompleteAlbum(trackScope)
		
	end devSort
	
	----
	----	
	
	on likelyIncompleteAlbum(trackScope)
		tell application "iTunes"
			repeat with anAlbum in my getAlbumsOfTracks(trackScope)
				set albumTracks to my getTracksOfAlbums({anAlbum})
				
				set scope to albumTracks
				
				set outputList to {}
				repeat with anItem in scope
					set end of outputList to track number of anItem
				end repeat
				set unwrappedTrackNumberList to outputList
				
				set maxTrack to my getMax(unwrappedTrackNumberList)
				set countTrack to count of albumTracks
				
				if maxTrack > countTrack then
					my copyTracksToPlaylist(albumTracks, playlistPrefix & "Likely Incomplete Album")
				end if
			end repeat
		end tell
	end likelyIncompleteAlbum
	
	----
	----
	
	
	on getMax(numberList)
		try
			set outputNumber to item 1 of numberList
			repeat with anNumber in numberList
				if anNumber > outputNumber then set outputNumber to anNumber
			end repeat
			return outputNumber as number
		on error errormessage
			return errormessage
		end try
	end getMax
	
	on deinterleveDictyList(inputList, indexLocation)
		set outputList to {}
		repeat with anItem in inputList
			if (count of anItem) ³ indexLocation then
				set outputList to outputList & item indexLocation of anItem
			end if
		end repeat
		return outputList
	end deinterleveDictyList
	
	----
	
	on getAllMusicTracks()
		tell application "iTunes"
			return tracks in playlist "Org"
		end tell
	end getAllMusicTracks
	
	on getSelectedTracks()
		tell application "iTunes"
			return selection
		end tell
	end getSelectedTracks
	
	on getTracksOfAlbums(albumListing)
		tell application "iTunes"
			set trackListing to {}
			repeat with anAlbum in albumListing
				set trackListing to trackListing & (tracks where album is anAlbum)
			end repeat
			return trackListing
		end tell
	end getTracksOfAlbums
	
	
	on getTracksOfArtists(artistListing)
		tell application "iTunes"
			set trackListing to {}
			repeat with anArtist in artistListing
				set trackListing to trackListing & (tracks where artist is anArtist)
			end repeat
			return trackListing
		end tell
	end getTracksOfArtists
	
	on getAlbumsOfTracks(trackListing)
		tell application "iTunes"
			set albumsFound to {}
			repeat with anTrack in trackListing
				tell anTrack
					if albumsFound does not contain album then set albumsFound to albumsFound & album
				end tell
			end repeat
		end tell
		return albumsFound
	end getAlbumsOfTracks
	
	on getGenresOfTracks(trackListing)
		tell application "iTunes"
			set genresFound to {}
			repeat with anTrack in trackListing
				tell anTrack
					if genresFound does not contain genre then set genresFound to genresFound & genre
				end tell
			end repeat
		end tell
		return genresFound
	end getGenresOfTracks
	
	on getArtistsOfTracks(trackListing)
		tell application "iTunes"
			set artistsFound to {}
			repeat with anTrack in trackListing
				tell anTrack
					if artistsFound does not contain artist then set artistsFound to artistsFound & artist
				end tell
			end repeat
		end tell
		return artistsFound
	end getArtistsOfTracks
	
	----
	
	on albumsWithMoreThanOneGenre(trackListing)
		
		set albumListing to {}
		repeat with anAlbum in getAlbumsOfTracks(trackListing)
			set genreCount to (count getGenresOfTracks(getTracksOfAlbums({anAlbum as string})))
			if genreCount > 1 then set albumListing to albumListing & {{anAlbum as string, genreCount}}
		end repeat
		return albumListing
		
	end albumsWithMoreThanOneGenre
	
	
	on sortAlbumsWithMoreThanOneGenre(trackListing)
		set AGList to albumsWithMoreThanOneGenre(trackListing)
		repeat with anDict in AGList
			copyTracksToPlaylist(getTracksOfAlbums({item 1 of anDict}), playlistPrefix & "MultiGenre Album")
		end repeat
	end sortAlbumsWithMoreThanOneGenre
	
	----
	
	on artistsWithMoreThanOneGenre(trackListing)
		
		set artistListing to {}
		repeat with anArtist in getArtistsOfTracks(trackListing)
			set genreCount to (count getGenresOfTracks(getTracksOfArtists({anArtist as string})))
			if genreCount > 1 then set artistListing to artistListing & {{anArtist as string, genreCount}}
		end repeat
		return artistListing
		
	end artistsWithMoreThanOneGenre
	
	
	
	on sortArtistsWithMoreThanOneGenre(trackListing)
		set AGList to artistsWithMoreThanOneGenre(trackListing)
		repeat with anDict in AGList
			copyTracksToPlaylist(getTracksOfArtists({item 1 of anDict}), playlistPrefix & "MultiGenre Artist")
		end repeat
	end sortArtistsWithMoreThanOneGenre
	
	----
	
	on createPlaylist(playlistName)
		tell application "iTunes"
			if playlist playlistName exists then
				-- do nothing
			else
				-- create the playlist
				make new playlist with properties {name:playlistName}
			end if
		end tell
	end createPlaylist
	
	on copyTracksToPlaylist(trackListing, playlistName)
		createPlaylist(playlistName)
		tell application "iTunes"
			repeat with anTrack in trackListing
				copy anTrack to playlist playlistName
			end repeat
		end tell
	end copyTracksToPlaylist
	
end script


