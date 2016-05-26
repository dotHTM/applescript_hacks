

on run
	
	set minBase to 10
	set maxBase to 10
	set minDigit to 2
	set maxDigit to 7
	
	--MVBNKExplorer(minBase, maxBase, minDigit, maxDigit)
	
	MVBNKSet(6, 10)
	
	
end run



on MVBNKExplorer(minBase, maxBase, minDigit, maxDigit)
	set resultsList to {" "}
	repeat with digits from minDigit to maxDigit
		set resultsList to resultsList & {digits}
	end repeat
	repeat with baseN from minBase to maxBase
		set resultsList to resultsList & ("\nBase-" & baseN & " " as string)
		repeat with digits from minDigit to maxDigit
			set {textA, ringCount, textB, lengthSeq, textC, lenAverage, textD, linkages} to MVBNKSet(baseN, digits)
			set resultsList to resultsList & {{ringCount, lenAverage}}
		end repeat
	end repeat
	return resultsList
end MVBNKExplorer





--=====================================================================
-- Not fully tested or subroutine not fully tested
--=====================================================================

on MVBNKSet(baseN, digits)
	
	set visitedList to {}
	
	set ringCount to 0
	set lengthSeq to {}
	
	set inputList to everyNumberBaseNMinimized(digits, baseN)
	
	set linkages to {}
	
	repeat with anInputNum in inputList
		if visitedList does not contain anInputNum as list then
			set {oldResult, resultList, visitedList} to MinVisitedBaseNKaprekarRep(anInputNum as list, baseN, visitedList)
		else
			set {oldResult, resultList} to {anInputNum as list, {}}
		end if
		
		set ringFlag to ""
		set countResultList to count of resultList
		if countResultList > 1 then
			set testResult to item countResultList of resultList as list
			set ringlength to ""
			repeat with i from 1 to (countResultList - 1)
				set anResult to item i of resultList
				if testResult is anResult as list then
					set ringFlag to "Ring, Length: "
					set ringCount to ringCount + 1
					set ringLInt to (countResultList - i)
					set lengthSeq to lengthSeq & ringLInt
					set ringlength to ringLInt as string
				end if
			end repeat
		end if
		
		set linkages to linkages & {resultList, ringFlag & ringlength & "\n"}
	end repeat
	
	set lenTotal to 0
	repeat with anLen in lengthSeq
		set lenTotal to lenTotal + anLen
	end repeat
	set lenAverage to lenTotal / (count of lengthSeq)
	
	
	return {"Rings found: ", ringCount, "\nRing Lengths: ", lengthSeq, "\nLength Average: ", lenAverage, "\nLinkages:\n", linkages}
	
end MVBNKSet



on MinVisitedBaseNKaprekarRep(inputNum, baseN, visitedList)
	
	set oldResult to inputNum
	set resultList to {}
	
	repeat while visitedList does not contain {oldResult}
		set visitedList to visitedList & {oldResult}
		set resultList to resultList & {oldResult}
		set newResult to BaseNKaprekarStep(oldResult, baseN)
		set oldResult to newResult
	end repeat
	set resultList to resultList & {oldResult}
	
	return {oldResult, resultList, visitedList}
end MinVisitedBaseNKaprekarRep







on niceBNKMS(inputListA, baseN)
	set MinStats to KaprekarMinimized(BaseNKaprekarInputedList(inputListA, baseN))
	return {} & "Count of Input Points: " & (count of inputListA) & "\nInput Points: " & inputListA & "\n Count of Visited Points: " & (count of item 1 of MinStats) & "\nVisited Points:" & MinStats
end niceBNKMS

