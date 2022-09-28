let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let CacheKeyFiles = ./Type.dhall

let dropNones = ../utils/dropNones.dhall

let Optional/map = Prelude.Optional.map

let List/map = Prelude.List.map

in  let CacheKeyFiles/toJSON
        : CacheKeyFiles → JSON.Type
        = λ(ckfs : CacheKeyFiles) →
            let obj
                : Map.Type Text JSON.Type
                = toMap
                    { key = JSON.string ckfs.prefix
                    , files =
                        JSON.array
                          (List/map Text JSON.Type JSON.string ckfs.files)
                    }

            in  JSON.object obj

    in  CacheKeyFiles/toJSON