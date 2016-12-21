module App.Layout where

import App.NotFound as NotFound
import App.Exercise (Exercise)
import App.Exercise as Exercise
import App.Routes (Route(Home, NotFound))
import Pux.Html (Html, div, h1, text)

data Action
  = PageView Route

type State =
  { route :: Route
  , exercises :: Array Exercise
  }

init :: State
init =
  { route: NotFound
  , exercises: Exercise.allExercises 
  }

update :: Action -> State -> State
update (PageView route) state = state { route = route }

view :: State -> Html Action
view state =
  div
    []
    [ h1 [] [ text "Convict Conditioning" ]
    , case state.route of
        Home -> Exercise.view state.exercises
        NotFound -> NotFound.view state
    ]
