module Main exposing (init, main, subscriptions)

import Html exposing (Html, div, program, text)
import Models exposing (Model, initialModel)
import Msgs exposing (Msg(..))
import Update exposing (update)
import View exposing (view)



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
