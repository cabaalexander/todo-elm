module Update exposing (update)

import Models exposing (Model)
import Msgs exposing (Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnInputChange text ->
            ( { model | input = text }, Cmd.none )
