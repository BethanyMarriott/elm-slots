module Msg exposing (Msg(..))

import Config exposing (Reel)
import Random exposing (Generator)


type Msg
    = Spin
    | MaxBet
    | MinBet
    | IncreaseBet
    | DecreaseBet
    | SetReelOne Reel
    | SetReelTwo Reel
    | SetReelThree Reel
    | StartOver
