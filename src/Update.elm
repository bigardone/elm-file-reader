module Update exposing (update)

import Messages exposing (Msg(..))
import Model exposing (..)
import Ports exposing (fileSelected)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FileSelected event ->
            { model | imageData = Loading } ! [ fileSelected event ]

        FileLoaded binary ->
            { model | imageData = Success binary } ! []
