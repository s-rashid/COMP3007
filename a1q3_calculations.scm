;Question 3

;a.
#| Implementation of  function called "standard-roundf"
   that takes an input number and a precision value (integer)
   as arguments and returns the input number rounded to the specified
   number of decimal places using the "round half up".
   if a precision of 0 is specified, output may include '.0'.
|#
(define (standard-roundf x y)
  (let ((helpFunc (expt 10 y)))
    (cond ((>= .5 (- (ceiling (* helpFunc x)) (* helpFunc x)))
        (/ (ceiling (* helpFunc x)) helpFunc))
        (else (/ (round (* helpFunc x)) helpFunc)))))

;b.
#|Implementation of function called "area-triangle" that takes 3 numbers
 as input representing the lengths of each side of a triangle, and evaluates
 to the area of that triangle rounded to at most 3 decimal places.
 The area of a triangle has calculated using Heron's formula:
 Heron's formula: Area=√(S(S-a)(S-b)(S-c))
 where, a, b, and c are the side lengths of the triangle,
 and S = (a+b+c)/2
 Helper function "calcS" to calculate the value of S.
 Helper function "calaArea" to implement Heron's formula.
|#
(define (area-triangle a b c)
  (define (calcS a b c)
    (/ (+ a b c) 2))
  (define (calcArea a b c)
    (sqrt (* (calcS a b c)
             (- (calcS a b c) a)
             (- (calcS a b c) b)
             (- (calcS a b c) c))))
  (define (valid-input?)
    (if (and (> (+ a b) c) (> (+ b c) a) (> (+ a c) b)) #t #f))
  (if (valid-input?) (standard-roundf (calcArea a b c) 3) 0))                                                  



;Test

(standard-roundf 1.2224 3)
(standard-roundf 1.2225 3)
(standard-roundf 1.2234 3)
(standard-roundf 1.2225 0)
(standard-roundf 1.0 0)
(standard-roundf 1 0)
(standard-roundf 1 3)
(standard-roundf 1.2225 1)
(standard-roundf 1.22246 3)




(area-triangle 3 3 5)
(area-triangle 4 15 6)
(area-triangle -2 5 4)
(area-triangle 0 0 5)
(area-triangle 3 3 -5)
(area-triangle -13 3 50)
(area-triangle -2 -4 -5)
(area-triangle -3 -3 -5)

#| Output

(standard-roundf 1.2224 3)--> 1.222
(standard-roundf 1.2225 3)--> 1.223
(standard-roundf 1.2234 3)--> 1.223
(standard-roundf 1.2225 0)--> 1.0
(standard-roundf 1.0 0)--> 1.0
(standard-roundf 1 0)--> 1
(standard-roundf 1 3)-->1
(standard-roundf 1.2225 1)-->1.2
(standard-roundf 1.22246 3)-->1.222

(area-triangle 3 3 5) --> 4.146
(area-triangle 4 15 6) ---> 0
(area-triangle -2 5 4)  --> 0
(area-triangle 0 0 5)  --> 0
(area-triangle 3 3 -5)  --> 0
(area-triangle -13 3 50) --> 0
(area-triangle -2 -4 -5) --> 0
(area-triangle -3 -3 -5) --> 0
|#