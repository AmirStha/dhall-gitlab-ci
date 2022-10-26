let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let CacheKey = ./Type.dhall

let dropNones = ../utils/dropNones.dhall

let Optional/map = Prelude.Optional.map

let List/map = Prelude.List.map

let stringsArray
    : List Text → JSON.Type
    = λ(xs : List Text) →
        JSON.array (Prelude.List.map Text JSON.Type JSON.string xs)

in  let CacheKey/toJSON
        : CacheKey → JSON.Type
        = λ(ck : CacheKey) →
            let obj
                : Map.Type Text (Optional JSON.Type)
                = toMap
                    { prefix = Optional/map Text JSON.Type JSON.string ck.prefix
                    , files =
                        if    Prelude.List.null Text ck.files
                        then  None JSON.Type
                        else  Some
                                ( JSON.array
                                    ( Prelude.List.map
                                        Text
                                        JSON.Type
                                        JSON.string
                                        ck.files
                                    )
                                )
                    }

            in  JSON.object (dropNones Text JSON.Type obj)

    in  CacheKey/toJSON