let When = ../When/Type.dhall

let CachePolicy = ../CachePolicy/Type.dhall
let CacheKeyFiles = ../CacheKeyFiles/Type.dhall

in    { when = When.OnSuccess
      , untracked = None Bool
      , policy = CachePolicy.PullPush
      }
    : ./Type.dhall
