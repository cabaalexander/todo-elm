module Todo.List exposing (view)

import Html exposing (Html, button, i, input, label, li, span, text, ul)
import Html.Attributes exposing (type_)
import Html.Events exposing (onClick)
import Models exposing (Model, Todo)
import Msgs exposing (Msg(..))


view : Model -> Html Msg
view model =
    viewList model.todos


viewList : List Todo -> Html Msg
viewList todos =
    List.map viewTodo todos
        |> ul []


viewTodo : Todo -> Html Msg
viewTodo { id, name, count } =
    li []
        [ label
            [ onClick <| ToggleCheck id
            ]
            [ input [ type_ "checkbox" ] []
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
