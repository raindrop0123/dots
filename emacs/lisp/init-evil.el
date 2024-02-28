;;; init-evil.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'evil)
(setq evil-want-integration t)
(setq evil-want-keybinding nil)
(setq evil-want-C-u-scroll t)
(add-hook 'after-init-hook #'evil-mode)
(with-eval-after-load 'evil
  ;; equal `whichwrap' in vim
  (setq evil-cross-lines t)
  ;; change command
  (evil-ex-define-cmd "wq" 'save-buffer)
  (evil-ex-define-cmd "q" 'kill-this-buffer)
  ;; cursor style with different evil modes
  (when (display-graphic-p)
    (setq evil-normal-state-cursor '(box "white"))
    (setq evil-insert-state-cursor '(bar "red"))
    (setq evil-visual-state-cursor '(hollow "gold")))
  ;; mode-line with different evil modes
  (setq evil-mode-line-format '(before . mode-line-front-space))
  ;; (setq evil-normal-state-tag (propertize "[NORMAL]" 'face '((:background "#007acc" :foreground "#ffffff"))))
  (defun show-evil-state ()
    (let ((color
           (cond
            ((minibufferp) '("#2472c8" . "#ffffff"))
            (current-input-method '("#e80074" . "#ffffff"))
            ((evil-insert-state-p) '("#cd3131" . "#ffffff"))
            ((evil-emacs-state-p) '("#d670d6" . "#000000"))
            ((evil-visual-state-p) '("#e5e519" . "#000000"))
            ((evil-replace-state-p) '("#11a8cd" . "#000000"))
            ((buffer-modified-p) '("#2472c8" . "#ffffff"))
            (t '("#2472c8" . "#ffffff")))))
      (set-face-background 'mode-line (car color))
      (set-face-foreground 'mode-line (cdr color))))
  (add-hook 'post-command-hook #'show-evil-state))

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
(add-hook 'evil-mode-hook #'global-evil-visualstar-mode)

(require-package 'evil-easymotion)
(with-eval-after-load 'evil
  (evilem-default-keybindings "SPC"))

(require-package 'evil-snipe)
(add-hook 'evil-mode-hook #'evil-snipe-override-mode)
(with-eval-after-load 'evil-snipe
  (setq evil-snipe-scope 'buffer))

(require-package 'evil-surround)
(add-hook 'evil-mode-hook #'global-evil-surround-mode)

(provide 'init-evil)
;;; init-evil.el ends here
