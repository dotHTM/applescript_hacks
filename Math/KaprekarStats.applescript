property errInputString : ""
property errMSG : ""

on run
	
	
	{KaprekarMinimized(KaprekarSeqential(2, 0, 5)), errMSG, errInputString}
	
	
end run


on KaprekarMinimized(statsList)
	set visitedPointList to {}
	set minimizedStatsList to {}
	
	repeat with anStat in statsList
		set {startingNumber, BeginLoopNum, x, y, z, StepList, deliminator} to anStat
		set minStepList to {}
		set nowCount to y
		repeat with anStep in StepList
			if nowCount > 0 then
				set nowCount to nowCount - 1
				if visitedPointList does not contain anStep then set visitedPointList to visitedPointList & anStep
				set minStepList to minStepList & anStep
			else if visitedPointList does not contain anStep then
				set visitedPointList to visitedPointList & anStep
				set minStepList to minStepList & anStep
			end if
		end repeat
		
		
		set minimizedStatsList to minimizedStatsList & {{startingNumber, BeginLoopNum, (count of minStepList), x, y, z, minStepList, deliminator}}
		
		
	end repeat
	
	return {visitedPointList, "\n", minimizedStatsList}
	
end KaprekarMinimized



on KaprekarSeqential(maxDigit, startNum, StopNum)
	set output to {}
	repeat with i from startNum to StopNum
		set iString to digitLenString(i, maxDigit)
		set output to output & {KaprekarRun(iString) & "\n"}
	end repeat
	return output
end KaprekarSeqential


on KaprekarRandSamples(maxDigit, maxSamples)
	set output to {}
	set sampleList to {}
	set randomNumber to 0
	repeat with i from 1 to maxSamples
		set randomNumber to (random number from 1 to (10 ^ maxDigit as integer))
		repeat while sampleList contains randomNumber
			set randomNumber to (random number from 1 to (10 ^ maxDigit as integer))
		end repeat
		set sampleList to sampleList & randomNumber
		set iString to digitLenString(randomNumber, maxDigit)
		set output to output & {KaprekarRun(iString) & "\n"}
	end repeat
	return output
end KaprekarRandSamples

on KaprekarRun(someString)
	
	set {LastResult, resultList} to KaprekarRep(someString)
	set countResults to count of resultList
	set indexER to 0
	set FoundIndex to 0
	repeat with anResult in resultList
		set indexER to indexER + 1
		if LastResult = (anResult as string) then set FoundIndex to indexER
	end repeat
	
	set RevFoundIndex to countResults - FoundIndex + 1
	
	{someString, LastResult, countResults, FoundIndex, RevFoundIndex, resultList}
	
end KaprekarRun


on KaprekarRep(inputString)
	
	set resultList to {}
	set oldResult to inputString
	
	repeat while resultList does not contain oldResult
		set resultList to resultList & oldResult
		set newResult to KaprekarStep(oldResult)
		set oldResult to newResult
	end repeat
	
	return {oldResult, resultList}
end KaprekarRep


on KaprekarStep(inputString)
	
	set stringLength to count of inputString
	
	set output to ""
	set topNum to (resortDigits(inputString, 1) as integer)
	set botNum to (resortDigits(inputString, -1) as integer)
	set output to digitLenString(((topNum - botNum) as string), stringLength)
	
	return output
end KaprekarStep


on resortDigits(inputString, direction)
	try
		set dirFlag to false
		try
			if direction then set dirFlag to true
		on error
			if direction > 0 then set dirFlag to true
		end try
		set output to ""
		set workingNumbers to inputString
		if dirFlag then
			repeat while ((count of workingNumbers) > 0)
				set maxNum to 0
				set countMax to 0
				set leftOvers to ""
				repeat with anchar in workingNumbers
					set anNum to anchar as integer
					if anNum > maxNum then set maxNum to anNum
				end repeat
				repeat with anchar in workingNumbers
					set anNum to anchar as integer
					if anNum < maxNum then
						set leftOvers to leftOvers & anchar
					else if anNum = maxNum then
						set countMax to countMax + 1
					end if
				end repeat
				repeat with i from 1 to countMax
					set output to output & (maxNum as string)
				end repeat
				set workingNumbers to leftOvers
			end repeat
		else
			repeat while ((count of workingNumbers) > 0)
				set minNum to 10
				set countMin to 0
				set leftOvers to ""
				repeat with anchar in workingNumbers
					set anNum to anchar as integer
					if anNum < minNum then set minNum to anNum
				end repeat
				repeat with anchar in workingNumbers
					set anNum to anchar as integer
					if anNum > minNum then
						set leftOvers to leftOvers & anchar
					else if anNum = minNum then
						set countMin to countMin + 1
					end if
				end repeat
				repeat with i from 1 to countMin
					set output to output & (minNum as string)
				end repeat
				set workingNumbers to leftOvers
			end repeat
		end if
	on error errMSG
		set errInputString to inputString
	end try
	
	return output
end resortDigits


on digitLenString(inputString, length)
	set output to inputString as string
	repeat while (count of output) < length
		set output to "0" & output
	end repeat
	return output
end digitLenString