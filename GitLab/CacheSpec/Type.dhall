let When = ../When/Type.dhall

let CachePolicy = ../CachePolicy/Type.dhall
let CacheKeyUnion = ../CacheKeyUnion/Type.dhall

in  { key : Optional CacheKeyUnion
    , paths : List Text
    , untracked : Optional Bool
    , when : When
    , policy : Optional CachePolicy
    }
