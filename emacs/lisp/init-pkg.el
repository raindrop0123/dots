;;; init-pkg.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'evil)
(add-hook 'after-init-hook #'evil-mode)
(with-eval-after-load 'evil
  (setq evil-cross-lines t))

(require-package 'evil-escape)
(add-hook 'evil-mode-hook #'evil-escape-mode)
(with-eval-after-load 'evil-escape
  (setq evil-escape-key-sequence "jk")
  (setq evil-escape-delay 0.2))

(require-package 'company)
(add-hook 'prog-mode-hook 'company-mode)
(with-eval-after-load 'company
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers t)
  (setq company-tooltip-align-annotations t)
  (setq company-icon-margin 4)
  (setq company-format-margin-function 'company-vscode-dark-icons-margin)
  (setq company-dabbrev-ignore-case nil)
  (setq company-dabbrev-downcase nil)
  (setq company-backends '((company-capf :with company-yasnippet)
                           (company-dabbrev-code company-keywords company-files)
                           company-dabbrev))
  (setq company-global-modes '(not
                               eshell-mode
                               shell-mode
                               minibuffer-inactive-mode
                               message-mode)))

(require-package 'which-key)
(run-with-idle-timer 2 nil #'which-key-mode)

(require-package 'xclip)
(run-with-idle-timer 2 nil #'xclip-mode)

(provide 'init-pkg)
;;; init-pkg.el ends here
