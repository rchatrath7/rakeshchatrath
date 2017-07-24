module App exposing (..)

import Html exposing (Html, text, div, img, h1, a, p, i)
import Html.Attributes exposing (src, classList, href)
import Html.Events exposing (onMouseOver, onMouseOut, onMouseEnter, onMouseLeave, onClick)

import Array exposing (Array)
import String exposing (slice)
import List exposing (..)

import Navigation

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
    , isDefault : Bool
    , isProgramming : Bool
    , isPhotography : Bool
    , isBlog: Bool
    , isResume : Bool
    , hasLeftLink : Bool
    , isFull : Bool
    , currentRoute : Navigation.Location
    }

type alias Flags =
    { logoPath : String,
      programmingPath : String,
      photographyPath : String,
      blogPath : String,
      resumePath : String
    }

type RoutePath
  = DefaultRoute
  | HomeRoute
  | ProgrammingRoute
  | PhotographyRoute
  | BlogRoute
  | ResumeRoute
  | NotFoundRoute

components =
  { programming = { title = "Programming"
                  , indicator = 1
                  , description = "I like web dev, data science and bioinformatics."
                  , isDefault = False
                  , isProgramming = True
                  , isPhotography = False
                  , isBlog = False
                  , isResume = False
                  }
    , photography = { title = "Photography"
                    , indicator = 2
                    , description = "I love street, landscape and portraiture photography."
                    , isDefault = False
                    , isProgramming = False
                    , isPhotography = True
                    , isBlog = False
                    , isResume = False
                    }
    , blog = { title = "Blog"
             , indicator = 3
             , description = "I like to write about myself and all things tech."
             , isDefault = False
             , isProgramming = False
             , isPhotography = False
             , isBlog = True
             , isResume = False
             }
    , resume = { title = "Resume"
               , indicator = 4
               , description = "Interested in hiring me? Contact me at below."
               , isDefault = False
               , isProgramming = False
               , isPhotography = False
               , isBlog = False
               , isResume = True
               }
    , default = { title = "Hi. I'm Rakesh Chatrath."
                , indicator = 0
                , description = "I like all things technology, photography and biology."
                , isDefault = True
                , isProgramming = False
                , isPhotography = False
                , isBlog = False
                , isResume = False
                }
  }


