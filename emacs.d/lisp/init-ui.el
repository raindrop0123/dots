;;; init-ui.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'color-theme-sanityinc-tomorrow)
(require-package 'color-theme-sanityinc-solarized)
(require-package 'doom-themes)
(require-package 'zenburn-theme)
(require-package 'material-theme)
(require-package 'solarized-theme)
(require-package 'spacemacs-theme)
(require-package 'gruvbox-theme)
(require-package 'catppuccin-theme)
(add-hook 'after-init-hook
          (lambda ()
            (load-theme 'catppuccin t)
            (custom-set-faces '(font-lock-comment-face ((t (:foreground "#7f849c")))))
            (custom-set-faces '(line-number-current-line ((t (:foreground "#a6e3a1")))))))

(require-package 'solaire-mode)
(run-with-idle-timer 2 nil #'solaire-global-mode)

(require-package 'hide-mode-line)
(add-hook 'ibuffer-mode-hook #'hide-mode-line-mode)
(add-hook 'dired-mode-hook #'hide-mode-line-mode)

(require-package 'nerd-icons-ibuffer)
(add-hook 'ibuffer-mode-hook #'nerd-icons-ibuffer-mode)

(require-package 'nerd-icons-dired)
(add-hook 'dired-mode-hook #'nerd-icons-dired-mode)

(require-package 'hl-todo)
(run-with-idle-timer 2 nil #'hl-todo-mode)

(provide 'init-ui)
;;; init-ui.el ends here
