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
  (setq company-global-modes '(not
                               eshell-mode
                               shell-mode
                               minibuffer-inactive-mode
                               message-mode)))

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
(require-package 'consult-flycheck)
(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "M-g r") 'consult-ripgrep)
(global-set-key (kbd "M-g f") 'consult-flycheck)
(global-set-key [remap switch-to-buffer] 'consult-buffer)

(require-package 'embark)
(require-package 'embark-consult)
(define-key minibuffer-local-map (kbd "C-c C-c") 'embark-collect)
(define-key minibuffer-local-map (kbd "C-c C-a") 'embark-act)
(with-eval-after-load 'embark
  (add-hook 'embark-collect-mode-hook 'embark-consult-preview-minor-mode))

(require-package 'marginalia)
(add-hook 'after-init-hook 'marginalia-mode)

(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require-package 'diredfl)
(add-hook 'dired-mode-hook 'diredfl-mode)

(require-package 'flycheck)
(add-hook 'prog-mode-hook 'global-flycheck-mode)

(require-package 'rainbow-mode)
(add-hook 'prog-mode-hook 'rainbow-mode)

(require-package 'which-key)
(add-hook 'after-init-hook 'which-key-mode)

(require-package 'avy)
(global-set-key (kbd "M-g w") 'avy-goto-word-0)
(global-set-key (kbd "M-g l") 'avy-goto-line)

(require-package 'gcmh)
(add-hook 'after-init-hook 'gcmh-mode)

(require-package 'ace-window)
(global-set-key [remap other-window] 'ace-window)
(global-set-key (kbd "M-o") 'ace-window)
(with-eval-after-load 'ace-window
  (setq aw-background t)
  (setq aw-char-position 'top-left)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (custom-set-faces '(aw-leading-char-face ((t (:foreground "#ff0000" :height 500))))))

(require-package 'lua-mode)
(with-eval-after-load 'lua-mode
  (setq lua-indent-level 2)
  (setq lua-indent-nested-block-content-align nil)
  (setq lua-indent-close-paren-align nil))

(require-package 'lsp-mode)
(require-package 'lsp-ui)
(require-package 'yaml-mode)
(require-package 'json-mode)
(require-package 'csv-mode)
(require-package 'wgrep)
(require-package 'esup)
(require-package 'sudo-edit)

(provide 'init-pkg)
;;; init-pkg.el ends here
