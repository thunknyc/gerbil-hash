;;
;; Hash constructor and pattern matcher
;; Edwin Watkeys, edw@poseur.com
;;

(import :std/iter
        :std/sugar
        :thunknyc/list)

(export hash plist->hash*)

(def (plist->hash* kvs (options '()))
  (let (ht (apply make-hash-table options))
    (for ((kv (chunk 2 kvs)))
      (with ([k v] kv) (hash-put! ht k v)))
    ht))

(defsyntax-for-match hash
  (syntax-rules (:as)
    ((_)
     (? hash-table?))
    ((_ :as ht kvs ...)
     (and (hash kvs ...) ht))
    ((_ kpat vpat kvs ...)
     (and (hash kvs ...) (apply (cut hash-ref <> kpat #f) vpat))))
  (syntax-rules (:options)
    ((_)
     (make-hash-table))
    ((_ kvs ... :options os)
     (plist->hash* (list kvs ...) os))
    ((_ kvs ...)
     (plist->hash* (list kvs ...)))))