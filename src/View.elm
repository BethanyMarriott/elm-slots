module View exposing (view)

import Config exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (onClick)
import Model exposing (Model)
import Msg exposing (Msg(..))
import Styles


view : Model -> Html Msg
view model =
    div
        [ class "container" ]
        [ div
            [ class "modal fade"
            , attribute "tabindex" "-1"
            , attribute "role" "dialog"
            , attribute "aria-labelledby" "exampleModalLabel"
            , attribute "aria-hidden" "false"
            ]
            [ div
                [ class "modal-dialog"
                , id "exampleModal"
                , attribute "role" "document"
                ]
                [ div
                    [ class "modal-content" ]
                    [ div
                        [ class "modal-header" ]
                        [ text "Congratulations!" ]
                    , div
                        [ class "modal-body" ]
                        [ text "stuff" ]
                    ]
                ]
            ]
        , div
            [ class "row" ]
            [ div
                [ class "col-12" ]
                [ div
                    [ class "card mt-4" ]
                    [ div
                        [ class "card-header" ]
                        [ text "Slots Game" ]
                    , div
                        [ class "card-block p-3" ]
                        [ div
                            [ class "row" ]
                            [ div
                                [ class "col d-flex align-items-center justify-content-center" ]
                                [ img
                                    [ src (reelToImageSrc model.reelOne)
                                    , style "height" "250px"
                                    ]
                                    []
                                ]
                            , div
                                [ class "col d-flex align-items-center justify-content-center" ]
                                [ img
                                    [ src (reelToImageSrc model.reelTwo)
                                    , style "height" "250px"
                                    ]
                                    []
                                ]
                            , div
                                [ class "col d-flex align-items-center justify-content-center" ]
                                [ img
                                    [ src (reelToImageSrc model.reelThree)
                                    , style "height" "250px"
                                    , class ""
                                    ]
                                    []
                                ]
                            , div
                                [ class "col-12" ]
                                [ playButtons model
                                , div
                                    [ class "text-center" ]
                                    [ small
                                        []
                                        [ text ("Current Bet: " ++ String.fromInt model.bet ++ " Credits") ]
                                    , br [] []
                                    , small
                                        [ class "mr-2" ]
                                        [ text ("Credits: " ++ String.fromInt model.credits) ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                , div
                    [ class "card mt-4" ]
                    [ div
                        [ class "card-header" ]
                        [ text "Instructions" ]
                    , div
                        [ class "card-block p-4" ]
                        [ div
                            []
                            [ text "blah" ]
                        ]
                    ]
                ]
            ]
        ]


playButtons : Model -> Html Msg
playButtons model =
    case model.credits > 0 of
        True ->
            div
                [ class "col" ]
                [ div
                    [ class "text-center" ]
                    [ button
                        [ class "btn btn-lg btn-block btn-success"
                        , onClick Spin
                        ]
                        [ text "Spin "
                        , br [] []
                        , small
                            []
                            [ text ("(" ++ String.fromInt model.bet ++ " Credits)") ]
                        ]
                    , br [] []
                    , button
                        [ class "btn btn-sm btn-warning mr-2"
                        , onClick MinBet
                        ]
                        [ text "Min Bet" ]
                    , button
                        [ class "btn btn-sm btn-warning mr-2"
                        , onClick DecreaseBet
                        ]
                        [ text "- Bet" ]
                    , button
                        [ class "btn btn-sm btn-warning mr-2"
                        , onClick IncreaseBet
                        ]
                        [ text "+ Bet" ]
                    , button
                        [ class "btn btn-sm btn-warning mr-2"
                        , onClick MaxBet
                        ]
                        [ text "Max Bet" ]
                    ]
                ]

        False ->
            div
                [ class "col" ]
                [ div
                    [ class "text-center" ]
                    [ button
                        [ class "btn btn-success btn-lg"
                        , onClick StartOver
                        ]
                        [ text "Start Over" ]
                    , div
                        [ class "text-danger" ]
                        [ text "Oops, you're out of credits! Game Over." ]
                    ]
                ]
