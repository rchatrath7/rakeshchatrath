module App exposing (..)

import Html exposing (Html, text, div, img, h1, a, p)
import Html.Attributes exposing (src, classList)
import Html.Events exposing (onMouseOver, onMouseOut, onMouseEnter)


---- MODEL ----


type alias Model =
    { title : String
    , icon : String
    , description : String
    , isProgramming : Bool
    , isPhotography : Bool
    , isBlog: Bool
    , isResume : Bool
    }

components =
  { programming = { title = "Programming"
                  , icon = "./static/img/programming.svg"
                  , description = "I do full stack web development with interests in data science, machine learning, computer vision, and computational biology research."
                  , isProgramming = True
                  , isPhotography = False
                  , isBlog = False
                  , isResume = False
                  }
    , photography = { title = "Photography"
                    , icon = "./static/img/photography.svg"
                    , description = "I love taking photos of things - especially street, landscape and portraiture photography."
                    , isProgramming = False
                    , isPhotography = True
                    , isBlog = False
                    , isResume = False
                    }
    , blog = { title = "Blog"
             , icon = "./static/img/blog.svg"
             , description = "I like to write about all sorts of things pertaining to myself and technology."
             , isProgramming = False
             , isPhotography = False
             , isBlog = True
             , isResume = False
             }
    , resume = { title = "Resume"
               , icon = "./static/img/resume.svg"
               , description = "Interested in hiring me? Contact me at rakesh@rakeshchatrath.me."
               , isProgramming = False
               , isPhotography = False
               , isBlog = False
               , isResume = True
               }
    , default = { title = "Hi. I'm Rakesh Chatrath."
                , icon = "./static/img/logo.svg"
                , description = "I like all things technology, photography and biology."
                , isProgramming = False
                , isPhotography = False
                , isBlog = False
                , isResume = False
                }
  }


init : String -> ( Model, Cmd Msg )
init path =
    ( { title = components.default.title
      , icon = path
      , description = components.default.description
      , isProgramming = components.default.isProgramming
      , isPhotography = components.default.isPhotography
      , isBlog = components.default.isBlog
      , isResume = components.default.isResume
      }
    , Cmd.none
    )



---- UPDATE ----


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
        , isProgramming = components.programming.isProgramming
        , isPhotography = components.programming.isPhotography
        , isBlog = components.programming.isBlog
        , isResume = components.programming.isResume
        }
        , Cmd.none )
    Photography ->
      ( { model
        | title = components.photography.title
        , description = components.photography.description
        , icon = components.photography.icon
        , isProgramming = components.photography.isProgramming
        , isPhotography = components.photography.isPhotography
        , isBlog = components.photography.isBlog
        , isResume = components.photography.isResume
        }
      , Cmd.none )
    Blog ->
      ( { model
        | title = components.blog.title
        , description = components.blog.description
        , icon = components.blog.icon
        , isProgramming = components.blog.isProgramming
        , isPhotography = components.blog.isPhotography
        , isBlog = components.blog.isBlog
        , isResume = components.blog.isResume
        }
      , Cmd.none )
    Resume ->
      ( { model
        | title = components.resume.title
        , description = components.resume.description
        , icon = components.resume.icon
        , isProgramming = components.resume.isProgramming
        , isPhotography = components.resume.isPhotography
        , isBlog = components.resume.isBlog
        , isResume = components.resume.isResume
        }
      , Cmd.none )
    Default ->
      ( { model
        | title = components.default.title
        , description = components.default.description
        , icon = components.default.icon
        , isProgramming = components.default.isProgramming
        , isPhotography = components.default.isPhotography
        , isBlog = components.default.isBlog
        , isResume = components.default.isResume
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
                      h1 [ classList [ ("home-title-header", True)
                                     , ("programming", model.isProgramming)
                                     , ("photography", model.isPhotography)
                                     , ("blog", model.isBlog)
                                     , ("resume", model.isResume)
                                     ]
                         ]
                         [ text model.title ]
                    , p [ classList [ ("home-title-description", True)
                                    , ("programming", model.isProgramming)
                                    , ("photography", model.isPhotography)
                                    , ("blog", model.isBlog)
                                    , ("resume", model.isResume)
                                    ]
                        ]
                        [ text model.description ]
                    ]
              ]
        , div [ classList [ ("links-container", True ) ] ]
              [ p [] [ a [ onMouseEnter Programming
                         , onMouseOut Default
                         , classList [ ("programming", True) ]
                         ]
                         [ text "Programming" ]
                      ]
              , p [] [ a [ onMouseOver Photography
                         , onMouseOut Default
                         , classList [ ("photography", True) ]
                         ]
                         [ text "Photography" ]
                     ]
              , p [] [ a [ onMouseOver Blog
                         , onMouseOut Default
                         , classList [ ("blog", True) ]
                         ]
                         [ text "Blog" ]
                     ]
              , p [] [ a [ onMouseOver Resume
                         , onMouseOut Default
                         , classList [ ("resume", True) ]
                         ]
                         [ text "Resume" ]
                     ]
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
