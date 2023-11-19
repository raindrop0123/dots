;;; init-package.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'corfu)
(require-package 'corfu-terminal)
(require-package 'nerd-icons-corfu)
(add-hook 'after-init-hook 'global-corfu-mode)
(add-hook 'global-corfu-mode-hook 'corfu-popupinfo-mode)
(unless (display-graphic-p)
  (add-hook 'global-corfu-mode-hook 'corfu-terminal-mode))
(with-eval-after-load 'corfu
  (setq corfu-auto t)
  (setq corfu-auto-prefix 1)
  (setq corfu-preview-current nil)
  (setq corfu-auto-delay 0.1)
  (setq corfu-popupinfo-delay '(0.2 . 0.1))
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(require-package 'cape)
(add-to-list 'completion-at-point-functions 'cape-dabbrev)
(add-to-list 'completion-at-point-functions 'cape-file)
(add-to-list 'completion-at-point-functions 'cape-elisp-block)
(add-to-list 'completion-at-point-functions 'cape-keyword)
(add-to-list 'completion-at-point-functions 'cape-abbrev)

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

(require-package 'evil-goggles)
(add-hook 'evil-mode-hook 'evil-goggles-mode)

(require-package 'evil-matchit)
(add-hook 'evil-mode-hook 'global-evil-matchit-mode)

(require-package 'evil-nerd-commenter)
(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map "gcc" 'evilnc-comment-or-uncomment-lines)
  (define-key evil-visual-state-map "gc" 'evilnc-comment-or-uncomment-lines))

(require-package 'vertico)
(add-hook 'after-init-hook 'vertico-mode)
(with-eval-after-load 'vertico
  (setq vertico-scroll-margin 0)
  (setq vertico-count 15)
  (setq vertico-resize t)
  (setq vertico-cycle t))

(require-package 'orderless)
(setq completion-styles '(orderless basic))
(setq completion-category-defaults nil)
(setq completion-category-overrides '((file (styles partial-completion))))

(require-package 'consult)
(require-package 'consult-eglot)
(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "M-g r") 'consult-ripgrep)
(global-set-key [remap switch-to-buffer] 'consult-buffer)

(require-package 'embark)
(require-package 'embark-consult)
(define-key minibuffer-local-map (kbd "C-c C-c") 'embark-collect)
(define-key minibuffer-local-map (kbd "C-c C-a") 'embark-act)
(with-eval-after-load 'embark
  (add-hook 'embark-collect-mode-hook 'embark-consult-preview-minor-mode))

(require-package 'marginalia)
(add-hook 'after-init-hook 'marginalia-mode)

(require-package 'which-key)
(add-hook 'after-init-hook 'which-key-mode)

(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require-package 'avy)
(require-package 'esup)
(require-package 'sudo-edit)
(require-package 'wgrep)

(provide 'init-package)
;;; init-package.el ends here
