module Update exposing (update)

import Models exposing (Model, Todo, initialModel)
import Msgs exposing (Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnInputChange inputValue ->
            let
                id =
                    List.length model.todos
            in
            ( { model
                | input = inputValue
                , currentTodo = Todo id inputValue False
              }
            , Cmd.none
            )

        AddTodo ->
            ( addTodo model, Cmd.none )

        KeyDown code ->
            ( addOnKeyDown code model, Cmd.none )

        ToggleCheck id ->
            let
                newTodos =
                    List.map (toggleTodo id) model.todos
            in
            ( { model | todos = newTodos }, Cmd.none )

        RemoveTodo id ->
            let
                newTodos =
                    List.filter (\t -> t.id /= id) model.todos
            in
            ( { model | todos = newTodos }, Cmd.none )


addTodo : Model -> Model
addTodo model =
    if model.input == "" then
        model

    else
        updateTodos model


updateTodos : Model -> Model
updateTodos { todos, currentTodo } =
    let
        id =
            List.length todos

        newTodos =
            currentTodo :: todos
    in
    { initialModel
        | todos = newTodos
    }


addOnKeyDown : Int -> Model -> Model
addOnKeyDown code model =
    if code == 13 then
        addTodo model

    else
        model


toggleTodo : Int -> Todo -> Todo
toggleTodo id todo =
    if id == todo.id then
        { todo | check = not todo.check }

    else
        todo
