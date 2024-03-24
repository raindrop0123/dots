;;; init-corfu.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'corfu)
(add-hook 'after-init-hook #'global-corfu-mode)
(add-hook 'corfu-mode-hook #'corfu-popupinfo-mode)
(with-eval-after-load 'corfu
  (setq corfu-auto t)
  (setq corfu-auto-delay 0.1)
  (setq corfu-auto-prefix 1)
  (setq global-corfu-modes '((not eshell-mode vterm-mode) t))
  (setq corfu-cycle t)
  (setq corfu-preselect nil)
  (setq corfu-count 10)
  (setq corfu-max-width 120)
  (setq corfu-on-exact-match nil)
  (setq corfu-popupinfo-delay '(0.5 . 1.0)))

(require-package 'corfu-terminal)
(when (not (display-graphic-p))
  (add-hook 'corfu-mode-hook #'corfu-terminal-mode))

(require-package 'nerd-icons-corfu)
(add-hook
 'corfu-mode-hook
 #'(lambda () (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter)))

(require-package 'cape)
(add-hook
 'after-init-hook
 #'(lambda ()
     (add-to-list 'completion-at-point-functions #'cape-dabbrev)
     (add-to-list 'completion-at-point-functions #'cape-file)
     (add-to-list 'completion-at-point-functions #'cape-elisp-block)))

(provide 'init-corfu)
;;; init-corfu.el ends here
