module Msgs exposing (Msg(..), SortMode(..))


type Msg
    = OnInputChange String
    | AddTodo
    | KeyDown Int
    | ToggleCheck Int
    | RemoveTodo Int
    | ToggleSortBy


type SortMode
    = Asc
    | Desc
