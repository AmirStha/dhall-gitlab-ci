let When = ../When/Type.dhall

let CachePolicy = ../CachePolicy/Type.dhall

in    { key = None Text
      , when = When.OnSuccess
      , paths = None (List Text)
      , untracked = None Bool
      , policy = CachePolicy.PullPush
      }
    : ./Type.dhall
