;;; init-company.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'company)
(add-hook 'prog-mode-hook 'global-company-mode)
(with-eval-after-load 'company
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers t)
  (setq company-tooltip-align-annotations t)
  (setq company-format-margin-function 'company-vscode-dark-icons-margin)
  (setq company-global-modes '(not eshell-mode shell-mode minibuffer-inactive-mode message-mode)))

(provide 'init-company)
;;; init-company.el ends here
