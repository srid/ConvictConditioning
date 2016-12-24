module App.Exercise where

import Data.Vec
import Pux.Html as H
import Data.Monoid ((<>))
import Data.Typelevel.Num (class Lt, class Nat, D10, D2, D0, D3, reifyInt, (==))
import Data.Typelevel.Num.Sets (toInt)
import Prelude (($))
import Prelude (($), (<<<), map)
import Pux.Html (Html)

type ExerciseSeries = Vec D2 Step

data PushUpExercise
  = WallPushup
  | InclinePushup

data LegRaiseExercise
  = KneeTucks
  | FlatKneeRaises

data Exercise
  = PushUp PushUpExercise
  | LegRaise LegRaiseExercise

newtype Step = Step
  { exercise :: Exercise
  , goals :: Goals
  }

step :: forall s. (s -> Exercise) -> s -> Goals -> Step
step f s goals = Step { exercise: f s, goals: goals }

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

-- View

{-class HtmlView state where
  viewHtml :: forall action. state -> Html action

instance htmlViewExercise :: HtmlView Exercise where
  viewHtml (PushUp steps) = H.div [] $ [heading] <> map viewHtml steps
    where heading = H.h2 [] [ H.text "Push Up" ]
  viewHtml (LegRaise steps) = H.div [] $ [heading] <> map viewHtml steps
    where heading = H.h2 [] [ H.text "Leg Raise" ]

instance htmlViewStep :: HtmlView Step where
  viewHtml step = H.div [] [ H.text (name step) ]
    where name (One name _) = name
          name (Two name _) = name
          name (Three name _) = name
          name (Four name _) = name

instance htmlViewExercises :: HtmlView (Array Exercise) where
  viewHtml = H.div [] <<< map viewHtml-}

view :: forall action. Array ExerciseSeries -> Html action
-- view = viewHtml
view _ = H.div [] []
