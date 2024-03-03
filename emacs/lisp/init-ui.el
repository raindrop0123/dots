;;; init-ui.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'diredfl)
(add-hook 'dired-mode-hook #'diredfl-mode)

(require-package 'nerd-icons-dired)
(add-hook 'dired-mode-hook #'nerd-icons-dired-mode)

(require-package 'nerd-icons-ibuffer)
(add-hook 'ibuffer-mode-hook #'nerd-icons-ibuffer-mode)

(provide 'init-ui)
;;; init-ui.el ends here
