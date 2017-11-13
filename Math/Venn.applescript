on run
	VennItems({"a", "b", 4}, {"a", 4, "c"})
end run



on VennItems(listA, listB)
	
	set errorState to "Venn"
	
	--intersection
	set interGroup to {}
	repeat with anItem in listA
		if listB contains anItem then set interGroup to interGroup & anItem
	end repeat
	
	--Those in A only
	set onlyA to {}
	repeat with anItem in listA
		if interGroup does not contain anItem then set onlyA to onlyA & anItem
	end repeat
	
	--Those in B only
	set onlyB to {}
	repeat with anItem in listB
		if interGroup does not contain anItem then set onlyB to onlyB & anItem
	end repeat
	
	
	return {onlyA, interGroup, onlyB}
end VennItems
