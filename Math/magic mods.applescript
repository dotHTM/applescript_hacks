set MaxMagicNumber to 1000
set modcountpair to {}
repeat with MagicNumber from 1 to MaxMagicNumber
	set modpairs to {}
	set modcount to {}
	repeat with i from 1 to MagicNumber
		set modcount to modcount & 0
		set a to i
		set b to MagicNumber mod i
		set modpairs to modpairs & {{a, b}}
		set item (b + 1) of modcount to ((get item (b + 1) of modcount) + 1)
	end repeat
	set modcountpair to modcountpair & {{MagicNumber, modcount}}
end repeat

get modcountpair
