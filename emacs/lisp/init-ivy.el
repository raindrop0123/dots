;;; init-ivy.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'ivy)
(add-hook 'after-init-hook 'ivy-mode)
(with-eval-after-load 'ivy
  (setq-default ivy-use-virutal-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq-default ivy-height 13)
  (setq-default ivy-count-format " %d ")
  (setq-default ivy-re-builders-alist `((t . ivy--regex-ignore-order))))

(require-package 'counsel)
(add-hook 'ivy-mode-hook 'counsel-mode)

(require-package 'swiper)
(global-set-key [remap isearch-forward] 'swiper-isearch)
(global-set-key (kbd "C-x b") 'counsel-switch-buffer)
(global-set-key (kbd "M-g r") 'counsel-switch-ripgrep)

(require-package 'wgrep)
(setq-default wgrep-auto-save-buffer t)

(require-package 'amx)

(provide 'init-ivy)
;;; init-ivy.el ends here
