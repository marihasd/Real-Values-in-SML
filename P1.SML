(*
P1 Programming Assignment 1
Due February 3, 2024 11:59 pm
Submitted February 3, 2024 11:30 pm

This code accepts a list, integer, comparator function, and discriminator function and works to sort and insert the list as requested.
 *)

(*define function myinsert*)
(* myinsert accepts list of integers, integer, comparator function, and discriminator function. *)
fun myinsert([], x:int, _, _) = [x]
  | myinsert(h::t, x, cmp, disc) =
(* if list is empty,function returns new list with element x*)
    if cmp(x, h) orelse disc(x, h) then x::h::t
(*if list is not empty, find x and insert.*)
    else h::myinsert(t, x, cmp, disc);

(* myinsort accepts a list of integers, comparator function, and discriminator function.*)
fun myinsort([], _, _) = []
(*sort until entire list is sorted.*)
  | myinsort(h::t, cmp, disc) = myinsert(myinsort(t, cmp, disc), h, cmp, disc);
(*nd function will return false always. This insures that duplicate values are kept. *)
fun nd(x, y) = false;

(* Define test cases *)
val list1 = [3, 1, 4, 1, 5, 9, 2, 6, 5]
val list2 = [9, 8, 7, 6, 5, 4, 3, 2, 1]
val list3 = [1, 2, 3, 4, 5, 6, 7, 8, 9]

(* Define comparator functions *)
fun less(x, y) = x < y
fun greater(x, y) = x > y

(* Define discriminator functions *)
fun equals(x, y) = x = y

(* Test myinsort with different lists and functions *)
val sorted1 = myinsort(list1, less, equals);
val sorted2 = myinsort(list2, greater, nd);
val sorted3 = myinsort(list3, less, nd);

(* Print the results *)
sorted1;
sorted2;
sorted3;
