let When = ../When/Type.dhall

let CachePolicy = ../CachePolicy/Type.dhall
let CacheKeyUnion = ../CacheKeyUnion/Type.dhall


in    { key = None CacheKeyUnion
      , when = When.OnSuccess
      , paths = [] : List Text
      , untracked = None Bool
      , policy = None CachePolicy
      }
    : ./Type.dhall
