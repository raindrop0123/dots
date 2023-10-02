;;; early-init.el --- -*- lexical-binding: t; -*-

;;;; Commentary:

;; Emacs 27 introduces early-init.el, which is run before init.el,
;; before package and UI initialization happens.

;;; Code:

;; Increasing Processing Power
(when (boundp 'read-process-output-max)
  (setq read-process-output-max (* 24 1024 1024)))

;; Disable native-comp feature
(when (fboundp 'native-comp-available-p)
  (setq-default native-comp-speed -1)
  (setq-default native-comp-deferred-compilation nil)
  (setq-default native-comp-async-report-warnings-errors nil))

;; Package initialize occurs automatically, before `user-init-file' is
;; loaded, but after `early-init-file'. We handle package
;; initialization, so we must prevent Emacs from doing it early!
(setq package-enable-at-startup nil)
(setq-default package-quickstart nil)
(setq-default package-archives nil)

;; @REF: https://www.reddit.com/r/emacs/comments/ofhket/further_boost_start_up_time_with_a_simple_tweak/
;; Speed up the startup time
(setq gc-cons-percentage 0.6)
(setq gc-cons-threshold most-positive-fixnum)
(setq file-name-handler-alist nil)

;; Settings
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)
(setq custom-file (locate-user-emacs-file "custom.el"))
(setq initial-major-mode 'fundamental-mode)
(setq load-prefer-newer noninteractive)
(setq make-backup-files nil)
(setq use-short-answers t)
(setq inhibit-startup-message t)
(setq create-lockfiles nil)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
(setq locale-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(setq frame-inhibit-implied-resize t)
(setq frame-resize-pixelwise t)
(setq inhibit-default-init t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-buffer-menu t)
(setq inhibit-startup-echo-area-message user-login-name)
(setq inhibit-startup-screen t)

;; Set the GUI frame appearance
(setq default-frame-alist
      '((menu-bar-lines . 0)
        (tool-bar-lines . 0)
        (horizontal-scroll-bars)
        (vertical-scroll-bars)
        ;; (alpha . 0.9)
        ;; (fullscreen . maximized)
        ;; (undecorated . t)
        ;; (internal-border-width . 0)
        ;; (ns-transparent-titlebar . t)
        ;; (ns-appearance . 'dark)
        ))

(provide 'early-init)
;;; early-init.el ends here
