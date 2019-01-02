;;
;; Hash constructor and pattern matcher
;; Edwin Watkeys, edw@poseur.com
;;

(import (rename-in :std/sugar (hash sugar-hash)))

(export hash)

(defsyntax-for-match hash
  (syntax-rules ()
    ((_)
     (? hash-table?))
    ((_ (k v) ...)
     (and (? hash-table?) (apply (cut hash-get <> 'k) v) ...))
    ((_ (k v) ... t)
     (and (? hash-table? t) (apply (cut hash-get <> 'k) v) ...)))
  (syntax-rules ()
    ((_ (k v) ...)
     (sugar-hash (k v) ...))))
