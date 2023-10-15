;;; init-ivy.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'ivy)
(add-hook 'after-init-hook 'ivy-mode)
(with-eval-after-load 'ivy
  (setq ivy-use-virutal-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-height 13)
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-count-format "%d ")
  (setq ivy-re-builders-alist `((t . ivy--regex-ignore-order))))

(require-package 'counsel)
(add-hook 'ivy-mode-hook 'counsel-mode)

(require-package 'swiper)
(global-set-key (kbd "C-s") 'swiper-isearch)

(require-package 'ivy-rich)
(add-hook 'ivy-mode-hook 'ivy-rich-mode)

(require-package 'nerd-icons-ivy-rich)
(add-hook 'ivy-mode-hook 'nerd-icons-ivy-rich-mode)

(require-package 'wgrep)
(require-package 'amx)

(provide 'init-ivy)
;;; init-ivy.el ends here
