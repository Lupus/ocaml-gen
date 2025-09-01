type single_tuple = { inner: string } [@@boxed]
external new_t : unit -> single_tuple = "new"
external print_t : single_tuple -> unit = "print"
type key_value = { map: ((string * string) list) } [@@boxed]
type list_t = { items: ((string) list) } [@@boxed]
type tuples_t = { t2: (int32 * int64); t3: (int32 * int64 * bool); t4: (int32 * int64 * bool * string); t5: (int32 * int64 * bool * string * float); t6: (int32 * int64 * bool * string * float * (char, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t) }
external option_to_result : (int64) option -> (int64, string) result = "option_to_result"

module Car = struct 
  type t
end

external fn_one_parameter : Car.t -> Car.t = "fn_one_parameter"
external fn_two_parameters : Car.t -> int -> Car.t = "fn_two_parameters"
external fn_three_parameters : Car.t -> int -> int -> Car.t = "fn_three_parameters"
external fn_four_parameters : Car.t -> int -> int -> int -> Car.t = "fn_four_parameters"
external fn_five_parameters : Car.t -> int -> int -> int -> int -> Car.t = "fn_five_parameters"
external fn_six_parameters : Car.t -> int -> int -> int -> int -> int -> Car.t = "fn_six_parameters_bytecode" "fn_six_parameters"
external test_add_i32 : int32 -> int32 -> int32 = "test_add_i32"
external test_add_usize : int -> int -> int = "test_add_usize"
external test_bytes_get : bytes -> int -> int = "test_bytes_get"
external test_get_ascii_code : int -> int32 = "test_get_ascii_code"

module Toyota = struct 
  type t = Car.t
  external create_toyota : unit -> t = "create_toyota"
end


module Packages = struct 
  type ('t) t = { gift: 't } [@@boxed]
end


module Gifts = struct 
  type t = (string) Packages.t
  external pack_present : unit -> t = "pack_present"
end

