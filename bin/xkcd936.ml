
(*
 * - mmap the wordlist
 * - take a random byte position
 * - walk to BOF until the next linefeed or BOF
 * - walk to EOF if not already linefeed or EOF
 * - that's a line
 * - repeat 4 times
 * - that's our phrase.
 *
 * Caution: this method has a statistical bias toward longer words but avoids to
 * read the wordlist in it's entirety.
 *)

let () =
  print_endline "Hello, World!"

