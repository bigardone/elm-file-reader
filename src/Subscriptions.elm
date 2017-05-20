module Subscriptions exposing (subscriptions)

import Messages exposing (Msg(..))
import Model exposing (Model)
import Ports exposing (fileLoaded)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ fileLoaded FileLoaded ]
