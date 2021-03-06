(defpackage #:pastelyzer.config.user
  (:use)
  (:import-from #:pastelyzer
                #:artefact
                #:string-artefact
                #:binary-artefact
                #:credential
                #:email
                #:embedded-binary
                #:base64-blob
                #:binary-blob
                #:hex-blob
                #:bank-card-number
                #:important-card-number
                #:m3u-entry
                #:onion

                #:embedded-binary-bytes)
  (:export #:define-sink
           #:define-artefact-filter
           #:collect-into
           #:fmt
           #:env
           #:file-contents
           #:yes
           #:no
           #:true
           #:false

           #:or
           #:and
           #:not
           #:=
           #:>
           #:<
           #:type?
           #:extract
           #:->
           #:length
           #:starts-with?
           #:ends-with?
           #:contains?))

(defpackage #:pastelyzer.config.package
  (:use :common-lisp)
  (:export #:user-package
           #:user-identifier
           #:user-identifier-p))

(in-package #:pastelyzer.config.package)

(defun user-package ()
  (find-package "PASTELYZER.CONFIG.USER"))

(defun user-identifier (name)
  (let* ((package (user-package))
         (symbol (etypecase name
                   (symbol
                    (import name package)
                    name)
                   (string
                    (intern name package)))))
    (export symbol package)
    symbol))

(defun user-identifier-p (thing)
  (and (symbolp thing)
       (eq thing (find-symbol (symbol-name thing) (user-package)))))
