module Partials.Model exposing (..)

import Array exposing (Array)
import Navigation

type alias Model =
    { title : String
    , paths : Array String
    , photoPaths : List String
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
    , isMobileVisible : Bool
    , programmingAssetPaths : List String
    , programmingProjectPaths : List String
    }
