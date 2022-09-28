let When = ../When/Type.dhall

let CachePolicy = ../CachePolicy/Type.dhall
let CacheKeyFiles = ../CacheKeyFiles/Type.dhall


in    { key = None CacheKeyFiles
      , when = When.OnSuccess
      , paths = [] : List Text
      , untracked = None Bool
      , policy = None CachePolicy
      }