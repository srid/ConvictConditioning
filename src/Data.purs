module App.Data where 

import App.Exercise
import Data.Vec ((+>), empty)
import Prelude (($))

beginnerSeries :: Array ExerciseSeries
beginnerSeries = [ pushUp ] -- , legRaise, pullUp, squat  ]

pushUp :: ExerciseSeries
pushUp 
   = step PushUp WallPushup
      (beginner 1 10 +> intermediate 2 25 +> progression 3 50 +> empty)
  +> step PushUp InclinePushup
      (beginner 1 10 +> intermediate 2 20 +> progression 3 40 +> empty)
  +> empty
  
legRaise :: ExerciseSeries 
legRaise
   = step LegRaise KneeTucks
      (beginner 1 10 +> intermediate 2 25 +> progression 3 40 +> empty)
  +> step LegRaise FlatKneeRaises
      (beginner 1 10 +> intermediate 2 20 +> progression 3 35 +> empty)
  +> empty

{-pullUp :: ExerciseSeries
pullUp = series PullUp
   $ step "Vertical Pulls" 
      (beginner 1 10 +> intermediate 2 20 +> progression 3 40 +> empty)
  +> step "Horizontal Pulls" 
      (beginner 1 10 +> intermediate 2 20 +> progression 3 30 +> empty)
  +> empty

squat :: ExerciseSeries
squat = series Squat
   $ step "Shoulderstand Squats" 
      (beginner 1 10 +> intermediate 2 25 +> progression 3 50 +> empty)
  +> step "Jackknife Squats" 
      (beginner 1 10 +> intermediate 2 20 +> progression 3 40 +> empty)
  +> empty
-}