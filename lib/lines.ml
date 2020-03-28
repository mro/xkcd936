
open Bigarray

(* walk back until we hit the begin of the line *)
let rec back arr idx =
  let i = idx - 1 in
  if i < 0
  then 0
  else 
    if '\n' = arr.{i}
    then i + 1
    else back arr i

(* walk forward until we hit the end of the line *)
let rec forw arr max idx =
  if idx = max 
  then max - 1
  else
    if '\n' = arr.{idx}
    then idx - 1
    else forw arr max (idx + 1)

let line arr max idx =
  let off = back arr idx
  and en  = forw arr max idx in
  let len = en - off + 1 in
  Array1.sub arr off len
   |> Bigstring.to_string

