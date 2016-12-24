module App.ExerciseLog where 

import App.Types
import Data.Date as Date
import App.Exercise (PushUpExercise(..))
import Data.Date (Date, Month(..), canonicalDate)
import Data.Date.Component (Day, Year(..))
import Data.List (List)

type ExerciseLog = List LogEntry 


data LogEntry = LogEntry Date Exercise 

sampleEntry :: LogEntry 
sampleEntry = LogEntry date $ PushUp InclinePushup
 where date = Date.canonicalDate (Year 2016) December (Day 23)

