;;; init.el --- -*- lexical-binding: t; -*-

;;; Commentary:
;; @REF: https://github.com/redguardtoo/emacs.d
;; @REF: https://github.com/bbatsov/prelude
;; @REF: https://github.com/seagle0128/.emacs.d
;; @REF: https://github.com/manateelazycat/lazycat-emacs
;; @REF: https://github.com/doomemacs/doomemacs
;; @REF: https://github.com/purcell/emacs.d
;; @REF: https://github.com/noctuid/evil-guide

;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(let* ((gc-cons-threshold most-positive-fixnum)
       (gc-cons-percentage 0.6)
       (file-name-handler-alist nil))
  (require 'init-base)
  (require 'init-company)
  (require 'init-evil)
  (require 'init-misc))

(message "[Emacs] Loaded in %s with %d garbage collections with %d packages."
         (format "%.4f seconds" (float-time (time-subtract after-init-time before-init-time)))
         gcs-done
         (length package-alist))

(provide 'init)
;;; init.el ends here
