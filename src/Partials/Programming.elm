module Partials.Programming exposing(..)

import Partials.Model exposing (Model)
import Partials.Messages exposing (Msg)

import Html exposing (Html, div, img, a, section, span, h2, h1, text, p)
import Html.Attributes exposing (src, classList, href, style, id)

import Dict exposing (Dict)
import Image exposing (Image)
import Image.Collection as Collection exposing (Key, Collection)
import Maybe exposing (Maybe, withDefault)

import Array exposing (Array)
import List exposing(drop, take)
import String exposing(slice, join)


experiences : Collection
experiences =
  Dict.fromList
    [ ( "recon", Image "src/static/img/programming/recon.png" 350 233 )
    , ( "raise", Image "src/static/img/programming/raise.png" 250 250 )
    , ( "riverside", Image "src/static/img/programming/RHC-x.png" 400 100 )
    , ( "projects", Image "src/static/img/programming/projects.svg" 250 250 )
    , ( "root", Image "src/static/img/programming/root.svg" 250 250 )
    ]

projects : Collection
projects =
  Dict.fromList
    [ ( "personal", Image "src/static/img/logo.svg" 200 200 )
    , ( "designhub", Image "src/static/img/programming/DesignHub960.png" 200 200 )
    , ( "ptplanner", Image "src/static/img/programming/ptplanner.svg" 200 200 )
    ]

logos : Collection
logos =
  Dict.fromList
    [ ( "elm", Image "src/static/img/programming/elm.svg" 40 40 )
    , ( "html", Image "src/static/img/programming/HTML5_Badge.svg" 40 40 )
    , ( "sass", Image "src/static/img/programming/sass.svg" 40 40 )
    , ( "elixir", Image "src/static/img/programming/elixir.png" 40 40 )
    , ( "phoenix", Image "src/static/img/programming/phoenix.png" 40 40 )
    , ( "react", Image "src/static/img/programming/React.svg" 50 50 )
    ]

returnVal : String -> Dict String Image -> Image
returnVal key collection =
  withDefault  (Image "" 0 0) ( Dict.get key collection )

-- Use index of a 0-indexed list
-- Returns a string
getItemFromLexical idx lst =
  slice 6 -1 <| toString <| Array.get idx <| Array.fromList lst

