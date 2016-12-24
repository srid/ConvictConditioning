module App.Layout where

import App.NotFound as NotFound
import App.Types (Series)
import App.View as View
import App.Data as Data
import App.Routes (Route(Home, NotFound))
import Pux.Html (Html, div, h1, text)

data Action
  = PageView Route

type State =
  { route :: Route
  , program :: Array Series
  }

init :: State
init =
  { route: NotFound
  , program: Data.beginnerProgram 
  }

update :: Action -> State -> State
update (PageView route) state = state { route = route }

view :: State -> Html Action
view state =
  div
    []
    [ h1 [] [ text "Convict Conditioning" ]
    , case state.route of
        Home -> View.view state.program
        NotFound -> NotFound.view state
    ]
