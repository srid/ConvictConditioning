module App.Data where 

import App.Types
import Data.Vec ((+>), empty)
import Prelude (($))

type Program = Array Series

beginnerProgram :: Program
beginnerProgram = [ pushUp ] -- , legRaise, pullUp, squat  ]

pushUp :: Series
pushUp 
   = step PushUp WallPushup
      (beginner 1 10 +> intermediate 2 25 +> progression 3 50 +> empty)
  +> step PushUp InclinePushup
      (beginner 1 10 +> intermediate 2 20 +> progression 3 40 +> empty)
  +> empty
  
legRaise :: Series 
legRaise
   = step LegRaise KneeTucks
      (beginner 1 10 +> intermediate 2 25 +> progression 3 40 +> empty)
  +> step LegRaise FlatKneeRaises
      (beginner 1 10 +> intermediate 2 20 +> progression 3 35 +> empty)
  +> empty

{-pullUp :: Series
pullUp = series PullUp
   $ step "Vertical Pulls" 
      (beginner 1 10 +> intermediate 2 20 +> progression 3 40 +> empty)
  +> step "Horizontal Pulls" 
      (beginner 1 10 +> intermediate 2 20 +> progression 3 30 +> empty)
  +> empty

squat :: Series
squat = series Squat
   $ step "Shoulderstand Squats" 
      (beginner 1 10 +> intermediate 2 25 +> progression 3 50 +> empty)
  +> step "Jackknife Squats" 
      (beginner 1 10 +> intermediate 2 20 +> progression 3 40 +> empty)
  +> empty
-}