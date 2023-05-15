let test_single_tuple_access_field () =
  let b = Bindings.new_t () in
  assert (b.inner = "Hello")

let test_built_in_type_int32 =
  QCheck.(
    Test.make ~name:"Test builtin type int32 with addition"
      (tup2 QCheck.int32 QCheck.int32) (fun (i1, i2) ->
        Int32.(add i1 i2) = Bindings.test_add_i32 i1 i2 ) )

let test_bytes_get =
  QCheck.(
    Test.make ~name:"Test builtin type Bytes.t with get"
      (tup2 QCheck.bytes QCheck.int) (fun (bs, idx) ->
        assume (idx >= 0 && idx < Bytes.length bs) ;
        let c = Bytes.get bs idx in
        Bindings.test_bytes_get bs idx = c ) )

let () =
  let builtin_types_qcheck_suite =
    List.map QCheck_alcotest.to_alcotest
      [ test_built_in_type_int32; test_bytes_get ]
  in
  let open Alcotest in
  run "Test binding generations"
    [ ( "single_tuple"
      , [ test_case "Access field and check value" `Quick
            test_single_tuple_access_field
        ] )
    ; ("Builtin types", builtin_types_qcheck_suite)
    ]
