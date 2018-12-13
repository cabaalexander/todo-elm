module Todo.List exposing (view)

import Html exposing (Attribute, Html, button, div, hr, i, input, label, li, span, text, ul)
import Html.Attributes exposing (checked, class, type_)
import Html.Events exposing (onClick)
import Models exposing (Model, Todo)
import Msgs exposing (Msg(..))


view : Model -> Html Msg
view { todos } =
    let
        ( notDone, completed ) =
            List.partition
                (\{ check } -> check == False)
                todos

        hrCompleted =
            if List.isEmpty completed then
                div [] []

            else
                hr [] []
    in
    [ ( notDone, [ class "not-done" ] )
    , ( completed, [ class "completed" ] )
    ]
        |> List.map viewList
        |> List.intersperse hrCompleted
        |> div []


viewList : ( List Todo, List (Attribute Msg) ) -> Html Msg
viewList ( todos, containerAttributes ) =
    ul containerAttributes <|
        List.map viewTodo todos


viewTodo : Todo -> Html Msg
viewTodo { id, name, count, check } =
    li []
        [ label
            []
            [ input
                [ type_ "checkbox"
                , checked check
                , onClick <| ToggleCheck id
                ]
                []
            , text name
            ]
        , span
            []
            [ text <| toString count ]
        , button
            [ onClick <| RemoveTodo id
            ]
            [ i [] [ text "x" ]
            ]
        ]
