;;; init-ui.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'beacon)
(add-hook 'after-init-hook 'beacon-mode)

(require-package 'cnfonts)
(add-hook 'after-init-hook 'cnfonts-mode)
(with-eval-after-load 'cnfonts
  (define-key cnfonts-mode-map (kbd "C--") #'cnfonts-decrease-fontsize)
  (define-key cnfonts-mode-map (kbd "C-=") #'cnfonts-increase-fontsize))

(require-package 'doom-themes)
(require-package 'catppuccin-theme)
(add-hook
 'after-init-hook
 (lambda ()
   (load-theme 'catppuccin t)
   (custom-set-faces '(default ((t (:background "#11111b")))))
   (custom-set-faces '(font-lock-comment-face ((t (:foreground "#9399b2")))))
   (custom-set-faces '(line-number ((t (:background "#11111b" :foreground "#585b70")))))
   (custom-set-faces '(line-number-current-line ((t (:background "#11111b" :foreground "#a6e3a1")))))))

(require-package 'doom-modeline)
(add-hook 'after-init-hook 'doom-modeline-mode)
(with-eval-after-load 'doom-modeline
  (setq doom-modeline-height 32)
  (setq doom-modeline-bar-width 6)
  (setq doom-modeline-icon t)
  (setq doom-modeline-minor-modes t))

(require-package 'minions)
(add-hook 'after-init-hook 'minions-mode)

(require-package 'solaire-mode)
(add-hook 'after-init-hook 'solaire-global-mode)

(require-package 'hide-mode-line)
(add-hook 'dired-mode-hook 'hide-mode-line-mode)

(require-package 'centaur-tabs)
(add-hook 'after-init-hook 'centaur-tabs-mode)
(with-eval-after-load 'centaur-tabs
  (setq centaur-tabs-style "bar")
  (setq centaur-tabs-height 32)
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-set-bar 'over)
  (setq centaur-tabs-icon-type 'nerd-icons))
(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "g t") 'centaur-tabs-forward)
  (define-key evil-normal-state-map (kbd "g T") 'centaur-tabs-backward))

(require-package 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(add-hook 'emacs-lisp-mode-hook (lambda () (highlight-indent-guides-mode -1)))
(with-eval-after-load 'highlight-indent-guides
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-auto-enabled 'nil)
  (set-face-background 'highlight-indent-guides-odd-face "#313244")
  (set-face-background 'highlight-indent-guides-even-face "#585b70")
  (set-face-foreground 'highlight-indent-guides-character-face "#7f849c"))

(require-package 'nerd-icons-ibuffer)
(add-hook 'ibuffer-mode-hook 'nerd-icons-ibuffer-mode)

(require-package 'nerd-icons-dired)
(add-hook 'dired-mode-hook 'nerd-icons-dired-mode)

(require-package 'diredfl)
(add-hook 'dired-mode-hook 'diredfl-mode)

(require-package 'winum)
(add-hook 'after-init-hook 'winum-mode)

(provide 'init-ui)
;;; init-ui.el ends here
