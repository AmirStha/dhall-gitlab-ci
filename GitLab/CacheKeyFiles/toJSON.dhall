let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let CacheKeyFiles = ./Type.dhall

let dropNones = ../utils/dropNones.dhall

let Optional/map = Prelude.Optional.map

let List/map = Prelude.List.map

let stringsArray
    : List Text → JSON.Type
    = λ(xs : List Text) →
        JSON.array (Prelude.List.map Text JSON.Type JSON.string xs)

in  let CacheKeyFiles/toJSON
        : CacheKeyFiles → JSON.Type
        = λ(ckfs : CacheKeyFiles) →
            let obj
                : Map.Type Text (Optional JSON.Type)
                = toMap
                    { prefix = Optional/map Text JSON.Type JSON.string ckfs.prefix
                    , files =
                        Optional/map (List Text) JSON.Type stringsArray cs.paths
                    }

            in  JSON.object obj

    in  CacheKeyFiles/toJSON