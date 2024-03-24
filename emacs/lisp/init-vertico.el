;;; init-vertico.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'vertico)
(add-hook 'after-init-hook #'vertico-mode)
(with-eval-after-load 'vertico
  (setq vertico-scroll-margin 0)
  (setq vertico-count 12)
  (setq vertico-resize t)
  (setq vertico-cycle t)
  (define-key vertico-map (kbd "DEL") 'vertico-directory-delete-char))

(require-package 'marginalia)
(add-hook 'vertico-mode-hook #'marginalia-mode)

(require-package 'nerd-icons-completion)
(add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup)

(require-package 'orderless)
(setq completion-styles '(orderless basic))
(setq completion-category-overrides '((file (styles basic partial-completion))))

(require-package 'consult)
(global-set-key [remap bookmark-jump] #'consult-bookmark)
(global-set-key [remap goto-line] #'consult-goto-line)
(global-set-key [remap imenu] #'consult-imenu)
(global-set-key [remap Info-search] #'consult-info)
(global-set-key [remap switch-to-buffer] #'consult-buffer)
(global-set-key [remap isearch-forward] #'consult-line)

(require-package 'embark)
(global-set-key (kbd "M-.") 'embark-act)
(global-set-key (kbd "M-;") 'embark-export)

(require-package 'embark-consult)
(add-hook 'embark-collect-mode #'consult-preview-at-point-mode)

(provide 'init-vertico)
;;; init-vertico.el ends here
