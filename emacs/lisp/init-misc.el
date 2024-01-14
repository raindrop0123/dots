;;; init-misc.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:


(require-package 'which-key)
(add-hook 'after-init-hook #'which-key-mode)

(require-package 'avy)
(global-set-key (kbd "M-g w") #'avy-goto-word-0)
(global-set-key (kbd "M-g l") #'avy-goto-line)

(require-package 'ace-window)
(global-set-key [remap other-window] #'ace-window)
(global-set-key (kbd "M-o") #'ace-window)
(with-eval-after-load 'ace-window
  (setq aw-background nil)
  (setq aw-char-position 'top-left)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(require-package 'gcmh)
(add-hook 'after-init-hook #'gcmh-mode)

(require-package 'xclip)
(add-hook 'after-init-hook #'xclip-mode)

(require-package 'cnfonts)
(add-hook 'emacs-startup-hook #'cnfonts-mode)

(require-package 'helpful)
(global-set-key (kbd "C-h f") 'helpful-callable)
(global-set-key (kbd "C-h v") 'helpful-variable)
(global-set-key (kbd "C-h k") 'helpful-key)
(global-set-key (kbd "C-h x") 'helpful-command)

(require-package 'git-gutter)
(add-hook 'prog-mode-hook #'global-git-gutter-mode)

(require-package 'esup)
(require-package 'sudo-edit)

(provide 'init-misc)
;;; init-misc.el ends here
