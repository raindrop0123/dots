;;; init-base.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; C source code
(setq scroll-step 1)
(setq scroll-conservatively 10000)

;; package.el
(package-initialize)
(setq package-quickstart t)
(setq package-check-signature nil)
(setq package-enable-at-startup nil)
(setq package-archives
      '(;; ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ;; ("elpa-devel" . "https://elpa.gnu.org/devel/")
        ;; ("org" . "https://orgmode.org/elpa/")
        ;; ("marmalade" . "http://marmalade-repo.org/packages/")
        ;; ("jcs-elpa" . "https://jcs-emacs.github.io/jcs-elpa/packages/")
        ;; ("redguardtoo" . "https://raw.githubusercontent.com/redguardtoo/myelpa/master/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(setq package-archive-priorities
      '(("melpa-stable" . 10)
        ("melpa" . 5)
        ("gnu" . 0)))

(defun require-package (package &optional min-version no-refresh)
  (unless (featurep 'package)
    (condition-case nil
        (require 'package)
      (error nil)))
  (unless (package-installed-p package min-version)
    (unless (or (assoc package package-archive-contents) no-refresh)
      (message "Missing package: %s" package)
      (package-refresh-contents))
    (package-install package)))

;; modus-themes.el
(add-hook 'after-init-hook
          #'(lambda ()
              (load-theme 'modus-vivendi t)
              (set-face-attribute 'mode-line nil :box nil)
              (set-face-attribute 'mode-line-inactive nil :box nil)
              ))

;; simple.el
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(add-hook 'prog-mode-hook #'size-indication-mode)
(add-hook 'prog-mode-hook #'line-number-mode)
(add-hook 'prog-mode-hook #'column-number-mode)
(add-hook 'prog-mode-hook #'auto-save-mode)

;; tab-line.el
(add-hook 'after-init-hook #'global-tab-line-mode)

;; so-long.el
(add-hook 'prog-mode-hook #'global-so-long-mode)

;; autorevert.el
(add-hook 'prog-mode-hook #'global-auto-revert-mode)

;; hl-line.el
(add-hook 'prog-mode-hook #'global-hl-line-mode)

;; display-line-numbers.el
(setq display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; display-fill-column-indicator.el
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; paren.el
(setq show-paren-when-point-inside-paren t)
(setq show-paren-when-point-in-periphery t)
(add-hook 'prog-mode-hook #'show-paren-mode)

;; elec-pair
(add-hook 'prog-mode-hook #'electric-pair-mode)

;; ibuffer.el
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; loaddefs.el
(add-hook 'prog-mode-hook #'save-place-mode)

;; flymake.el
(add-hook 'prog-mode-hook #'flymake-mode)

(provide 'init-base)
;;; init-base.el ends here
