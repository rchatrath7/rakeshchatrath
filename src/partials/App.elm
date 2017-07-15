module App exposing (..)

import Html exposing (Html, text, div, img, h1, a, p, i)
import Html.Attributes exposing (src, classList)
import Html.Events exposing (onMouseOver, onMouseOut, onMouseEnter, onClick)

import Array exposing (Array)
import String exposing (slice)

---- MODEL ----

-- I'm stupid and don't know how to pass multiple images to elm, so I'm using a
-- janky workaround: create a list of all the possible paths, and also store an
-- indicator value we manually update when state is changed.
-- { 0: 'Logo', 1: 'Programming', 2: 'Photography', 3: 'Blog', 4: 'Resume'}

type alias Model =
    { title : String
    , paths : Array String
    , description : String
    , indicator : Int
    , isProgramming : Bool
    , isPhotography : Bool
    , isBlog: Bool
    , isResume : Bool
    }

type alias Flags =
    { logoPath : String,
      programmingPath : String,
      photographyPath : String,
      blogPath : String,
      resumePath : String
    }

components =
  { programming = { title = "Programming"
                  , indicator = 1
                  , description = "I do full stack web development with interests in data science, machine learning, computer vision, and computational biology research."
                  , isProgramming = True
                  , isPhotography = False
                  , isBlog = False
                  , isResume = False
                  }
    , photography = { title = "Photography"
                    , indicator = 2
                    , description = "I love taking photos of things - especially street, landscape and portraiture photography."
                    , isProgramming = False
                    , isPhotography = True
                    , isBlog = False
                    , isResume = False
                    }
    , blog = { title = "Blog"
             , indicator = 3
             , description = "I like to write about all sorts of things pertaining to myself and technology."
             , isProgramming = False
             , isPhotography = False
             , isBlog = True
             , isResume = False
             }
    , resume = { title = "Resume"
               , indicator = 4
               , description = "Interested in hiring me? Contact me at rakesh@rakeshchatrath.me."
               , isProgramming = False
               , isPhotography = False
               , isBlog = False
               , isResume = True
               }
    , default = { title = "Hi. I'm Rakesh Chatrath."
                , indicator = 0
                , description = "I like all things technology, photography and biology."
                , isProgramming = False
                , isPhotography = False
                , isBlog = False
                , isResume = False
                }
  }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { title = components.default.title
      , paths = Array.fromList [ flags.logoPath
                , flags.programmingPath
                , flags.photographyPath
                , flags.blogPath
                , flags.resumePath
                ]
      , indicator = 0
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
        , indicator = components.programming.indicator
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
        , indicator = components.photography.indicator
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
        , indicator = components.blog.indicator
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
        , indicator = components.resume.indicator
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
        , indicator = components.default.indicator
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
              [ div [ classList [ ("image-container", True) ] ] [ img [ src <| slice 6 -1 <| toString <| Array.get model.indicator (model.paths) ] [] ]
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
        , div [ classList [ ("footer", True) ] ]
              [ i [ classList [ ( "fa fa-envelope", True ) ] ] []
              , i [ classList [ ( "fa fa-github", True ) ] ] []
              , i [ classList [ ( "fa fa-linkedin", True ) ] ] []
              , i [ classList [ ( "fa fa-twitter", True ) ] ] []
              ]
        ]


---- PROGRAM ----


main : Program Flags Model Msg
main =
    Html.programWithFlags
        { view = view
        , init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        }
