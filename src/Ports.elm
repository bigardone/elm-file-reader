port module Ports exposing (fileSelected, fileLoaded)

import Json.Decode as JD


-- Out ports


port fileSelected : JD.Value -> Cmd msg



-- In ports


port fileLoaded : (String -> msg) -> Sub msg
