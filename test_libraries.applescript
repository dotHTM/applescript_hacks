(* test_libraries.applescript
----------------------------------------------------------------
Just a little demo for how to use libraries in AppleScript
*)

use scripting additions -- You need this, otherwise it will be unloaded with your first library load
use script "ProtoHashes"

set someHash to {}

set someHash to ph_append(someHash, "alice","1")
set someHash to ph_append(someHash, "bob","2")
set someHash to ph_append(someHash, "carl","3")

set someHash to ph_remove(someHash, "carl")
set someHash to ph_modifyIndex(someHash, "bob", "15")


get {ph_dump(someHash),"\n",ph_index(someHash, "alice"),ph_index(someHash, "bob"),ph_index(someHash, "carl")}
