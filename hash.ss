;;
;; Hash constructor and pattern matcher
;; Edwin Watkeys, edw@poseur.com
;;

(import (rename-in :std/sugar (hash stock-hash)))

(export hash)

(defsyntax-for-match hash
  (syntax-rules ()
    ((_)
     (? hash?))
    ((_ (k v) ...)
     (and (? hash?) (apply (cut hash-get <> 'k) v) ...))
    ((_ (k v) ... t)
     (and (? hash? t) (apply (cut hash-get <> 'k) v) ...)))
  (syntax-rules ()
    ((_ kvs ...)
     (stock-hash kvs ...))))
