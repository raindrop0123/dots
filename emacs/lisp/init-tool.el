;;; init-tool.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'avy)
(global-set-key (kbd "M-w") 'avy-goto-word-0)
(global-set-key (kbd "M-l") 'avy-goto-line)

(require-package 'helpful)
(global-set-key (kbd "C-h f") #'helpful-callable)
(global-set-key (kbd "C-h v") #'helpful-variable)
(global-set-key (kbd "C-h k") #'helpful-key)
(global-set-key (kbd "C-h x") #'helpful-command)
(global-set-key (kbd "C-h C-h") #'helpful-at-point)

(require-package 'xclip)
(add-hook 'after-init-hook #'xclip-mode)

(require-package 'rainbow-mode)
(add-hook 'prog-mode-hook #'rainbow-mode)

(require-package 'ace-window)
(global-set-key [remap other-window] #'ace-window)
(with-eval-after-load 'ace-window
  (setq aw-background nil)
  (setq aw-char-position 'top-left)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(require-package 'esup)

(provide 'init-tool)
;;; init-tool.el ends here
