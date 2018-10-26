(* test_libraries.applescript
----------------------------------------------------------------
Just a little demo for how to use libraries in AppleScript
*)

use scripting additions -- You need this, otherwise it will be unloaded with your first library load
use script "ProtoHashes"

set someHash to {}

tell script "ProtoHashes" to set someHash to append(someHash, "alice", "1")
tell script "ProtoHashes" to set someHash to append(someHash, "bob", "2")
tell script "ProtoHashes" to set someHash to append(someHash, "carl", "3")

tell script "ProtoHashes" to set someHash to remove(someHash, "carl")
tell script "ProtoHashes" to set someHash to modifyIndex(someHash, "bob", "15")


tell script "ProtoHashes" to get {dump(someHash), "\n", getIndex(someHash, "alice"), getIndex(someHash, "bob"), getIndex(someHash, "carl")}
