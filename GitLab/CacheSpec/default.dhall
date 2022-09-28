let When = ../When/Type.dhall

let CachePolicy = ../CachePolicy/Type.dhall

in    { when = When.OnSuccess
      , paths = None (List Text)
      , untracked = None Bool
      , policy = CachePolicy.PullPush
      }
    : ./Type.dhall
