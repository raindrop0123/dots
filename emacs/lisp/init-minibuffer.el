;;; init-corfu.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

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

(require-package 'wgrep)

(provide 'init-minibuffer)
;;; init-minibuffer.el ends here
