;;; init.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(let* ((gc-cons-threshold most-positive-fixnum)
       (gc-cons-percentage 0.6)
       (file-name-handler-alist nil))
  (require 'init-base)
  (require 'init-corfu)
  (require 'init-ui)
  (require 'init-evil)
  (require 'init-editor)
  (require 'init-tool)
  (require 'init-vertico)
  )

(message "[Emacs] Loaded in %s with %d garbage collections with %d packages."
         (format "%.4f seconds" (float-time (time-subtract after-init-time before-init-time)))
         gcs-done
         (length package-alist))

(provide 'init)
;;; init.el ends here
