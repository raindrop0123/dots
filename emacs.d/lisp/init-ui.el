;;; init-ui.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'nerd-icons-ibuffer)
(add-hook 'ibuffer-mode-hook #'nerd-icons-ibuffer-mode)

(require-package 'nerd-icons-dired)
(add-hook 'dired-mode-hook #'nerd-icons-dired-mode)

(require-package 'diredfl)
(add-hook 'dired-mode-hook #'diredfl-mode)

(require-package 'hl-todo)
(run-with-idle-timer 2 nil #'hl-todo-mode)

(provide 'init-ui)
;;; init-ui.el ends here
