module Main exposing (main)

import Browser
import Html exposing (Html, div, text)


type alias Model =
    { thing : String }


initialModel : Model
initialModel =
    { thing = "hi" }


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model


view : Model -> Html Msg
view model =
    div
        []
        [ text "hiiii"
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }