module View exposing (view)

import Html exposing (Attribute, Html, button, div, h1, input, label, text)
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
        , bottom
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


bottom : Html Msg
bottom =
    let
        buttons : List ( Msg, String ) -> List (Html Msg)
        buttons lst =
            case lst of
                [] ->
                    []

                ( msg, txt ) :: xs ->
                    [ button
                        [ onClick <| msg ]
                        [ text <| txt ]
                    ]
                        ++ buttons xs
    in
    div [] <|
        [ label [] [ text "Sort by:" ] ]
            ++ buttons [ ( Asc, "^" ), ( Desc, "v" ) ]
