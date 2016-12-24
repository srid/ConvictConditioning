module App.View where 

import Pux.Html as H
import Pux.Html (Html)
import App.Types (Series)

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

view :: forall action. Array Series -> Html action
-- view = viewHtml
view _ = H.div [] []
