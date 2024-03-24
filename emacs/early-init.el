;;; early-init.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Setup fundamental-mode to speed up.
(setq initial-major-mode 'fundamental-mode)

;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-percentage 0.8)

;; Package initialize occurs automatically, before `user-init-file' is
;; loaded, but after `early-init-file'. We handle package
;; initialization, so we must prevent Emacs from doing it early!
(setq package-enable-at-startup nil)
(setq load-prefer-newer noninteractive)

;; Do not resize the frame at this early stage.
(setq frame-inhibit-implied-resize t)

;; Do not show startup screen
(setq inhibit-startup-screen t)

;; System default coding
(set-language-environment 'utf-8)

;; Use short answer
(setq use-short-answers t)

;; Disable auto-save file
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)

;; Disable backup file
(setq make-backup-files nil)

;; Disable lockfiles
(setq create-lockfiles nil)

;; Define customized file path and file name
(setq custom-file (locate-user-emacs-file "custom.el"))

;; Don't make noises
(setq ring-bell-function #'ignore)

(provide 'early-init)
;;; early-init.el ends here
