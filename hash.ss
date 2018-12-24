;;
;; Hash constructor and pattern matcher
;; Edwin Watkeys, edw@poseur.com
;;

(import
  :gerbil/gambit
  (rename-in :std/sugar (hash sugar-hash)))

(export hash table? sugar-hash)

(defsyntax-for-match hash
  (syntax-rules ()
    ((_)
     (? table?))
    ((_ (k v) ...)
     (and (? table?) (apply (cut hash-get <> 'k) v) ...))
    ((_ (k v) ... t)
     (and (? table? t) (apply (cut hash-get <> 'k) v) ...)))
  (syntax-rules ()
    ((_ (k v) ...)
     (sugar-hash (k v) ...))))
