module Update exposing (update)

import Json.Decode as JD
import Messages exposing (Msg(..))
import Model exposing (..)
import Native.FileReader
import Task exposing (attempt)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FileSelected event ->
            { model | imageData = Loading } ! [ loadFile event ]

        FileLoaded (Ok binary) ->
            { model | imageData = Success binary } ! []

        FileLoaded (Err error) ->
            { model | imageData = Error error } ! []


loadFile : JD.Value -> Cmd Msg
loadFile =
    Native.FileReader.readFile >> attempt FileLoaded
