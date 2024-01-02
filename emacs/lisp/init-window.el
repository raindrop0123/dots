;;; init-window.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'ace-window)
(global-set-key [remap other-window] 'ace-window)
(global-set-key (kbd "M-o") 'ace-window)
(with-eval-after-load 'ace-window
  (setq aw-background nil)
  (setq aw-char-position 'top-left)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(require-package 'winum)
(add-hook 'after-init-hook 'winum-mode)
(with-eval-after-load 'winum
  (set-face-attribute 'winum-face nil :foreground "#ff0000" :weight 'bold)
  (setq winum-format "[%s]")
  (setq winum-mode-line-position 0)
  (setq winum-keymap
        (let ((map (make-sparse-keymap)))
          (define-key map (kbd "M-0") 'winum-select-window-0-or-10)
          (define-key map (kbd "M-1") 'winum-select-window-1)
          (define-key map (kbd "M-2") 'winum-select-window-2)
          (define-key map (kbd "M-3") 'winum-select-window-3)
          (define-key map (kbd "M-4") 'winum-select-window-4)
          (define-key map (kbd "M-5") 'winum-select-window-5)
          (define-key map (kbd "M-6") 'winum-select-window-6)
          (define-key map (kbd "M-7") 'winum-select-window-7)
          (define-key map (kbd "M-8") 'winum-select-window-8)
          map)))

(provide 'init-window)
;;; init-window.el ends here
