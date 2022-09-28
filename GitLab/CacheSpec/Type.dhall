let When = ../When/Type.dhall

let CachePolicy = ../CachePolicy/Type.dhall
let CacheKeyFiles = ../CacheKeyFiles/Type.dhall

in  { key : Optional CacheKeyFiles
    , paths : List Text
    , untracked : Optional Bool
    , when : When
    , policy : Optional CachePolicy
    }
