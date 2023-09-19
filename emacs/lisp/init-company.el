;;; init-company.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'company)
(add-hook 'prog-mode-hook 'global-company-mode)
(with-eval-after-load 'company
  (setq-default company-idle-delay 0.1)
  (setq-default company-minimum-prefix-length 1)
  (setq-default company-show-numbers t)
  (setq-default company-tooltip-align-annotations t)
  (setq-default company-global-modes
                '(not
                  eshell-mode
                  shell-mode
                  minibuffer-inactive-mode
                  message-mode)))

(provide 'init-company)
;;; init-company.el ends here
