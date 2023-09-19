;;; init-misc.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'xclip)
(add-hook 'after-init-hook 'xclip-mode)

(require-package 'which-key)
(add-hook 'after-init-hook 'which-key-mode)
(with-eval-after-load 'which-key
  (setq-default which-key-idle-delay 1))

(require-package 'ace-window)
(global-set-key [remap other-window] 'ace-window)
(global-set-key (kbd "M-o") 'ace-window)
(with-eval-after-load 'ace-window
  (setq-default aw-background t)
  (setq-default aw-char-position 'top-left)
  (setq-default aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (custom-set-faces '(aw-leading-char-face ((t (:foreground "#ff0000" :height 500))))))

(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require-package 'avy)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)

(require-package 'sudo-edit)
(require-package 'esup)

(provide 'init-misc)
;;; init-misc.el ends here