init : Flags -> Navigation.Location -> ( Model, Cmd Msg )
init flags location =
    ( { title = components.default.title
      , paths = Array.fromList [ flags.logoPath
                , flags.programmingPath
                , flags.photographyPath
                , flags.blogPath
                , flags.resumePath
                ]
      , indicator = 0
      , description = components.default.description
      , isDefault = components.default.isDefault
      , isProgramming = components.default.isProgramming
      , isPhotography = components.default.isPhotography
      , isBlog = components.default.isBlog
      , isResume = components.default.isResume
      , hasLeftLink = False
      , isFull = True
      , currentRoute = location
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
  | ScrollDown
  | UrlChange Navigation.Location

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Programming ->
      ( { model
        | title = components.programming.title
        , description = components.programming.description
        , indicator = components.programming.indicator
        , isDefault = components.programming.isDefault
        , isProgramming = components.programming.isProgramming
        , isPhotography = components.programming.isPhotography
        , isBlog = components.programming.isBlog
        , isResume = components.programming.isResume
        , hasLeftLink = True
        }
        , Cmd.none )
    Photography ->
      ( { model
        | title = components.photography.title
        , description = components.photography.description
        , indicator = components.photography.indicator
        , isDefault = components.photography.isDefault
        , isProgramming = components.photography.isProgramming
        , isPhotography = components.photography.isPhotography
        , isBlog = components.photography.isBlog
        , isResume = components.photography.isResume
        , hasLeftLink = False
        }
      , Cmd.none )
    Blog ->
      ( { model
        | title = components.blog.title
        , description = components.blog.description
        , indicator = components.blog.indicator
        , isDefault = components.blog.isDefault
        , isProgramming = components.blog.isProgramming
        , isPhotography = components.blog.isPhotography
        , isBlog = components.blog.isBlog
        , isResume = components.blog.isResume
        , hasLeftLink = False
        }
      , Cmd.none )
    Resume ->
      ( { model
        | title = components.resume.title
        , description = components.resume.description
        , indicator = components.resume.indicator
        , isDefault = components.resume.isDefault
        , isProgramming = components.resume.isProgramming
        , isPhotography = components.resume.isPhotography
        , isBlog = components.resume.isBlog
        , isResume = components.resume.isResume
        , hasLeftLink = False
        }
      , Cmd.none )
    Default ->
      ( { model
        | isDefault = components.default.isDefault
        , isProgramming = components.default.isProgramming
        , isPhotography = components.default.isPhotography
        , isBlog = components.default.isBlog
        , isResume = components.default.isResume
        , hasLeftLink = True
        }
      , Cmd.none )
    ScrollDown ->
      ( { model
          | isFull = False
        }
      , Cmd.none )
    UrlChange location ->
      ( { model
        | currentRoute  = location
        }
      , Cmd.none )


---- Navigation ----
fromUrlHash : String -> RoutePath
fromUrlHash urlHash =
  let
    hashList =
      urlHash |> String.split "/" |> drop 1
  in
    case hashList of

      [] ->
        DefaultRoute

      [ "home" ] ->
        HomeRoute

      [ "programming" ] ->
        ProgrammingRoute

      [ "photography" ] ->
        PhotographyRoute

      [ "blog" ] ->
        BlogRoute

      [ "resume" ] ->
        ResumeRoute

      _  ->
        NotFoundRoute


---- VIEW ----

link : String -> String -> Html Msg
link name url =
    a [ href url ] [ text name ]

navBar : Html Msg
navBar =
  div [][]

titleWindow : Model -> Html Msg
titleWindow model =
  div [ classList [ ( "title-container", True )
                  , ( "full-size", model.isFull )
                  ]
      ]
      [ div [ classList [ ("top-header", True )
                        , ( "left-typewriter", model.hasLeftLink )
                        , ( "typewriter", model.isDefault )
                        , ( "programming-typewriter", model.isProgramming )
                        , ( "photography-typewriter", model.isPhotography )
                        , ( "blog-typewriter", model.isBlog )
                        , ( "resume-typewriter", model.isResume )
                        ]
            ]
            [ div [ classList [ ("image-container", True ) ] ] [ img [ src <| slice 6 -1 <| toString <| Array.get model.indicator (model.paths) ] [] ]
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
        , i [ onClick ScrollDown
            , classList [ ( "fa fa-chevron-down", model.isFull ) ]
            ]
            []
        ]

homePage : Model -> Html Msg
homePage model =
  div [ classList [ ("links-container", True ) ]
      , onMouseEnter Default
      ]
      [ p [ onMouseOver Programming
          , onMouseOut Default
          , classList [ ("programming", True) ]
          ]
          [ link "Programming" "#/programming" ]
      , p [ onMouseOver Photography
          , onMouseOut Default
          , classList [ ("photography", True) ]
          ]
          [ link "Photography" "#/photography" ]
      , p [ onMouseOver Blog
          , onMouseOut Default
          , classList [ ("blog", True) ]
          ]
          [ link "Blog" "#/blog" ]
      , p [ onMouseOver Resume
          , onMouseOut Default
          , classList [ ("resume", True) ]
          ]
          [ link "Resume" "#/resume" ]
      ]

programmingPage : Html Msg
programmingPage =
   text "I write code."

photographyPage : Html Msg
photographyPage =
   text "I take pictures."

blogPage : Html Msg
blogPage =
   text "I write things."

resumePage : Html Msg
resumePage =
   text "Please hire me."

notFoundPage : Html Msg
notFoundPage =
   text "Page cannot be found."

pageBody : Model -> Html Msg
pageBody model =
  let
    routePath =
      fromUrlHash model.currentRoute.hash

  in
    case routePath of
      DefaultRoute ->
        homePage model

      HomeRoute ->
        homePage model

      ProgrammingRoute ->
        programmingPage

      PhotographyRoute ->
        photographyPage

      BlogRoute ->
        blogPage

      ResumeRoute ->
        resumePage

      NotFoundRoute ->
        notFoundPage


footer : Html Msg
footer =
  div [ classList [ ("footer", True) ] ]
      [ a [ href "mailto:rakesh@rakeshchatrath.me" ] [ i [ classList [ ( "fa fa-envelope", True ) ] ] [] ]
      , a [ href "https://www.github.com/rchatrath7" ] [ i [ classList [ ( "fa fa-github", True ) ] ] [] ]
      , a [ href "https://www.linkedin.com/in/rchatrath" ] [ i [ classList [ ( "fa fa-linkedin", True ) ] ] [] ]
      , a [ href "https://www.twitter.com/rakesh_chatrath" ] [ i [ classList [ ( "fa fa-twitter", True ) ] ] [] ]
      ]

view : Model -> Html Msg
view model =
    div [ classList [ ("home-containter", True) ] ]
        [ navBar
        , titleWindow model
        , pageBody model
        , footer
        ]


---- PROGRAM ----


main : Program Flags Model Msg
main =
    Navigation.programWithFlags UrlChange
        { view = view
        , init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        }
