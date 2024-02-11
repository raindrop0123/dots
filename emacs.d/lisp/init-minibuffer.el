;;; init-minibuffer.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; vertico
(require-package 'vertico)
(add-hook 'after-init-hook 'vertico-mode)
(with-eval-after-load 'vertico
  (define-key vertico-map (kbd "DEL") 'vertico-directory-delete-char)
  (setq vertico-scroll-margin 0)
  (setq vertico-count 15)
  (setq vertico-resize t)
  (setq vertico-cycle t))

;; marginalia
(require-package 'marginalia)
(add-hook 'vertico-mode-hook 'marginalia-mode)

;; orderless
(require-package 'orderless)
(with-eval-after-load 'minibuffer
  (setq completion-styles '(orderless basic))
  (setq completion-category-defaults nil)
  (setq completion-category-overrides '((file (styles partial-completion)))))

;; consult
(require-package 'consult)
(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "M-g r") 'consult-ripgrep)
(global-set-key (kbd "M-g f") 'consult-flycheck)
(global-set-key [remap switch-to-buffer] 'consult-buffer)

;; embark
(require-package 'embark)
(require-package 'embark-consult)
(define-key minibuffer-local-map (kbd "C-c C-c") 'embark-collect)
(define-key minibuffer-local-map (kbd "C-c C-a") 'embark-act)
(with-eval-after-load 'embark
  (add-hook 'embark-collect-mode-hook 'consult-preview-at-point-mode))

;; wgrep
(require-package 'wgrep)

;; deadgrep
(require-package 'deadgrep)
(global-set-key (kbd "<f5>") #'deadgrep)

(provide 'init-minibuffer)
;;; init-minibuffer.el ends here
