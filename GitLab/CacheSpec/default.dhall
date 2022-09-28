let When = ../When/Type.dhall

let CachePolicy = ../CachePolicy/Type.dhall

in    { key = "default"
      , when = When.OnSuccess
      , paths = [] : List Text
      , untracked = None Bool
      , policy = None CachePolicy
      }
    : ./Type.dhall
