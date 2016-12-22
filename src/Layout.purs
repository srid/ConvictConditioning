module App.Layout where

import App.NotFound as NotFound
import App.Exercise as Exercise
import App.Routes (Route(Home, NotFound))
import Pux.Html (Html, div, h1, text)

data Action
  = PageView Route

type State =
  { route :: Route
  , allSeries :: Array Exercise.ExerciseSeries
  }

init :: State
init =
  { route: NotFound
  , allSeries: Exercise.beginnerSeries 
  }

update :: Action -> State -> State
update (PageView route) state = state { route = route }

view :: State -> Html Action
view state =
  div
    []
    [ h1 [] [ text "Convict Conditioning" ]
    , case state.route of
        Home -> Exercise.view state.allSeries
        NotFound -> NotFound.view state
    ]
