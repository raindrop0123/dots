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
  (setq evil-normal-state-tag (propertize " NORMAL " 'face '((:background "black" :foreground "lightblue"))))
  (setq evil-emacs-state-tag (propertize " EMACS " 'face '((:background "black" :foreground "deeppink"))))
  (setq evil-insert-state-tag (propertize " INSERT " 'face '((:background "black" :foreground "lightgreen"))))
  (setq evil-replace-state-tag (propertize " REPLACE " 'face '((:background "black" :foreground "orange"))))
  (setq evil-motion-state-tag (propertize " MOTION " 'face '((:background "black" :foreground "white"))))
  (setq evil-visual-state-tag (propertize " VISUAL " 'face '((:background "black" :foreground "gold"))))
  (setq evil-operator-state-tag (propertize " OPERATE " 'face '((:background "black" :foreground "white"))))
  (when (display-graphic-p)
    (setq evil-normal-state-cursor '(box "white"))
    (setq evil-insert-state-cursor '(bar "red"))
    (setq evil-visual-state-cursor '(hollow "gold"))))

(require-package 'evil-escape)
(add-hook 'evil-mode-hook #'evil-escape-mode)
(with-eval-after-load 'evil-escape
  (setq evil-escape-key-sequence "jk")
  (setq evil-escape-delay 0.2))

(require-package 'evil-collection)
(run-with-idle-timer 2 nil #'evil-collection-init)

(require-package 'evil-matchit)
(add-hook 'evil-mode-hook #'global-evil-matchit-mode)

(require-package 'evil-nerd-commenter)
(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map "gcc" #'evilnc-comment-or-uncomment-lines)
  (define-key evil-visual-state-map "gc" #'evilnc-comment-or-uncomment-lines))

(require-package 'evil-goggles)
(add-hook 'evil-mode-hook #'evil-goggles-mode)

(require-package 'evil-visualstar)
(add-hook 'evil-mode-hook 'global-evil-visualstar-mode)

(provide 'init-evil)
;;; init-evil.el ends here
