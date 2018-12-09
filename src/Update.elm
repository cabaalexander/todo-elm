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

                newTodo =
                    Todo id inputValue False 0
            in
            ( { model
                | input = inputValue
                , currentTodo = newTodo
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


riseTodoCount : Todo -> Todo
riseTodoCount todo =
    { todo | count = todo.count + 1 }


addOrCountTodo : Todo -> List Todo -> List Todo
addOrCountTodo todo todos =
    let
        names =
            List.map (\x -> x.name) todos
    in
    if List.member todo.name names then
        List.map
            (\mapTodo ->
                if mapTodo.name == todo.name then
                    riseTodoCount mapTodo

                else
                    mapTodo
            )
            todos

    else
        todo :: todos


addTodo : Model -> Model
addTodo model =
    if model.input == "" then
        model

    else
        let
            id =
                List.length model.todos

            newTodos =
                addOrCountTodo model.currentTodo model.todos
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
