;;; init-evil.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'evil)
(setq evil-want-integration t)
(setq evil-want-keybinding nil)
(add-hook 'after-init-hook #'evil-mode)
(with-eval-after-load 'evil
  (setq evil-cross-lines t)
  (evil-ex-define-cmd "wq" 'save-buffer)
  (evil-ex-define-cmd "q" 'kill-this-buffer)
  (setq evil-normal-state-cursor '(box "#f5e0dc"))
  (setq evil-insert-state-cursor '(bar "#f38ba8"))
  (setq evil-visual-state-cursor '(hollow "#f9e2af"))
  (setq evil-mode-line-format '(before . mode-line-front-space))
  (setq evil-normal-state-tag (propertize " NORMAL " 'face '((:background "#89b4fa" :foreground "#11111b"))))
  (setq evil-insert-state-tag (propertize " INSERT " 'face '((:background "#a6e3a1" :foreground "#11111b"))))
  (setq evil-emacs-state-tag (propertize " EMACS " 'face '((:background "#cba6f7" :foreground "#11111b"))))
  (setq evil-visual-state-tag (propertize " VISUAL " 'face '((:background "#f9e2af" :foreground "#11111b"))))
  (setq evil-replace-state-tag (propertize " REPLACE " 'face '((:background "#f38ba8" :foreground "#11111b")))))

(require-package 'evil-escape)
(add-hook 'evil-mode-hook #'evil-escape-mode)
(with-eval-after-load 'evil-escape
  (setq evil-escape-key-sequence "jk")
  (setq evil-escape-delay 0.2))

(require-package 'evil-collection)
(run-with-idle-timer 2 nil #'(lambda () (evil-collection-init)))

(require-package 'evil-nerd-commenter)
(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map "gcc" #'evilnc-comment-or-uncomment-lines)
  (define-key evil-visual-state-map "gc" #'evilnc-comment-or-uncomment-lines))

(require-package 'evil-matchit)
(add-hook 'evil-mode-hook #'global-evil-matchit-mode)

(require-package 'evil-goggles)
(run-with-idle-timer 2 nil #'evil-goggles-mode)

(require-package 'evil-visualstar)
(run-with-idle-timer 2 nil #'global-evil-matchit-mode)

(provide 'init-evil)
;;; init-evil.el ends here
