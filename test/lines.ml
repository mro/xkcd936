open Bigarray
open Lib

let () =
  let bs = Bigstring.of_string "ab\ncd\n" in
  assert (0 = Lines.back bs 0);
  assert (0 = Lines.back bs 1);
  assert (0 = Lines.back bs 2);
  assert (3 = Lines.back bs 3);
  assert (3 = Lines.back bs 4);
  assert (3 = Lines.back bs 5)

let () =
  let bs = Bigstring.of_string "ab\ncd\n" in
  let l = Array1.dim bs in
  assert (6 = l);
  assert (2 = Lines.forw bs l 0);
  assert (2 = Lines.forw bs l 1);
  assert (2 = Lines.forw bs l 2);
  assert (5 = Lines.forw bs l 3);
  assert (5 = Lines.forw bs l 4);
  assert (5 = Lines.forw bs l 5)

let () =
  let bs = Bigstring.of_string "ab\ncd\n" in
  let l = Array1.dim bs in
  assert (6 = l);
  assert ("ab" = Lines.line bs l 0);
  assert ("ab" = Lines.line bs l 1);
  assert ("ab" = Lines.line bs l 2);
  assert ("cd" = Lines.line bs l 3);
  assert ("cd" = Lines.line bs l 4);
  assert ("cd" = Lines.line bs l 5)
