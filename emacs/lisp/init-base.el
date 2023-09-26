;;; init-base.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; modus-themes.el
(add-hook 'after-init-hook (lambda () (load-theme 'modus-vivendi t)))

;; flymake.el
(add-hook 'prog-mode-hook 'flymake-mode)

;; tab-line.el
(add-hook 'after-init-hook 'global-tab-line-mode)

;; package.el
(package-initialize)
(setq-default package-quickstart t)
(setq package-enable-at-startup nil)
(setq-default
 package-archives
 '(;; ("nongnu" . "https://elpa.nongnu.org/nongnu/")
   ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
   ;; ("elpa-devel" . "https://elpa.gnu.org/devel/")
   ;; ("org" . "https://orgmode.org/elpa/")
   ;; ("marmalade" . "http://marmalade-repo.org/packages/")
   ;; ("jcs-elpa" . "https://jcs-emacs.github.io/jcs-elpa/packages/")
   ;; ("redguardtoo" . "https://raw.githubusercontent.com/redguardtoo/myelpa/master/")
   ("gnu" . "https://elpa.gnu.org/packages/")
   ("melpa" . "https://melpa.org/packages/")))

(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE with MIN-VERSION.
If NO-REFRESH is nil, `package-refresh-contents' is called."
  (unless (featurep 'package)
    (condition-case nil
        (require 'package)
      (error nil)))
  (unless (package-installed-p package min-version)
    (unless (or (assoc package package-archive-contents) no-refresh)
      (message "Missing package: %s" package)
      (package-refresh-contents))
    (package-install package)))

;; C source code
(setq use-short-answers t)
(add-hook 'minibuffer-setup-hook (lambda () (setq gc-cons-threshold most-positive-fixnum)))
(add-hook 'minibuffer-exit-hook (lambda () (setq gc-cons-threshold 800000)))

;; simple.el
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(add-hook 'prog-mode-hook #'size-indication-mode)
(add-hook 'prog-mode-hook #'line-number-mode)
(add-hook 'prog-mode-hook #'column-number-mode)
(add-hook 'prog-mode-hook #'auto-save-mode)

;; loaddef.el
(add-hook 'prog-mode-hook #'global-so-long-mode)
(add-hook 'prog-mode-hook #'global-auto-revert-mode)

;; hl-line.el
(add-hook 'prog-mode-hook #'global-hl-line-mode)

;; display-line-numbers.el
(add-hook 'prog-mode-hook #'global-display-line-numbers-mode)

;; display-fill-column-indicator.el
(add-hook 'prog-mode-hook #'global-display-fill-column-indicator-mode)

;; paren.el
(add-hook 'prog-mode-hook #'show-paren-mode)

;; elec-pair
(add-hook 'after-init-hook #'electric-pair-mode)

;; prog-mode.el
(add-hook 'prog-mode-hook #'global-prettify-symbols-mode)

;; ibuffer.el
(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'init-base)
;;; init-base.el ends here
