module App exposing (..)

import Html exposing (Html, text, div, img, h1, a, p)
import Html.Attributes exposing (src, classList)
import Html.Events exposing (onMouseOver, onMouseOut)


---- MODEL ----


type alias Model =
    { title : String
    , icon : String
    , description : String
    }

components =
  { programming = { title = "Programming"
                  , icon = "./static/img/programming.svg"
                  , description = "I do full stack web development with interests in data science, machine learning, computer vision, and computational biology research."
                  }
    , photography = { title = "Photography"
                    , icon = "./static/img/photography.svg"
                    , description = "I love taking photos of things - especially street, landscape and portraiture photography."
                    }
    , blog = { title = "Blog"
             , icon = "./static/img/blog.svg"
             , description = "I like to write about all sorts of things pertaining to myself and technology."
             }
    , resume = { title = "Resume"
               , icon = "./static/img/resume.svg"
               , description = "Interested in hiring me? Contact me at rakesh@rakeshchatrath.me."
               }
    , default = { title = "Hi. I'm Rakesh Chatrath."
                , icon = "./static/img/logo.svg"
                , description = "I like all things technology, photography and biology."
                }
  }


init : String -> ( Model, Cmd Msg )
init path =
    ( { title = components.default.title
      , icon = path
      , description = components.default.description
      }
    , Cmd.none
    )



---- UPDATE ----


-- type Msg
--     = NoOp
--
-- update : Msg -> Model -> ( Model, Cmd Msg )
-- update msg model =
--     ( model, Cmd.none )

type Msg
  = Programming
  | Photography
  | Blog
  | Resume
  | Default

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Programming ->
      ( { model
        | title = components.programming.title
        , description = components.programming.description
        , icon = components.programming.icon
        }
        , Cmd.none )
    Photography ->
      ( { model
        | title = components.photography.title
        , description = components.photography.description
        , icon = components.photography.icon
        }
      , Cmd.none )
    Blog ->
      ( { model
        | title = components.blog.title
        , description = components.blog.description
        , icon = components.blog.icon
        }
      , Cmd.none )
    Resume ->
      ( { model
        | title = components.resume.title
        , description = components.resume.description
        , icon = components.resume.icon
        }
      , Cmd.none )
    Default ->
      ( { model
        | title = components.default.title
        , description = components.default.description
        , icon = components.default.icon
        }
      , Cmd.none )


---- VIEW ----


view : Model -> Html Msg
view model =
    div [ classList [ ("home-containter", True) ] ]
        [ div [ classList [ ("top-header", True ) ] ]
              [ div [ classList [ ("image-container", True) ] ] [ img [ src model.icon ] [] ]
              , div [ classList [ ("header-container", True ) ] ]
                    [
                      h1 [ classList [ ("home-title-header", True) ] ] [ text model.title ]
                    , p [ classList [ ("home-title-description", True) ] ] [ text model.description ]
                    ]
              ]
        , div [ classList [ ("links-container", True ) ] ]
              [ p [] [ a [ onMouseOver Programming, onMouseOut Default ] [ text "Programming" ] ]
              , p [] [ a [ onMouseOver Photography, onMouseOut Default ] [ text "Photography" ] ]
              , p [] [ a [ onMouseOver Blog, onMouseOut Default ] [ text "Blog" ] ]
              , p [] [ a [ onMouseOver Resume, onMouseOut Default ] [ text "Resume" ] ]
              ]
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
