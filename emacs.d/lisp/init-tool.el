;;; init-tool.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'helpful)
(global-set-key [remap describe-function] #'helpful-callable)
(global-set-key [remap describe-variable] #'helpful-variable)
(global-set-key [remap describe-keymap] #'helpful-key)

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
  (set-face-attribute 'winum-face nil :foreground "#a6e3a1" :weight 'bold))

(require-package 'diredfl)
(add-hook 'dired-mode-hook #'diredfl-mode)

(require-package 'which-key)
(run-with-idle-timer 2 nil #'which-key-mode)

(require-package 'gcmh)
(run-with-idle-timer 2 nil #'gcmh-mode)

(require-package 'xclip)
(run-with-idle-timer 2 nil #'xclip-mode)

(require-package 'avy)
(require-package 'esup)
(require-package 'sudo-edit)

(provide 'init-tool)
;;; init-tool.el ends here
