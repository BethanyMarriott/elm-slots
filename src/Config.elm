module Config exposing (Reel(..), reelToImageSrc)


type Reel
    = One
    | Two
    | Three
    | Four
    | Five
    | Six
    | Seven


reelToImageSrc : Reel -> String
reelToImageSrc reel =
    case reel of
        One ->
            "images/pompom.png"

        Two ->
            "images/cheekyscott.png"

        Three ->
            "images/dopey_hound.png"

        Four ->
            "images/sibe.png"

        Five ->
            "images/bully.png"

        Six ->
            "images/shep.png"

        Seven ->
            "images/happy_staffy.png"
