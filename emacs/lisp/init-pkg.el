;;; init-pkg.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'company)
(add-hook 'prog-mode-hook 'global-company-mode)
(with-eval-after-load 'company
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers t)
  (setq company-dabbrev-downcase nil)
  (setq company-dabbrev-ignore-case t)
  (setq company-tooltip-align-annotations t)
  (setq company-format-margin-function 'company-vscode-dark-icons-margin)
  (setq company-global-modes '(not eshell-mode shell-mode minibuffer-inactive-mode message-mode)))

(require-package 'evil)
(setq evil-want-integration t)
(setq evil-want-keybinding nil)
(add-hook 'after-init-hook 'evil-mode)

(require-package 'evil-escape)
(add-hook 'evil-mode-hook 'evil-escape-mode)
(with-eval-after-load 'evil-escape
  (setq evil-escape-key-sequence "jk")
  (setq evil-escape-delay 0.2))

(require-package 'evil-collection)
(add-hook 'evil-mode-hook 'evil-collection-init)

(require-package 'ivy)
(add-hook 'after-init-hook 'ivy-mode)
(with-eval-after-load 'ivy
  (setq ivy-use-virutal-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-height 16)
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-count-format "%d ")
  (setq ivy-re-builders-alist `((t . ivy--regex-ignore-order))))

(require-package 'counsel)
(add-hook 'ivy-mode-hook 'counsel-mode)

(require-package 'swiper)
(global-set-key (kbd "C-s") 'swiper-isearch)

(require-package 'wgrep)
(require-package 'amx)

(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(provide 'init-pkg)
;;; init-pkg.el ends here
