module Models exposing (Model, Todo, initialModel)

import Msgs exposing (SortMode(..))


initialModel : Model
initialModel =
    { input = ""
    , todos = []
    , currentTodo = Todo 0 "" False 0
    , sortMode = Asc
    }


type alias Model =
    { input : String
    , todos : List Todo
    , currentTodo : Todo
    , sortMode : SortMode
    }


type alias Todo =
    { id : Int
    , name : String
    , check : Bool
    , count : Int
    }
