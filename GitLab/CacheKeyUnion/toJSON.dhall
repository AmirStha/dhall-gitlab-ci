let Prelude = ../Prelude.dhall

let JSON = Prelude.JSON

let CacheKeyUnion = ./Type.dhall

let CacheKey = ../CacheKey/package.dhall

let CacheKeyUnion/toJSON
    : CacheKeyUnion → JSON.Type
    = λ(cku : CacheKeyUnion) →
        merge
          { CacheKey = λ(c : CacheKey.Type) → CacheKey.toJSON c
          , Text = λ(b : Text) → JSON.Text b
          }
          cku

in  CacheKeyUnion/toJSON