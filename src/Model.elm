module Model exposing (Model, initialModel)

import Config exposing (..)


type alias Model =
    { credits : Int
    , bet : Int
    , reelOne : Reel
    , reelTwo : Reel
    , reelThree : Reel
    , winningDogs : Int
    }


initialModel : Model
initialModel =
    { credits = 100
    , bet = 5
    , reelOne = Seven
    , reelTwo = Seven
    , reelThree = Seven
    , winningDogs = 0
    }
