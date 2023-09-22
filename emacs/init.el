;;; init.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Version Checking
;; Do not support the emacs which version is below 29.1
(let* ((minver "29.1"))
  (when (version< emacs-version minver)
    (error "Emacs v%s or higher is required" minver)))

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

;; @REF: https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
;; Normally file-name-handler-alist is set to
;; (("\\`/[^/]*\\'" . tramp-completion-file-name-handler)
;; ("\\`/[^/|:][^/|]*:" . tramp-file-name-handler)
;; ("\\`/:" . file-name-non-special))
;; Which means on every .el and .elc file loaded during start up, it has to runs those regexps against the filename.
(let* ((file-name-handler-alist nil))
  ;; `package-initialize' takes 35% of startup time
  ;; @REF: https://github.com/doomemacs/doomemacs/blob/develop/docs/faq.org#how-does-doom-start-up-so-quickly
  (require-init 'init-base)
  (require-init 'init-package))

;; Restore GC
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 16777216)
            (setq gc-cons-percentage 0.1)))

;; Measure Emacs Startup Time
(add-hook
 'emacs-startup-hook
 (lambda ()
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
