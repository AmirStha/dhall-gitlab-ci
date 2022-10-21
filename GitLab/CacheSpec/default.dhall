let When = ../When/Type.dhall

let CachePolicy = ../CachePolicy/Type.dhall
let CacheKeyUnion = ../CacheKey/Type.dhall


in    { key = None CacheKeyUnion
      , when = When.OnSuccess
      , paths = [] : List Text
      , untracked = None Bool
      , policy = None CachePolicy
      }
    : ./Type.dhall
