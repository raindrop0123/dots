;;; init-minibuffer.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'vertico)
(add-hook 'after-init-hook 'vertico-mode)
(with-eval-after-load 'vertico
  (setq vertico-scroll-margin 0)
  (setq vertico-count 16)
  (setq vertico-resize t)
  (setq vertico-cycle t))

(require-package 'orderless)
(setq completion-styles '(orderless basic))
(setq completion-category-defaults nil)
(setq completion-category-overrides '((file (styles partial-completion))))

(require-package 'consult)
(require-package 'consult-flycheck)
(global-set-key [remap switch-to-buffer] 'consult-buffer)
(global-set-key (kbd "M-g r") 'consult-ripgrep)
(global-set-key (kbd "C-s") 'consult-line)

(require-package 'marginalia)
(add-hook 'vertico-mode-hook 'marginalia-mode)

(require-package 'embark)
(require-package 'embark-consult)
(require-package 'wgrep)
(define-key minibuffer-local-map (kbd "C-c C-a") 'embark-act)
(define-key minibuffer-local-map (kbd "C-c C-c") 'embark-collect)
(add-hook 'embark-collect-mode-hook 'consult-preview-at-point-mode)

(provide 'init-minibuffer)
;;; init-minibuffer.el ends here
