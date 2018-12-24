;;
;; Hash constructor and pattern matcher
;; Edwin Watkeys, edw@poseur.com
;;

(import (rename-in :std/sugar (hash stock-hash)))

(export hash)

(defsyntax-for-match hash
  (syntax-rules ()
    ((_)
     (? hash-table?))
    ((_ (k v) kvs ...)
     (and (hash kvs ...) (apply (cut hash-get <> 'k) v)))
    ((_ ht)
     ht))
  (syntax-rules ()
    ((_ kvs ...)
     (stock-hash kvs ...))))
