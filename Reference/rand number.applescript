

set maxRand to 5

set rollList to {}
repeat with i from 1 to 1000
	set randomNumber to (random number from 1 to maxRand)
	set rollList to rollList & randomNumber
end repeat


set counterList to {}
repeat with i from 1 to maxRand
	set counterList to counterList & 0
end repeat

repeat with anItem in rollList
	set oldCount to (get item anItem of counterList)
	set item anItem of counterList to oldCount + 1
end repeat

get counterList