on KaprekarMinimized(statsList)
	set visitedPointList to {}
	set minimizedStatsList to {{"input point", "Loop point", "count of minStepList", "countResults", "FoundIndex", "RevFoundIndex", "minStepList", "\n"}}
	
	repeat with anStat in statsList
		set {startingNumber, BeginLoopNum, x, y, z, StepList, deliminator} to anStat
		set minStepList to {}
		set nowCount to y
		repeat with anStep in StepList
			if nowCount > 0 then
				set nowCount to nowCount - 1
				if visitedPointList does not contain {anStep as list} then set visitedPointList to visitedPointList & {anStep as list}
				set minStepList to minStepList & {anStep as list}
			else if visitedPointList does not contain {anStep as list} then
				set visitedPointList to visitedPointList & {anStep as list}
				set minStepList to minStepList & {anStep as list}
			end if
		end repeat
		
		
		set minimizedStatsList to minimizedStatsList & {{startingNumber, BeginLoopNum, (count of minStepList), x, y, z, minStepList, deliminator}}
		
		
	end repeat
	
	return {visitedPointList, "\n", minimizedStatsList}
	
end KaprekarMinimized


on BaseNKaprekarInputedList(inputList, baseN)
	set output to {}
	repeat with anPoint in inputList
		set output to output & BaseNKaprekarRun(anPoint as list, baseN)
	end repeat
	return output
end BaseNKaprekarInputedList




--=====================================================================
-- Probably working as expected
--=====================================================================





on BaseNKaprekarRun(inputNum, baseN)
	
	set {LastResult, resultList} to BaseNKaprekarRep(inputNum, baseN)
	set countResults to count of resultList
	set indexER to 0
	set FoundIndex to 0
	repeat with anResult in resultList
		set indexER to indexER + 1
		if LastResult is anResult as list then set FoundIndex to indexER
	end repeat
	
	set RevFoundIndex to countResults - FoundIndex + 1
	
	return {{inputNum, LastResult, countResults, FoundIndex, RevFoundIndex, resultList, "\n"}}
	
end BaseNKaprekarRun


on BaseNKaprekarRep(inputNum, baseN)
	
	set resultList to {}
	set oldResult to inputNum
	
	repeat while resultList does not contain {oldResult}
		set resultList to resultList & {oldResult}
		set newResult to BaseNKaprekarStep(oldResult, baseN)
		set oldResult to newResult
	end repeat
	
	return {oldResult, resultList}
end BaseNKaprekarRep




on BaseNKaprekarStep(inputBaseNNumber, baseN)
	
	set stringLength to count of inputBaseNNumber
	
	set output to {}
	set topNum to resortDigits(inputBaseNNumber, 1)
	set botNum to resortDigits(inputBaseNNumber, -1)
	set output to resortDigits(subtractBaseN(topNum, botNum, baseN), -1)
	
	return output
end BaseNKaprekarStep




on everyNumberBaseNMinimized(digits, baseN)
	
	if digits > 1 then
		set inputList to everyNumberBaseNMinimized(digits - 1, baseN)
		set resultSet to {}
		repeat with anItem in inputList
			set lastDigitIndex to count of anItem
			set lastDigit to item lastDigitIndex of anItem
			repeat with i from lastDigit to baseN - 1
				set resultSet to resultSet & {anItem & i}
			end repeat
		end repeat
	else
		set resultSet to {}
		repeat with i from 0 to baseN - 1
			set resultSet to resultSet & {{i}}
		end repeat
	end if
	
	return resultSet
end everyNumberBaseNMinimized


on everyNumberBaseN(digits, baseN)
	
	if digits > 1 then
		set inputList to everyNumberBaseN(digits - 1, baseN)
		set resultSet to {}
		repeat with anItem in inputList
			repeat with i from 0 to baseN - 1
				set resultSet to resultSet & {anItem & i}
			end repeat
		end repeat
	else
		set resultSet to {}
		repeat with i from 0 to baseN - 1
			set resultSet to resultSet & {{i}}
		end repeat
	end if
	
	return resultSet
end everyNumberBaseN


on subtractBaseN(NumA, NumB, baseN)
	set theResult to {}
	set maxCount to count of NumA
	set countB to count of NumB
	if countB > maxCount then set maxCount to countB
	set jstNumA to digitLenString(NumA, maxCount)
	set jstNumB to digitLenString(NumB, maxCount)
	set resultNum to {}
	
	if baseNArithmeticSanityCheck(NumA, NumB, baseN) then
		repeat with i from 1 to maxCount
			set digitJstNumA to item i of jstNumA as integer
			set digitJstNumB to item i of jstNumB as integer
			set resultNum to resultNum & (digitJstNumA - digitJstNumB)
		end repeat
		
		
		set resultNum to rectifyBaseN(resultNum, baseN)
		
		
	end if
	
	return resultNum
