;;; init-evil.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'evil)
(setq evil-want-integration t)
(setq evil-want-keybinding nil)
(add-hook 'after-init-hook #'evil-mode)
(with-eval-after-load 'evil
  (evil-ex-define-cmd "wq" 'save-buffer)
  (evil-ex-define-cmd "q" 'kill-this-buffer)
  (setq evil-mode-line-format '(before . mode-line-front-space))
  (setq evil-emacs-state-message nil)
  (setq evil-insert-state-message nil)
  (setq evil-replace-state-message nil)
  (setq evil-motion-state-message nil)
  (setq evil-visual-state-message nil)
  (setq evil-operator-state-message nil)
  (setq evil-normal-state-tag (propertize " NORMAL " 'face '((:background "#89b4fa" :foreground "#11111b"))))
  (setq evil-emacs-state-tag (propertize " EMACS " 'face '((:background "#cba6f7" :foreground "#11111b"))))
  (setq evil-insert-state-tag (propertize " INSERT " 'face '((:background "#a6e3a1" :foreground "#11111b"))))
  (setq evil-replace-state-tag (propertize " REPLACE " 'face '((:background "#f9e2af" :foreground "#11111b"))))
  (setq evil-motion-state-tag (propertize " MOTION " 'face '((:background "#f2cdcd" :foreground "#11111b"))))
  (setq evil-visual-state-tag (propertize " VISUAL " 'face '((:background "#fab387" :foreground "#11111b"))))
  (setq evil-operator-state-tag (propertize " OPERATE " 'face '((:background "#b4befe" :foreground "#11111b"))))
  (when (display-graphic-p)
    (setq evil-normal-state-cursor '(box "white")
          evil-insert-state-cursor '(bar "red")
          evil-visual-state-cursor '(hollow "red"))))

(require-package 'evil-escape)
(add-hook 'evil-mode-hook #'evil-escape-mode)
(with-eval-after-load 'evil-escape
  (setq evil-escape-key-sequence "jk")
  (setq evil-escape-delay 0.2))

(require-package 'evil-collection)
(run-with-idle-timer 2 nil #'evil-collection-init)

(require-package 'evil-goggles)
(add-hook 'evil-mode-hook #'evil-goggles-mode)

(require-package 'evil-matchit)
(add-hook 'evil-mode-hook #'global-evil-matchit-mode)

(require-package 'evil-nerd-commenter)
(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map "gcc" #'evilnc-comment-or-uncomment-lines)
  (define-key evil-visual-state-map "gc" #'evilnc-comment-or-uncomment-lines))

(require-package 'evil-terminal-cursor-changer)
(unless (display-graphic-p)
  (add-hook 'evil-mode-hook #'evil-terminal-cursor-changer-activate))
(with-eval-after-load 'evil-terminal-cursor-changer
  (setq evil-motion-state-cursor 'box)
  (setq evil-visual-state-cursor 'box)
  (setq evil-normal-state-cursor 'box)
  (setq evil-insert-state-cursor 'bar)
  (setq evil-emacs-state-cursor 'hbar))

(provide 'init-evil)
;;; init-evil.el ends here
