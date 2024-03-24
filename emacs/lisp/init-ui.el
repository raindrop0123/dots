;;; init-ui.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'catppuccin-theme)
(add-hook
 'after-init-hook
 #'(lambda ()
     (load-theme 'catppuccin t)
     (custom-set-faces '(default ((t (:background "#11111b" :foreground "#cdd6f4")))))
     (custom-set-faces '(font-lock-comment-face ((t (:foreground "#6c7086")))))
     (custom-set-faces '(line-number ((t (:background "#11111b" :foreground "#6c7086")))))
     (custom-set-faces '(line-number-current-line ((t (:background "#11111b" :foreground "#a6e3a1" :weight bold)))))
     (custom-set-faces '(corfu-default ((t (:background "#11111b" :foreground "#cdd6f4")))))
     (custom-set-faces '(corfu-bar ((t (:background "#7f849c")))))
     (custom-set-faces '(corfu-border ((t (:background "#89b4fa")))))))

(require-package 'nerd-icons-ibuffer)
(add-hook 'ibuffer-mode-hook #'nerd-icons-ibuffer-mode)

(require-package 'nerd-icons-dired)
(add-hook 'dired-mode-hook #'nerd-icons-dired-mode)

(require-package 'diredfl)
(add-hook 'dired-mode-hook #'diredfl-mode)

(require-package 'winum)
(run-with-idle-timer 2 nil #'winum-mode)
(with-eval-after-load 'winum
  (setq winum-format "[%s]")
  (setq winum-mode-line-position 0))

(provide 'init-ui)
;;; init-ui.el ends here
