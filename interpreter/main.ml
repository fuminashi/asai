let rec read_eval_print_loop () =
  print_string "input: ";
  flush stdout;
  let expr = Parser.start Lexer.token (Lexing.from_channel stdin) in
  let v = Evalplus.f expr in
    print_string (Evalplus.v_to_string v);
    print_newline();
    read_eval_print_loop()

let _ = read_eval_print_loop ()
