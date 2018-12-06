module Models exposing (Model, Todo, initialModel)


initialModel : Model
initialModel =
    { input = ""
    , todos = []
    }


type alias Model =
    { input : String
    , todos : List Todo
    }


type alias Todo =
    { id : Int
    , name : String
    , check : Bool
    }
