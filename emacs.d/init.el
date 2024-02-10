;;; init.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(let* ((gc-cons-threshold most-positive-fixnum)
       (gc-cons-percentage 0.6)
       (file-name-handler-alist nil))

  (require 'init-core)
  (require 'init-ui)
  (require 'init-company)
  (require 'init-evil)
  (require 'init-minibuffer)
  (run-with-idle-timer
   2 nil
   #'(lambda ()
       (require 'init-tool)
       (require 'init-editor)
       (require 'init-general))))

(message "[Emacs] Loaded in %s with %d garbage collections with %d packages."
         (format "%.4f seconds" (float-time (time-subtract after-init-time before-init-time)))
         gcs-done
         (length package-alist))

(provide 'init)
;;; init.el ends here
