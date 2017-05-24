module Model exposing (..)


type ImageData e s
    = NotLoaded
    | Loading
    | Error e
    | Success s


type alias Model =
    { imageData : ImageData String String }


initialModel : Model
initialModel =
    { imageData = NotLoaded }
