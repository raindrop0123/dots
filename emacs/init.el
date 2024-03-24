;;; init.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defun require-init (package &optional disabled)
  "Load PKG if MAYBE-DISABLED is nil or it's nil but start up in normal slowly."
  (when (not disabled)
    (load
     (file-truename (format "%s/%s" (concat (file-name-as-directory user-emacs-directory) "lisp") package)) t t)))

(let* ((file-name-handler-alist nil))
  (require-init 'init-base)
  )

(message "[Emacs] Loaded in %s with %d garbage collections with %d packages."
         (format "%.4f seconds" (float-time (time-subtract after-init-time before-init-time)))
         gcs-done
         (length package-alist))

(provide 'init)
;;; init.el ends here
