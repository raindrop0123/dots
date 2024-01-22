;;; init-misc.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'which-key)
(run-with-idle-timer 2 nil #'which-key-mode)

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

(require-package 'winum)
(run-with-idle-timer 2 nil #'winum-mode)
(with-eval-after-load 'winum
  (setq winum-format "[%s]")
  (setq winum-mode-line-position 0)
  (set-face-attribute 'winum-face nil :foreground "DeepPink" :weight 'bold))

(require-package 'gcmh)
(run-with-idle-timer 2 nil #'gcmh-mode)

(require-package 'xclip)
(run-with-idle-timer 2 nil #'xclip-mode)

(require-package 'cnfonts)
(when (display-graphic-p)
  (add-hook 'emacs-startup-hook #'cnfonts-mode))

(require-package 'helpful)
(global-set-key (kbd "C-h f") 'helpful-callable)
(global-set-key (kbd "C-h v") 'helpful-variable)
(global-set-key (kbd "C-h k") 'helpful-key)
(global-set-key (kbd "C-h x") 'helpful-command)

(require-package 'esup)
(require-package 'sudo-edit)

(provide 'init-misc)
;;; init-misc.el ends here
