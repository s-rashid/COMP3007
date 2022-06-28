;Question 4
#| This program prompt the user for a year, a month, and a day (in that order) as input.
   return true (#t) if the values entered are integers representing a valid date
   and false (#f) otherwise.
   This program have few helper function to accurately determin if the inputs are valid
   leap-year? => determine if entered year is a leap year
   vali-year? => determine if entered year is valid. NOTE: if input is 1 that is also vaild
                                                           since there is no restiction on
                                                           that. So, all positive interger is
                                                           valid for year.
   vali-month? check if entered month is vaild. month should be between 1 - 12
   vali-day: check if entered day is vaild.
|#

(display "Enter a year: ")
(define year (read))
(display "Enter a month: ")
(define month (read))
(display "Enter a day: ")
(define day (read))

(define (vali-date?)
  (define (leap-year?)
    (if (= (modulo year 4) 0) #t #f))
  (define (vali-year?)
    (if (and (integer? year) (>= year 1)) #t #f))
  (define (vali-month?)
    (if (and (integer? month) (>= month 1) (<= month 12)) #t #f))
  (define (vali-day?)
    (cond ((and (leap-year?) (vali-year?) (= month 2) (>= day 1) (<= day 29)) #t)
          ((and (not (leap-year?)) (vali-year?) (= month 2) (>= day 1) (<= day 28)) #t)
          ((and (vali-year?) (vali-month?)
                (or (= month 1) (= month 3) (= month 5) (= month 7) (= month 8) (= month 10) (= month 12))
                (<= day 1) (>= 31)) #t)
          ((and (vali-year?) (vali-month?)
                (or (= month 4) (= month 6) (= month 9) (= month 11))
                (<= day 1) (>= 30)) #t)
          (else #f)))
  (if (and (vali-year?) (vali-month?) (vali-day?)) #t #f))

(vali-date?)


;Test
;Possible input:           Output:
; 2.2 | 2 | 19              #f
; 2020 | 2 | 29             #t
; 2019 | 2 | 29             #f
; 2 | 5 | 4                 #t
; 0 | 0 | 0                 #f
; -1 | -3 | -12             #f
; af | adf | kei            #f
; 2*2  | + 3 4  | 3 / 4     #f
; 3a | 3 | 12               #f