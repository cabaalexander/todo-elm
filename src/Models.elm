module Models exposing (Model, Todo, initialModel)


initialModel : Model
initialModel =
    { input = ""
    , todos = []
    , current = Todo 0 "" False 0
    }


type alias Model =
    { input : String
    , todos : List Todo
    , current : Todo
    }


type alias Todo =
    { id : Int
    , name : String
    , check : Bool
    , count : Int
    }
