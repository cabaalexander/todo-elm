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
                , current = newTodo
              }
            , Cmd.none
            )

        AddTodo ->
            ( addTodo model, Cmd.none )

        KeyDown code ->
            let
                newModel =
                    case code of
                        13 ->
                            addTodo model

                        _ ->
                            model
            in
            ( newModel, Cmd.none )

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

        Asc ->
            let
                newTodos =
                    List.sortBy .count model.todos
            in
            ( { model | todos = newTodos }, Cmd.none )

        Desc ->
            let
                descending a b =
                    case compare a.count b.count of
                        EQ ->
                            EQ

                        LT ->
                            GT

                        GT ->
                            LT

                newTodos =
                    List.sortWith descending model.todos
            in
            ( { model | todos = newTodos }, Cmd.none )


riseTodoCount : String -> Todo -> Todo
riseTodoCount name todo =
    if name == todo.name then
        { todo | count = todo.count + 1 }

    else
        todo


addOrCountTodo : Todo -> List Todo -> List Todo
addOrCountTodo todo todos =
    let
        names =
            List.map .name todos

        todoName =
            .name todo
    in
    if List.member todoName names then
        List.map (riseTodoCount todoName) todos

    else
        todos ++ [ todo ]


addTodo : Model -> Model
addTodo model =
    case model.input of
        "" ->
            model

        _ ->
            let
                { todos, current } =
                    model

                newTodos =
                    addOrCountTodo current todos
            in
            { initialModel | todos = newTodos }


toggleTodo : Int -> Todo -> Todo
toggleTodo id todo =
    if id == todo.id then
        { todo | check = not todo.check }

    else
        todo
