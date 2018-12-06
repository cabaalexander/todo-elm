module Todo.List exposing (view)

import Html exposing (Html, div, input, label, li, text, ul)
import Html.Attributes exposing (type_)
import Models exposing (Model, Todo)
import Msgs exposing (Msg)


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
        [ label []
            [ input [ type_ "checkbox" ] []
            , text name
            ]
        ]