programmingContent : Model -> Html Msg
programmingContent model =
  div [ classList [ ( "programming-body", True ) ] ]
      [ section [ id "timeline" ]
              [ div [ classList [ ( "demo-card-wrapper", True ) ] ]
                    [ div [ classList [ ( "demo-card", True )
                                      , ( "demo-card--step1", True )
                                      ]
                          ]
                          [ div [ classList [ ( "head", True ) ] ]
                                [ div [ classList [ ( "number-box", True ) ] ]
                                      [ span [] [ text "2016-17" ] ]
                                , h2 [] [ span [ classList [ ( "small", True ) ] ] [ text "Web Development Consultant" ]
                                        , text "Recon Sports Consultants"
                                        ]
                                ]
                          , div [ classList [ ( "body", True ) ] ]
                                [ p [] [ text "Recon Sports is a platform that pairs prospective hockey players with college scouts. I improved the existing platform by adding a unit and end-end test framework, a subscription-based payment platform, as well as improved performance of the application by several times." ]
                                , img [ src <| getItemFromLexical 4 model.programmingProjectPaths
                                      , style [ ( "max-width", "350px" ), ( "max-height", "233px" ) ]
                                      ] []
                                ]
                          ]
                    , div [ classList [ ( "demo-card", True )
                                      , ( "demo-card--step2", True )
                                      ]
                          ]
                          [ div [ classList [ ( "head", True ) ] ]
                                [ div [ classList [ ( "number-box", True ) ] ]
                                      [ span [] [ text "2016" ] ]
                                , h2 [] [ span [ classList [ ( "small", True ) ] ] [ text "Web Development Consultant" ]
                                        , text "Raise Inc."
                                        ]
                                ]
                          , div [ classList [ ( "body", True ) ] ]
                                [ p [] [ text "At Raise, I built a platform to automate their onboarding process. I created an interface in which potential contracters could begin the consultant process by gathering their legal information and generating a variety of forms (e.g. NDA) that could be signed by the client with HelloSign." ]
                                , img [ src <| getItemFromLexical 3 model.programmingProjectPaths
                                      , style [ ( "max-width", "250px" ), ( "max-height", "250px" ) ]
                                      ] []
                                ]
                          ]
                    , div [ classList [ ( "demo-card", True )
                                      , ( "demo-card--step3", True )
                                      ]
                          ]
                          [ div [ classList [ ( "head", True ) ] ]
                                [ div [ classList [ ( "number-box", True ) ] ]
                                      [ span [] [ text "2015" ] ]
                                , h2 [] [ span [ classList [ ( "small", True ) ] ] [ text "Student Researcher" ]
                                        , text "Riverside Medical Center"
                                        ]
                                ]
                          , div [ classList [ ( "body", True ) ] ]
                                [ p [] [ text "I studied the effectiveness of a comprehensive lung cancer committee in reducing the rates of late stage lung cancer cases at a small, community hospital. Here, I used Excel, VBA, and R to find a trend that indicates the lung cancer committee was effective in reducing the amount of late stage lung cancer cases over time." ]
                                , img [ src <| getItemFromLexical 5 model.programmingProjectPaths
                                      , style [ ( "max-width", "400px" ), ( "max-height", "100px" ) ]
                                      ] []
                                ]
                          ]
                    , div [ classList [ ( "demo-card", True )
                                      , ( "demo-card--step4", True )
                                      ]
                          ]
                          [ div [ classList [ ( "head", True ) ] ]
                                [ div [ classList [ ( "number-box", True ) ] ]
                                      [ span [] [ text "ONGOING" ] ]
                                , h2 [] [ span [ classList [ ( "small", True ) ] ] [ text "Developer at Heart" ]
                                        , text "Projects"
                                        ]
                                ]
                          , div [ classList [ ( "body", True ) ] ]
                                [ p [] [ text "When not at work, I like to do a variety of projects. These range from things I might be interested in on the side such as data science to this website, or even fun things I do at hackathons like an app that uses computer vision to monitor a users brushing habits. Look below for a full list of projecst." ]
                                , img [ src <| getItemFromLexical 1 model.programmingProjectPaths
                                      , style [ ( "max-width", "250px" ), ( "max-height", "250px" ) ]
                                      ] []
                                ]
                          ]
                    ]
              ]
      , h1 [ classList [ ( "title-reference", True ) ] ] [ text "Projects" ]
      , div [ classList [ ( "projects-container", True ) ] ]
            [ div [ classList [ ( "projects-card", True )
                              , ( "projects-card--step1", True )
                              , ( "personal", True )
                              ]
                  ]
                  [ div [ classList [ ( "content-container", True ) ] ]
                        [ h2 [] [ a [ href "https://www.github.com/rchatrath7/rakeshchatrath" ] [ text "This website" ]
                                , span [ classList [ ( "small", True ) ] ] [ text "2017" ]
                                ]
                        , p [] [ text "All the code for this website is opensource." ]
                        , img [ src <| slice 6 -1 <| toString <| Array.get 0 (model.paths)
                              , style [ ( "max-width", "200px" ), ( "max-height", "200px" ) ]
                              ] []
                        ]
                  , div [ classList [ ( "logos-container", True ) ] ]
                        [ img [ src <| getItemFromLexical 1 model.programmingAssetPaths
                              , style [ ( "max-width", "40px" ), ( "max-height", "40px" ) ]
                              ] []
                        , img [ src <| getItemFromLexical 2 model.programmingAssetPaths
                              , style [ ( "max-width", "40px" ), ( "max-height", "40px" ) ]
                              ] []
                        , img [ src <| getItemFromLexical 5 model.programmingAssetPaths
                              , style [ ( "max-width", "40px" ), ( "max-height", "40px" ) ]
                              ] []
                        ]
                  ]
            , div [ classList [ ( "projects-card", True )
                              , ( "projects-card--step2", True )
                              , ( "designhub", True )
                              ]
                  ]
                  [ div [ classList [ ( "content-container", True ) ] ]
                        [ h2 [] [ a [ href "https://www.github.com/rchatrath7/DesignHubWeb" ] [ text "Design Hub" ]
                                , span [ classList [ ( "small", True ) ] ] [ text "2017" ]
                                ]
                        , p [] [ text "The code for my club's website: DesignHub" ]
                        , img [ src <| getItemFromLexical 0 model.programmingProjectPaths
                              , style [ ( "max-width", "200px" ), ( "max-height", "200px" ) ]
                              ] []
                        ]
                  , div [ classList [ ( "logos-container", True ) ] ]
                        [ img [ src <| getItemFromLexical 0 model.programmingAssetPaths
                              , style [ ( "max-width", "40px" ), ( "max-height", "40px" ) ]
                              ] []
                        , img [ src <| getItemFromLexical 3 model.programmingAssetPaths
                              , style [ ( "max-width", "40px" ), ( "max-height", "40px" ) ]
                              ] []
                        , img [ src <| getItemFromLexical 4 model.programmingAssetPaths
                              , style [ ( "max-width", "50px" ), ( "max-height", "50px" ) ]
                              ] []
                        , img [ src <| getItemFromLexical 5 model.programmingAssetPaths
                              , style [ ( "max-width", "40px" ), ( "max-height", "40px" ) ]
                              ] []
                        ]
                  ]
            , div [ classList [ ( "projects-card", True )
                              , ( "projects-card--step3", True )
                              , ( "ptp", True )
                              ]
                  ]
                  [ div [ classList [ ( "content-container", True ) ]
                        , style [ ("border-bottom", "none" ) ]
                        ]
                        [ h2 [] [ text "PTPlanner"
                                , span [ classList [ ( "small", True ) ] ] [ text "2017" ]
                                ]
                        , p [] [ text "PTPlanner was a business idea we pitched as the only freshman team out of 60 teams in the Randall Family Big Idea competition final round." ]
                        , img [ src <| getItemFromLexical 2 model.programmingProjectPaths
                              , style [ ( "max-width", "200px" ), ( "max-height", "200px" ) ]
                              ] []
                        ]
                  ]
            ]
      ]
