module View exposing (view)

import Html exposing (Html, div, h1, input, text)
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onInput)
import Models exposing (Model)
import Msgs exposing (Msg(..))


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Todos" ]
        , input
            [ value model.input
            , placeholder "Just do it"
            , onInput OnInputChange
            ]
            []
        ]
