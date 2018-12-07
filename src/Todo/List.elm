module Todo.List exposing (view)

import Html exposing (Html, button, div, i, input, label, li, text, ul)
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
viewTodo { id, name, check } =
    li []
        [ label
            [ onClick <| ToggleCheck id
            ]
            [ input [ type_ "checkbox" ] []
            , text name
            ]
        , button
            [ onClick <| RemoveTodo id
            ]
            [ i [] [ text "x" ]
            ]
        ]
