module App.Exercise where

import Prelude (($))

data Exercise 
  = PushUp Steps 
  | LegRaise Steps

type Steps = Array Step
type Sets = Int 
type Reps = Int

data Step 
  = One String Standards
  | Two String Standards 
  | Three String Standards
  | Four String Standards

step :: (String -> Standards -> Step) -> String -> BeginnerStandard -> IntermediateStandard -> ProgressionStandard -> Step 
step c name s1 s2 s3 = c name $ Standards s1 s2 s3  

data Standards = Standards BeginnerStandard IntermediateStandard ProgressionStandard

type BeginnerStandard = Standard
type IntermediateStandard = Standard 
type ProgressionStandard = Standard

data Standard = Standard Sets Reps 

pushUp :: Exercise 
pushUp = 
  PushUp
    [ step One "Wall Pushups" (s 1 10) (s 2 25) (s 3 50) 
    , step Two "Incline Pushups" (s 1 10) (s 2 20) (s 3 40)
    ]
    where s = Standard

exercises :: Array Exercise 
exercises = 
  [ pushUp  ]

-- 

type ExerciseCursor = (Steps -> Exercise) 

