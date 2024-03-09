;;; init-minibuffer.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'vertico)
(add-hook 'after-init-hook #'vertico-mode)
(with-eval-after-load 'vertico
  (setq vertico-scroll-margin 0)
  (setq vertico-count 15)
  (setq vertico-resize t)
  (setq vertico-cycle t)
  (define-key vertico-map (kbd "DEL") 'vertico-directory-delete-char))

(require-package 'orderless)
(setq completion-styles '(orderless basic))
(setq completion-category-defaults nil)
(setq completion-category-overrides '((file (styles partial-completion))))

(require-package 'marginalia)
(add-hook 'vertico-mode-hook #'marginalia-mode)

(require-package 'consult)
(global-set-key [remap isearch-forward] 'consult-line)
(global-set-key [remap switch-to-buffer] 'consult-buffer)

(require-package 'embark)
(define-key minibuffer-mode-map (kbd "C-c C-a") 'embark-act)

(require-package 'embark-consult)
(add-hook 'embark-collect-mode-hook #'consult-preview-at-point-mode)
(define-key minibuffer-mode-map (kbd "C-c C-e") 'embark-export)

(provide 'init-minibuffer)
;;; init-minibuffer.el ends here
