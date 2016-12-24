module App.Types where

import Data.Vec
import Pux.Html as H
import Data.Monoid ((<>))
import Data.Typelevel.Num (class Lt, class Nat, D10, D2, D0, D3, reifyInt, (==))
import Data.Typelevel.Num.Sets (toInt)
import Prelude (($))
import Prelude (($), (<<<), map)

-- An exercise series consists of ten (D10) steps.
type Series = Vec D2 Step

newtype Step = Step
  { exercise :: Exercise
  , goals :: Goals
  }

data Exercise
  = PushUp PushUpExercise
  | LegRaise LegRaiseExercise

type Goals = Vec D3 Goal

newtype Goal = Goal
  { standard :: Standard
  , sets :: Sets
  , reps :: Reps
  }

data Standard
  = Beginner
  | Intermediate
  | Progression

type Sets = Int
type Reps = Int

beginner :: Sets -> Reps -> Goal
beginner = goal Beginner

intermediate :: Sets -> Reps -> Goal
intermediate = goal Intermediate

progression :: Sets -> Reps -> Goal
progression = goal Progression

goal :: Standard -> Sets -> Reps -> Goal
goal standard sets reps = Goal $ f standard sets reps
  where f = { standard: _, sets: _, reps: _ }

step :: forall s. (s -> Exercise) -> s -> Goals -> Step
step f s goals = Step { exercise: f s, goals: goals }

data PushUpExercise
  = WallPushup
  | InclinePushup

data LegRaiseExercise
  = KneeTucks
  | FlatKneeRaises

