(*

Programming Assignment 0: Proof of Access
Class and professor removed for privacy purposes. 
Submitted 20 January 2024 11:30pm
Submitted code works in SML
*)


(*create a function that solves a list of values using a single real value x in a + bx^1 + cx^2+ ... form.*)

fun epoly ([] : real list, a : real) = 0.0
(* initialize function with name epoly. Add int list and coefficient 0.0 as parameter.*)
(* if list is empty, return a *)
  | epoly (x::xs, a) = x + a * (epoly (xs, a));
(* if list is not empty, add initial value x to product of a to the recursion for remaining coefficients in list xs*) 

val test1 = epoly ([], 0.0);        (* Test with an empty list and default value *)
val test2 = epoly ([1.0, 2.0, 3.0], 4.0);  (* Test with a non-empty list and a value *)
