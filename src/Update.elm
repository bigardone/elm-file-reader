module Update exposing (update)

import Json.Decode as JD
import Messages exposing (Msg(..))
import Model exposing (..)
import Native.FileReader
import Task


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FileSelected event ->
            { model | imageData = Loading } ! [ readFile event ]

        FileLoaded (Ok binary) ->
            { model | imageData = Success binary } ! []

        FileLoaded (Err error) ->
            { model | imageData = Error error } ! []


readFile : JD.Value -> Cmd Msg
readFile =
    Native.FileReader.readFile >> Task.attempt FileLoaded
