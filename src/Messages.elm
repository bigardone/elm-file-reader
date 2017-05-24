module Messages exposing (Msg(..))

import Json.Decode as JD


type Msg
    = FileSelected JD.Value
    | FileLoaded String
