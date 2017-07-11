module App exposing (..)

import Html exposing (Html, text, div, img, h1, ul, li)
import Html.Attributes exposing (src)
import Html.Events exposing (onMouseOver, onMouseOut)


---- MODEL ----


type alias Model =
    { title : String
    , icon : String
    }


init : String -> ( Model, Cmd Msg )
init path =
    ( { title = "Rakesh Chatrath's personal website"
      , icon = path
      }
    , Cmd.none
    )



---- UPDATE ----


type Msg
    = NoOp

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ img [ src model.icon ] []
        , text model.title
        ]


---- PROGRAM ----


main : Program String Model Msg
main =
    Html.programWithFlags
        { view = view
        , init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        }
