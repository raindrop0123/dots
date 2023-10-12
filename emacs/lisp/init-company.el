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

(require-package 'company-quickhelp)
(when (window-system)
  (add-hook 'company-mode-hook 'company-quickhelp-mode))
(with-eval-after-load 'company-quickhelp
  (custom-set-variables
   '(company-quickhelp-color-background "#11111b")
   '(company-quickhelp-color-foreground "#cdd6f4")))

(provide 'init-company)
;;; init-company.el ends here
