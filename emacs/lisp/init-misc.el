;;; init-misc.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'ace-window)
(global-set-key [remap other-window] 'ace-window)
(global-set-key (kbd "M-o") 'ace-window)
(with-eval-after-load 'ace-window
  (setq aw-background t)
  (setq aw-char-position 'top-left)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (custom-set-faces '(aw-leading-char-face ((t (:foreground "#ff0000" :height 500))))))

(require-package 'gcmh)
(add-hook 'after-init-hook 'gcmh-mode)

(require-package 'xclip)
(add-hook 'after-init-hook 'xclip-mode)

(require-package 'which-key)
(add-hook 'after-init-hook 'which-key-mode)
(with-eval-after-load 'which-key
  (setq which-key-idle-delay 1))

(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require-package 'avy)
(global-set-key (kbd "M-g l") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-0)

(require-package 'undo-tree)
(require-package 'sudo-edit)
(require-package 'esup)

(provide 'init-misc)
;;; init-misc.el ends here
