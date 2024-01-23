;;; init.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(let* ((gc-cons-threshold most-positive-fixnum)
       (gc-cons-percentage 0.6)
       (file-name-handler-alist nil))
  (require 'init-base)
  (require 'init-company)
  (require 'init-evil)
  (require 'init-minibuffer)
  (require 'init-prog)
  (require 'init-misc)
  )

(run-with-idle-timer
 4 nil
 (lambda ()
   (setq gc-cons-threshold  67108864)
   (setq gc-cons-percentage 0.1)
   (garbage-collect)))

(message "Loaded in %s with %d garbage collections with %d packages."
         (format "%.2f seconds" (float-time (time-subtract after-init-time before-init-time)))
         gcs-done
         (length package-alist))

(provide 'init)
;;; init.el ends here
