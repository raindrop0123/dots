;;; init-corfu.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'corfu)
(require-package 'nerd-icons-corfu)
(add-hook 'after-init-hook 'global-corfu-mode)
(add-hook 'global-corfu-mode-hook 'corfu-popupinfo-mode)
(with-eval-after-load 'corfu
  (setq corfu-auto t)
  (setq corfu-auto-prefix 1)
  (setq corfu-preview-current nil)
  (setq corfu-auto-delay 0.1)
  (setq corfu-popupinfo-delay '(0.2 . 0.1))
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(require-package 'corfu-terminal)
(unless (display-graphic-p)
  (add-hook 'global-corfu-mode-hook 'corfu-terminal-mode))

(require-package 'cape)
(add-to-list 'completion-at-point-functions 'cape-dabbrev)
(add-to-list 'completion-at-point-functions 'cape-file)
(add-to-list 'completion-at-point-functions 'cape-elisp-block)
(add-to-list 'completion-at-point-functions 'cape-keyword)
(add-to-list 'completion-at-point-functions 'cape-abbrev)

(provide 'init-corfu)
;;; init-corfu.el ends here
