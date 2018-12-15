module Update exposing (update)

import Config exposing (..)
import Model exposing (Model, initialModel)
import Msg exposing (Msg(..))
import Random exposing (Generator)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Spin ->
            ( { model | credits = model.credits - model.bet, winningDogs = 0 }
            , Cmd.batch
                [ Random.generate SetReelOne reelOne
                , Random.generate SetReelTwo reelTwo
                , Random.generate SetReelThree reelThree
                ]
            )

        IncreaseBet ->
            let
                increase =
                    case model.credits == model.bet of
                        True ->
                            model.bet

                        False ->
                            model.bet + 10
            in
            ( { model | bet = increase }
            , Cmd.none
            )

        DecreaseBet ->
            let
                decrease =
                    case model.bet > model.credits of
                        True ->
                            model.bet - 10

                        False ->
                            model.bet
            in
            ( { model | bet = decrease }
            , Cmd.none
            )

        MaxBet ->
            ( { model | bet = model.credits }
            , Cmd.none
            )

        MinBet ->
            ( { model | bet = 10 }
            , Cmd.none
            )

        SetReelOne reel ->
            let
                winningDogs =
                    if reel == Seven then
                        model.winningDogs + 1

                    else
                        model.winningDogs
            in
            ( { model
                | reelOne = reel
                , winningDogs = winningDogs
                , credits =
                    if winningDogs == 3 then
                        model.credits * 100

                    else
                        model.credits
              }
            , Cmd.none
            )

        SetReelTwo reel ->
            let
                winningDogs =
                    if reel == Seven then
                        model.winningDogs + 1

                    else
                        model.winningDogs
            in
            ( { model
                | reelTwo = reel
                , winningDogs = winningDogs
                , credits =
                    if winningDogs == 3 then
                        model.credits * 100

                    else
                        model.credits
              }
            , Cmd.none
            )

        SetReelThree reel ->
            let
                winningDogs =
                    if reel == Seven then
                        model.winningDogs + 1

                    else
                        model.winningDogs
            in
            ( { model
                | reelThree = reel
                , winningDogs = winningDogs
                , credits =
                    if winningDogs == 3 then
                        model.credits * 100

                    else
                        model.credits
              }
            , Cmd.none
            )

        StartOver ->
            ( initialModel
            , Cmd.none
            )


reelOne : Random.Generator Reel
reelOne =
    Random.weighted
        ( 10, One )
        [ ( 10, Two )
        , ( 10, Three )
        , ( 10, Four )
        , ( 15, Five )
        , ( 40, Six )
        , ( 5, Seven )
        ]


reelTwo : Random.Generator Reel
reelTwo =
    Random.weighted
        ( 10, One )
        [ ( 10, Two )
        , ( 10, Three )
        , ( 10, Four )
        , ( 10, Five )
        , ( 10, Six )
        , ( 40, Seven )
        ]


reelThree : Random.Generator Reel
reelThree =
    Random.weighted
        ( 10, One )
        [ ( 10, Two )
        , ( 10, Three )
        , ( 10, Four )
        , ( 10, Five )
        , ( 10, Six )
        , ( 40, Seven )
        ]
