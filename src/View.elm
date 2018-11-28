module View exposing (view)

import Html exposing (Html, div, text)
import Models exposing (Model)
import Msgs exposing (Msg(..))


view : Model -> Html Msg
view model =
    div []
        [ text <| model.text ]
