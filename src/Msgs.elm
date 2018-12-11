module Msgs exposing (Msg(..))


type Msg
    = OnInputChange String
    | AddTodo
    | KeyDown Int
    | ToggleCheck Int
    | RemoveTodo Int
    | Asc
    | Desc
