(* ProtoHashes.applescript
----------------------------------------------------------------
Applescript's key:value notation does not allow passing strings as the keys dynamically. So to do a dictionary or a hash in other languages, you need to  set a key key and a value key, XML style, and then assign values into that data structure.

Why would you ever expect more from AS?
*)



on ph(thiskey, value)
    return {{ky:thiskey, value:value}}
end



on hasIndex(handle, thiskey)
    set doesContains to false
    repeat with i in handle
        if not doesContains and ky of i is thiskey then
            set doesContains to true
        end if
    end repeat
    return doesContains
end 

on getIndex(handle, thiskey)
    set thisresult to ""
    repeat with i in handle
        if "" does not contain thisresult and ky of i is thiskey then
            set thisresult to value of i
        end if
    end repeat
    return thisresult
end 

on dump(handle)
    set thisresult to "{\n"
    repeat with i in handle
        set thisresult to thisresult & "\t" & ky of i & " : " & value of i & ",\n"
    end repeat
    set thisresult to thisresult & "}"
    return thisresult
end 

on append(handle, thiskey, value)
    if not hasIndex(handle, thiskey) then
        set handle to handle & ph(thiskey, value)
    end if
    return handle
end 

on remove(handle, thiskey)
    if not hasIndex(handle, thiskey) then
        return handle
    end if
    
    set newHandle to {}
    repeat with i in handle
        if ky of i is not thiskey then
            set newHandle to append(newHandle, ky of i, value of i)
        end if
    end repeat
    return newHandle
end 

on modifyIndex(handle, thiskey, value)
    if hasIndex(handle, thiskey) then
        set handle to remove(handle, thiskey)
        set handle to append(handle, thiskey, value)
    else
        set handle to append(handle, thiskey, value)
    end if
    return handle
end 
