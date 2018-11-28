module Models exposing (Model, initialModel)


type alias Model =
    { text : String
    }


initialModel : Model
initialModel =
    { text = "Hello world"
    }
