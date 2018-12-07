module Models exposing (Model, Todo, initialModel)


initialModel : Model
initialModel =
    { input = ""
    , todos = []
    , currentTodo = Todo 0 "" False
    }


type alias Model =
    { input : String
    , todos : List Todo
    , currentTodo : Todo
    }


type alias Todo =
    { id : Int
    , name : String
    , check : Bool
    }
