(* ocamlc graphics.cma drawcircle.ml - drawcircle *)
module Gr = Graphics;;

Gr.open_graph " 640x480";;
Gr.fill_circle 320 240 240;;
read_line ();;
