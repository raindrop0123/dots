;;; init.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defun require-init (file &optional disabled)
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
  (require-init 'init-evil)
  (require-init 'init-corfu)
  (require-init 'init-minibuffer)
  (require-init 'init-window)
  (require-init 'init-prog)
  (require-init 'init-misc)
  (run-with-idle-timer 1 nil (lambda () (require-init 'init-general)))
  )

(run-with-idle-timer
 4 nil
 (lambda ()
   (setq gc-cons-threshold  67108864)
   (setq gc-cons-percentage 0.1)
   (garbage-collect)))

(message "[Emacs] Loaded in %s with %d garbage collections with %d packages."
         (format "%.2f seconds" (float-time (time-subtract after-init-time before-init-time)))
         gcs-done
         (length package-alist))

(provide 'init)
;;; init.el ends here
