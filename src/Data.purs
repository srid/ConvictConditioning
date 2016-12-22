module App.Data where 

import App.Exercise
import Data.Vec ((+>), empty)
import Prelude (($))

beginnerSeries :: Array ExerciseSeries
beginnerSeries = [ pushUp, legRaise, pullUp, squat  ]

pushUp :: ExerciseSeries
pushUp = series PushUp
   $ step "Wall Pushups" 
      (beginner 1 10 +> intermediate 2 25 +> progression 3 50 +> empty)
  +> step "Incline Pushups" 
      (beginner 1 10 +> intermediate 2 20 +> progression 3 40 +> empty)
  +> empty
  
legRaise :: ExerciseSeries
legRaise = series LegRaise
   $ step "Knee Tucks" 
      (beginner 1 10 +> intermediate 2 25 +> progression 3 40 +> empty)
  +> step "Flat Knee Raises" 
      (beginner 1 10 +> intermediate 2 20 +> progression 3 35 +> empty)
  +> empty

pullUp :: ExerciseSeries
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
