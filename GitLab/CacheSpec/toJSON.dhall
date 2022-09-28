let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let CacheSpec = ./Type.dhall

let CacheKeyFiles = ../CacheKeyFiles/package.dhall

let stringsArray
    : List Text → JSON.Type
    = λ(xs : List Text) →
        JSON.array (Prelude.List.map Text JSON.Type JSON.string xs)

let dropNones = ../utils/dropNones.dhall

let Optional/map = Prelude.Optional.map

let List/map = Prelude.List.map

in  let CacheSpec/toJSON
        : CacheSpec → JSON.Type
        = λ(cs : CacheSpec) →
            let obj
                : Map.Type Text (Optional JSON.Type)
                = toMap
                    { key = 
                       Optional/map
                          CacheKeyFiles.Type
                          JSON.Type
                          CacheKeyFiles.toJSON
                          cs.key
                    , paths =
                        Optional/map (List Text) JSON.Type stringsArray cs.paths
                    }

            in  JSON.object (dropNones Text JSON.Type obj)

    in  CacheSpec/toJSON
