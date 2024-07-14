module Main (main) where

import Language.Atom
import Language.Atom.Unit
import GHC.Word
import Data.Int


ledBlink :: Atom ()
ledBlink = do
  atom "toggle" $ do
    state <- bool "state" False
    toggleTimer <- timer "toggleTimer"
    cond $ timerDone toggleTimer
    startTimer toggleTimer $ mux (value state) 5 3
    callMux (value state) "ex_turnOff" "ex_turnOn"
    state <== not_ (value state)

  atom "justPrint" $ do
    call "ex_just_print"


callMux:: E Bool -> Name -> Name -> Atom()
callMux c n1 n2 = do
    atom "callmux_true"  $ do
        cond c
        call n1
    atom "callmux_false"  $ do
        cond $ not_ c
        call n2


main :: IO ()
main = do
  preCode <- readFile "pre.c"
  postCode <- readFile "post.c"
  let atomCfg = defaults { cFuncName = "atom_tick"
                         , cStateName = "state_example"
                         , cCode = prePostCode
                         , hCode = prePostHeader
                         , cRuleCoverage = False
                         }
      prePostCode _ _ _= (preCode, postCode)
      prePostHeader _ _ _= ("","")
  (sched, _, _, _, _) <- compile "atom_use_my_code" atomCfg ledBlink
  putStrLn $ reportSchedule sched
