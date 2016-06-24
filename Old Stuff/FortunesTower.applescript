--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##
--  A Study of Fortune's Tower
--     Originally coded by Mike Cramer (kiodane@gmail.com) in August 2008.
--
--  Based on the rule set defined by the Xbox Live game Fable 2 Pub Games 
--     by Lionhead Studios
--
--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##
--
--  Scope:
--     The following code is meant for generating gamestates of Fortune's Tower for
--     the purpose of finding a statistical advantage for the human player.  This 
--     is not meant to provide any interface to mimick the Xbox Live original game 
--     or to release a competing product.  This code is only to be used for 
--     mathematical exploration.
--
--     https://en.wikipedia.org/wiki/Fable_II_Pub_Games#Fortune.27s_Tower
--
--  Other Notes:
--     Knights in this implimentation are recorded as 8's.  There is a line in the 
--     rowValue section that detects 8's and ignores them for the row's correct value.
--     Upper and lower bounds are not currently tested to work in a fully 
--     generallized rule set.
--
--     Only one gate card will be pulled (an issue for a more generallized rule set).
--
--  Care should be taken when interpreting data since the index of a value and the 
--     correct rowDepth are rarely the same.
--
--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##--##




on run
	
	-- sets the number of each numbered card (total cards will be this * 7 + 4)
	set cardMult to 8
	-- range of rows 
	--     Code not yet generalized enough to faithfully work with any lower bound other than 2
	set rowLowerBound to 2
	--     Please don't exceed the number of cards in the deck.  (min cards needed = Sum of x from 1 thru upper bound)
	set rowUpperBound to 8
	
	-- price to buy into the game
	set buyIn to 15
	
	
	--==--==--==--==--==--==--
	-- Stat related variables
	--==--==--==--==--==--==--
	set startRun to current date
	set playTimes to 1000 --  the number fo times the game will be played
	set payOutTot to 0 --  Total Paid Out
	set writeToFile to false -- If you want to output to a file
	
	-- Open the Output file
	if writeToFile then
		try
			-- Open File for appending game states
			do shell script "touch ~/Desktop/FT\\ Stat.txt" -- Make sure it's there first
			set target_file to (((path to desktop folder) as string) & "FT Stat.txt")
			set target_file to target_file as string
			set open_target_file to open for access file target_file with write permission
		end try
	end if
	
	
	--==--==--==--==--==--==--==--==--==--==--==--==--
	--  Loop until played enough games
	--==--==--==--==--==--==--==--==--==--==--==--==--
	
	repeat with gameCounter from 1 to playTimes
		
		
		--==--==--==--==--==--==--
		-- Each Game
		--==--==--==--==--==--==--
		--initialize the game
		set startGame to current date
		-- initializes the deck, knights are always 4 in the deck, knights are recorded as 8
		set thisDeck to {cardMult, cardMult, cardMult, cardMult, cardMult, cardMult, cardMult, 4}
		set gateCard to {0, 0, 0} -- Row Depth, Column Depth, Value of the Gate Card
		set tableCards to {} -- { {row 2} , {row 3} , ...
		set tehRow to {} -- {card 1, card 2, ...
		set failCount to 0 -- how many cards on the last row failed?
		set failFirst to 0 -- the location on a row where the first failed card occured
		set gameFailure to false
		set jackpot to false
		set multVal to {} -- { multiplier value 1, multiplier value 2, ...
		set gameValues to {} -- { row value 1, rowvalue 2, ...
		set rowValue to 0 -- the Row's value
		set jPVal to 0 -- Jackpot value
		
		
		
		repeat with rowDepth from rowLowerBound to rowUpperBound
			
			if not gameFailure then
				repeat with collumnDepth from 1 to rowDepth
					
					-- Deal a card and add it to the row		
					set {thisDeck, nextCVal} to genericCardDealer(thisDeck)
					set tehRow to tehRow & nextCVal
					
				end repeat
				
				-- Put the cards on the Table
				set tableCards to tableCards & {tehRow}
				
				-- On the second and further rows, check if any cards fail
				if rowDepth > rowLowerBound then set {failCount, failFirst} to checkRows(oldRow, tehRow)
				
				-- The Gate Card can be used to save from a 1 card failure
				if failCount = 1 then
					-- deal
					set {thisDeck, nextCVal} to genericCardDealer(thisDeck)
					-- put it in the row
					set item failFirst of tehRow to nextCVal
					-- get some stats on where the card is going
					set gateCard to {rowDepth, failFirst, nextCVal}
					-- check the row again for failures
					set {failCount, failFirst} to checkRows(oldRow, tehRow)
				end if
				
				-- If the row still contains any failures, then game over
				if failCount > 0 then
					set gameFailure to true
					set rowValue to 0
				else
					repeat with anCard in tehRow
						if anCard < 8 then set rowValue to rowValue + anCard
					end repeat
				end if
				
				
				-- Add the row value to the jackpot
				set jPVal to jPVal + rowValue
				
				
				-- Add the row value to the list of game values
				set gameValues to gameValues & rowValue
				
				
				-- Is the row a multiplier row?
				set multFlag to true
				repeat with i from 1 to (rowDepth - 1)
					if item i of tehRow is not item (i + 1) of tehRow then set multFlag to false
				end repeat
				set multVal to multVal & multFlag
				
				
				
				-- Get ready for the next row of cards
				set oldRow to tehRow
				set rowValue to 0
				set tehRow to {}
				
			end if
		end repeat
		
		-- complete the game values list
		repeat with j from (count of gameValues) to (rowUpperBound - rowLowerBound)
			set gameValues to gameValues & 0
		end repeat
		
		-- complete the multiplier values list
		repeat with j from (count of multVal) to (rowUpperBound - rowLowerBound)
			set multVal to multVal & false
		end repeat
		
		-- Did the table jackpot?
		if failCount = 0 and gateCard = {0, 0, 0} then
			set jackpot to true
			set item (rowUpperBound - rowLowerBound + 1) of gameValues to jPVal
		end if
		
		-- Apply Multipliers
		repeat with rowDepth from rowLowerBound to rowUpperBound
			set indexer to rowDepth - rowLowerBound + 1
			if (item indexer of multVal) then set item indexer of gameValues to (item indexer of gameValues) * rowDepth
		end repeat
		
		
		
		--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
		-- Getting out of the game - Gathering Stats within AppleScript
		--
		--  This is where your buyout algorithm would go.  Repeat loops through the row values and pull the indexed.  Create your own card counter etc. and help boost the expected payout.
		--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
		(*
		set stillInTheGame to true
		repeat with rowDepth from rowLowerBound to rowUpperBound
			set indexer to rowDepth - rowLowerBound + 1  -- the index of list items for the appropriate rowDepth
			set anVal to item indexer of gameValues
			
			--  Rememeber, Once you're out of the game, you can't get back in!
			if stillInTheGame and ((anVal ≥ buyOutVal and rowDepth ≥ payoutDepth) or rowDepth = rowUpperBound) then
				set payOutTot to payOutTot + anVal
				set stillInTheGame to false
			end if
		
		end repeat
		*)
		
		
		set endGame to current date
		
		
		-- Format data and output to file if needed.
		set tableText to ""
		repeat with anRow in tableCards
			set tableText to tableText & tabList(anRow)
		end repeat
		set outData to {¬
			"thisDeck\t", tabList(thisDeck), ¬
			"failCount\t", failCount, ¬
			"\tjackpot\t", jackpot, ¬
			"\tgameValues\t", tabList(gameValues), ¬
			"gateCard-RCV\t", tabList(gateCard), ¬
			"tableCards\t", tableText, ¬
			"\n"} as string
		if writeToFile then
			write outData to open_target_file starting at eof
		end if
		
		
		
		
	end repeat
	
	--==--==--==--==--==--==--==--==--==--==--==--==--
	--  Enough games have been played
	--==--==--==--==--==--==--==--==--==--==--==--==--
	
	
	
	
	-- Close the Output file
	if writeToFile then
		try
			close access open_target_file
		end try
	end if
	
	
	
	set endRun to current date
	
	
	--=#=-=#=-=#=-=#=-=#=-=#=-=#=-
	-- Output Results in ScriptEditor
	--=#=-=#=-=#=-=#=-=#=-=#=-=#=-
	
	get outData -- For debugging the general game rules
	
	
end run


--#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#--







--#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#--
--
--  Check two rows for similar elements.  Row A has one less element than Row B.
--
-- usage:		set {failCount, failFirst} to checkRows(oldRow, tehRow)

on checkRows(rowA, rowB)
	set anHero to 8
	set failCount to 0
	set failFirst to 0
	set upperBound to count of rowB
	
	repeat with i from 1 to upperBound
		
		if rowB does not contain anHero then
			set failValue to ((item i of (rowA & 0) = item i of rowB) or (item i of (0 & rowA) = item i of rowB))
			set oldFF to failFirst
			if failValue then set failCount to failCount + 1
			if oldFF = 0 and failCount = 1 then set failFirst to i
		end if
		
	end repeat
	
	
	return {failCount, failFirst}
end checkRows

--#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#--
--
--  A generic card dealer - 
--      The deck passed to the dealer is a listing of the number of occurances of a particular card.  Thus, the index of a number in this list represents the card's value.  If I have a deck of 3-1's, 4-2's, and 19-3's, then my deck would be {3,4,19}. If the deck I am using contains only unique cards (like in poker or tarrot) then then my deck would be all 1's (e.g. 6 unique cards {1,1,1,1,1,1}).  It is the programer's duty to devise a method of enumerating cards (e.g. number value + suit value or a reference list of number-to-name).
--
-- most general usage:		set { thisDeck , nextCVal } to genericCardDealer( thisDeck )


on genericCardDealer(thisDeck)
	
	-- get number of cards still in deck
	set sizeDeck to 0
	repeat with anCardSet in thisDeck
		set sizeDeck to sizeDeck + anCardSet
	end repeat
	
	-- pick the next card
	set nextCard to randFunct(sizeDeck) + 1
	--set nextCardBegin to nextCard
	set nextCVal to 0
	set i to 0
	repeat while nextCVal = 0 and i ≤ 8
		set i to i + 1
		if nextCard > 0 then
			set nextCard to nextCard - (item i of thisDeck)
		else
			set nextCVal to i - 1
		end if
		
	end repeat
	
	-- remove the card from the deck
	set item nextCVal of thisDeck to (item nextCVal of thisDeck) - 1
	
	return {thisDeck, nextCVal}
	
	-- end of generic card deal
end genericCardDealer

--#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#--
--
-- usage:     randFunct( integer )

on randFunct(maxNum)
	return random number from 0 to (maxNum - 1)
end randFunct

--#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#--
--
--  Convert a List or String of data to a tab deliminated string of data.
--
--  usage:	tabList( listOrString )

on tabList(inputList)
	set outputString to ""
	repeat with anitem in inputList
		set outputString to outputString & anitem & "\t"
	end repeat
	return outputString
end tabList

--#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#--
