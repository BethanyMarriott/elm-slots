module Main exposing (main)

import Browser
import Html.Styled exposing (toUnstyled)
import Model exposing (Model, initialModel)
import Msg exposing (Msg)
import Update exposing (update)
import View exposing (view)


main : Program () Model Msg
main =
    Browser.element
        { init = always ( initialModel, Cmd.none )
        , subscriptions = always Sub.none
        , view = view >> toUnstyled
        , update = update
        }
