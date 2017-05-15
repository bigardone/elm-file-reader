module Main exposing (..)

import Html exposing (..)
import Native.FileReader


-- Model


type alias Model =
    { imageBinary : Maybe String }


initialModel : Model
initialModel =
    { imageBinary = Nothing }



-- Messages


type Msg
    = NoOp



-- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []



-- View


view : Model -> Html Msg
view model =
    let
        test =
            Native.FileReader.test ()
    in
        text test



-- Main


init : ( Model, Cmd Msg )
init =
    initialModel ! []


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }
