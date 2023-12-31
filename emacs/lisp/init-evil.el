;;; init-evil.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'evil)
(setq evil-want-integration t)
(setq evil-want-keybinding nil)
(add-hook 'after-init-hook #'evil-mode)

(require-package 'evil-escape)
(add-hook 'evil-mode-hook #'evil-escape-mode)
(with-eval-after-load 'evil-escape
  (setq evil-escape-key-sequence "jk")
  (setq evil-escape-delay 0.2))

(require-package 'evil-collection)
(add-hook 'evil-mode-hook #'evil-collection-init)

(require-package 'evil-goggles)
(add-hook 'evil-mode-hook #'evil-goggles-mode)

(require-package 'evil-matchit)
(add-hook 'evil-mode-hook #'global-evil-matchit-mode)

(require-package 'evil-nerd-commenter)
(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map "gcc" #'evilnc-comment-or-uncomment-lines)
  (define-key evil-visual-state-map "gc" #'evilnc-comment-or-uncomment-lines))

(provide 'init-evil)
;;; init-evil.el ends here
