;; <P3.lisp>
;; Submitted March 2 2024 at 9:30 pm

;; to run in clisp, run clisp by using the clisp command
;; load file by typing   (load "p3.lisp")
;; to test, type (lins '(1 4 2 4 5 1 3 0))
;;;; p3.lisp
;;;; Implementation of the insertion sort algorithm in Common Lisp
;; source: Common Lisp Hyperspec
;;; Function: lins
;;; Description: Sorts lst, a list of real numbers in ascending order using the insertion sort algorithm.
;;; Returns a list containing the real numbers in the original list in ascending order.
;;; The following function is recursive and handles an empty list correctly.

(defun lins (lst)
  "Sorts a list of real numbers in ascending order using insertion sort."
  (labels ((insert-sort (x sorted)
             "Inserts element x into a sorted list."
             (cond
               ((null sorted) (list x))
               ((<= x (car sorted)) (cons x sorted))
               (t (cons (car sorted) (insert-sort x (cdr sorted)))))))
    (if (null lst)
        lst
        (insert-sort (car lst) (lins (cdr lst))))))

;;; Example usage:
;; (lins '(1 4 2 4 5 1 3 0)) ; returns: (0 1 1 2 3 4 4 5)

;;;; End of p3.lisp
