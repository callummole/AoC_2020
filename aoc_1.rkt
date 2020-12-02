#lang racket/base

(require 2htdp/batch-io
         racket/list
         racket/function)

(define (read-file file)
  (map string->number (read-lines file)))

(define (sum2020 entries size)
  (for/list ([com (combinations entries size)]
            #:when (= (apply + com) 2020))
    (cons com (apply * com))))

(sum2020 (read-file  "./input/day1_1.txt") 2)
(sum2020 (read-file  "./input/day1_1.txt") 3)


(module+ test
  (require rackunit)
  (check-equal? (sum2020 '(1721
                           979
                           366
                           299
                           675
                           1456) 2)
                '(((1721 299) . 514579)))

  (check-equal? (sum2020 '(1721
                           979
                           366
                           299
                           675
                           1456) 3)
                '(((979 366 675) . 241861950))))