end subtractBaseN

on baseNArithmeticSanityCheck(NumA, NumB, baseN)
	set sanityCheck to true
	set digitList to NumA & NumB
	repeat with anDigit in digitList
		if sanityCheck then set sanityCheck to anDigit < baseN
	end repeat
	return sanityCheck
end baseNArithmeticSanityCheck


on rectifyBaseN(inputNumber, baseN)
	
	set theSign to signBN(inputNumber, baseN)
	
	if theSign = 0 then
		-- If the sign is zero, don't bother working too hard
		set resultNum to digitLenString({}, count of inputNumber)
	else
		
		set resultNum to {}
		set lastQuotient to 0
		
		set maxI to count of inputNumber
		set minI to 1
		repeat with invI from minI to maxI --Repeat loop, counting backwards.
			set i to maxI - invI + minI
			
			set anDigit to (item i of inputNumber) + lastQuotient
			set remainder to anDigit mod baseN as integer
			set lastQuotient to (anDigit - remainder) / baseN as integer
			
			if theSign * remainder < 0 then
				set remainder to remainder + baseN * theSign
				set lastQuotient to lastQuotient - 1 * theSign
			end if
			
			
			set resultNum to remainder & resultNum
			
		end repeat
		
		if lastQuotient is not 0 then
			set resultNum to rectifyBaseN({lastQuotient}, baseN) & resultNum
		end if
		
	end if
	
	return resultNum
end rectifyBaseN


on signBN(inputNumber, baseN)
	
	set aproxBN to decimalConvBN(inputNumber, baseN)
	
	if aproxBN > 0 then
		set theSign to 1
	else if aproxBN < 0 then
		set theSign to -1
	else
		set theSign to 0
	end if
	
	return theSign
end signBN

on decimalConvBN(inputNumber, baseN)
	
	set theResult to 0
	set maxI to count of inputNumber
	set minI to 1
	repeat with invI from minI to maxI
		set i to maxI - invI + minI
		set anDigit to item i of inputNumber
		
		set theResult to theResult + anDigit * (baseN ^ (invI - 1))
		
	end repeat
	return theResult
end decimalConvBN


on digitLenString(inputBaseNNumber, length)
	set output to inputBaseNNumber
	repeat while (count of output) < length
		set output to 0 & output
	end repeat
	return output
end digitLenString




on resortDigits(inputBaseNNumber, direction)
	try
		set dirFlag to false
		try
			if direction then set dirFlag to true
		on error
			if direction > 0 then set dirFlag to true
		end try
		set output to {}
		set workingNumbers to inputBaseNNumber
		if dirFlag then
			repeat while ((count of workingNumbers) > 0)
				set maxNum to 0
				set countMax to 0
				set leftOvers to {}
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
					set output to output & (maxNum as integer)
				end repeat
				set workingNumbers to leftOvers
			end repeat
		else
			set observedBaseMax to item 1 of inputBaseNNumber
			repeat with anDigit in inputBaseNNumber
				if anDigit > observedBaseMax then set observedBaseMax to anDigit
			end repeat
			repeat while ((count of workingNumbers) > 0)
				set minNum to observedBaseMax + 1
				set countMin to 0
				set leftOvers to {}
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
					set output to output & (minNum as integer)
				end repeat
				set workingNumbers to leftOvers
			end repeat
		end if
	on error errMSG
		set errinputBaseNNumber to inputBaseNNumber
	end try
	
	return output
end resortDigits




on randBaseNNumber(baseN, digitLength)
	set theResult to {}
	repeat with i from 1 to digitLength
		set randDigit to (random number from 0 to (baseN - 1))
		set theResult to theResult & randDigit
	end repeat
	return theResult
end randBaseNNumber


