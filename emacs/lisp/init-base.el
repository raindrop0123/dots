;;; init-base.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; package.el
(package-initialize)
(setq package-quickstart t)
(setq package-check-signature nil)
(setq package-enable-at-startup nil)
(setq package-archives nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
;; (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
;; (add-to-list 'package-archives '("elpa-devel" . "https://elpa.gnu.org/devel/"))
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
;; (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

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

;; C source code
(setq-default scroll-step 1)
(setq-default scroll-conservatively 10000)
(setq-default auto-window-vscroll nil)
(setq-default bidi-display-reordering nil)
(add-hook 'minibuffer-setup-hook #'(lambda () (setq gc-cons-threshold most-positive-fixnum)))
(add-hook 'minibuffer-exit-hook #'(lambda () (setq gc-cons-threshold 800000)))

;; icomplete.el
(add-hook 'after-init-hook #'icomplete-mode)

;; simple.el
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(add-hook 'prog-mode-hook #'size-indication-mode)
(add-hook 'prog-mode-hook #'line-number-mode)
(add-hook 'prog-mode-hook #'column-number-mode)
(add-hook 'prog-mode-hook #'auto-save-mode)

;; so-long.el
(add-hook 'prog-mode-hook #'global-so-long-mode)

;; autorevert.el
(add-hook 'prog-mode-hook #'global-auto-revert-mode)

;; hl-line.el
(add-hook 'prog-mode-hook #'global-hl-line-mode)

;; files.el
(add-hook 'after-init-hook #'auto-save-visited-mode)

;; display-line-numbers.el
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; display-fill-column-indicator.el
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; paren.el
(add-hook 'prog-mode-hook #'show-paren-mode)

;; elec-pair
(add-hook 'prog-mode-hook #'electric-pair-mode)

;; loaddefs.el
(add-hook 'prog-mode-hook #'save-place-mode)

;; flymake.el
(add-hook 'prog-mode-hook #'flymake-mode)
(global-set-key (kbd "M-p") 'flymake-goto-prev-error)
(global-set-key (kbd "M-n") 'flymake-goto-next-error)

;; ibuffer.el
(defalias 'list-buffers 'ibuffer)

(provide 'init-base)
;;; init-base.el ends here
