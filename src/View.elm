module View exposing (view)

import Html exposing (Attribute, Html, button, div, h1, input, text)
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (keyCode, on, onClick, onInput)
import Json.Decode as D
import Models exposing (Model)
import Msgs exposing (Msg(..))
import Todo.List exposing (view)


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Todos" ]
        , inputField model.input
        , button
            [ onClick AddTodo ]
            [ text "Add" ]
        , Todo.List.view model
        ]


inputField : String -> Html Msg
inputField inputValue =
    input
        [ value inputValue
        , placeholder "Just do it"
        , onInput OnInputChange
        , onKeydown KeyDown
        ]
        []


onKeydown : (Int -> msg) -> Attribute msg
onKeydown tagger =
    on "keydown" (D.map tagger keyCode)
