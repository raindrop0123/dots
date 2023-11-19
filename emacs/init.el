;;; init.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Loading configuration files funcion
(defun require-init (file &optional disabled)
  "Load `INIT-FILE' if `DISABLED' is nil."
  (when (not disabled)
    (load
     (file-truename
      (format
       "%s/%s"
       (concat (file-name-as-directory user-emacs-directory) "lisp")
       file))
     t t)))

(let* ((file-name-handler-alist nil))
  (require-init 'init-base)
  (require-init 'init-package))

;; Restore GC
;; Measure Emacs Startup Time
(add-hook
 'emacs-startup-hook
 (lambda ()
   (setq gc-cons-threshold 16777216)
   (setq gc-cons-percentage 0.1)
   (message
    "%d packages loaded in %s with %d garbage collections."
    (length package-alist)
    (format
     "%.6f seconds"
     (float-time
      (time-subtract after-init-time before-init-time)))
    gcs-done)))

(provide 'init)
;;; init.el ends here
