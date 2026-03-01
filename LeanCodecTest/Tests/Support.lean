module

public import LeanCodec

public section

namespace LeanCodecTest

def assert (cond : Bool) (message : String) : IO Unit :=
  if cond then
    return
  else
    throw <| IO.userError message

def runTest (name : String) (action : IO Unit) : IO Unit := do
  let err ← IO.getStderr
  err.putStrLn s!"[TEST] {name}"
  err.flush
  action
  err.putStrLn s!"[OK] {name}"
  err.flush

end LeanCodecTest
