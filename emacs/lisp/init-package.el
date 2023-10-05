;;; init-package.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; [[ init-ui.el ]]
(require-package 'beacon)
(add-hook 'after-init-hook 'beacon-mode)
(with-eval-after-load 'beacon
  (setq beacon-size 60)
  (setq beacon-blink-duration 0.5))

(require-package 'doom-themes)
(require-package 'catppuccin-theme)
(add-hook
 'after-init-hook
 (lambda ()
   (load-theme 'catppuccin t)
   (catppuccin-set-color 'base "#11111b")
   (custom-set-faces '(default ((t (:background "#11111b" :foreground "#cdd6f4")))))
   (custom-set-faces '(mode-line ((t (:background "#11111b" :foreground "#cdd6f4" :weight bold)))))
   (custom-set-faces '(font-lock-comment-face ((t (:foreground "#7f849c" :weight bold)))))
   (custom-set-faces '(line-number ((t (:background "#11111b" :foreground "#7f849c")))))
   (custom-set-faces '(line-number-current-line ((t (:background "#11111b" :foreground "#a6e3a1" :weight bold)))))
   (custom-set-faces '(company-tooltip ((t (:background "#1e1e2e" :foreground "#cdd6f4")))))
   (custom-set-faces '(company-tooltip-scrollbar-thumb ((t (:background "#6c7086")))))
   (custom-set-faces '(company-tooltip-scrollbar-track ((t (:background "#1e1e2e")))))))

(require-package 'solaire-mode)
(add-hook 'after-init-hook 'solaire-global-mode)

(require-package 'hide-mode-line)
(add-hook 'treemacs-mode-hook 'hide-mode-line-mode)

(require-package 'doom-modeline)
(add-hook 'after-init-hook 'doom-modeline-mode)
(with-eval-after-load 'doom-modeline
  (setq doom-modeline-height 32)
  (setq doom-modeline-minor-modes t))

(require-package 'minions)
(add-hook 'doom-modeline-mode-hook 'minions-mode)

(require-package 'centaur-tabs)
(add-hook 'after-init-hook 'centaur-tabs-mode)
(with-eval-after-load 'centaur-tabs
  (setq centaur-tabs-style "bar")
  (setq centaur-tabs-height 32)
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-set-bar 'left)
  (setq centaur-tabs-icon-type 'nerd-icons))
(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "g t") 'centaur-tabs-forward)
  (define-key evil-normal-state-map (kbd "g T") 'centaur-tabs-backward))

;; [[ init-minibuffer.el ]]
(require-package 'vertico)
(add-hook 'after-init-hook 'vertico-mode)
(with-eval-after-load 'vertico
  (setq vertico-scroll-margin 0)
  (setq vertico-count 16)
  (setq vertico-resize t)
  (setq vertico-cycle t))

(require-package 'nerd-icons-completion)
(add-hook 'vertico-mode-hook 'nerd-icons-completion-mode)

(require-package 'orderless)
(setq completion-styles '(orderless basic))
(setq completion-category-defaults nil)
(setq completion-category-overrides '((file (styles partial-completion))))

(require-package 'consult)
(require-package 'consult-flycheck)
(global-set-key [remap switch-to-buffer] 'consult-buffer)
(global-set-key (kbd "M-g r") 'consult-ripgrep)
(global-set-key (kbd "C-s") 'consult-line)

(require-package 'marginalia)
(add-hook 'vertico-mode-hook 'marginalia-mode)

(require-package 'embark)
(require-package 'embark-consult)
(require-package 'wgrep)
(define-key minibuffer-local-map (kbd "C-c C-a") 'embark-act)
(define-key minibuffer-local-map (kbd "C-c C-c") 'embark-collect)
(add-hook 'embark-collect-mode-hook 'consult-preview-at-point-mode)

;; [[ init-evil.el ]]
;; @REF: https://github.com/emacs-china/Spacemacs-rocks
;; @REF: https://github.com/noctuid/evil-guide
;; @REF: https://github.com/redguardtoo/emacs.d/blob/master/lisp/init-evil.el#L857
;; @REF: https://emacs.stackexchange.com/questions/23858/spacemacs-disable-q
;; @REF: https://www.reddit.com/r/spacemacs/comments/6p3w0l/making_q_not_kill_emacs/
;; @REF: https://github.com/Malabarba/smart-mode-line/issues/195#issuecomment-338447042
;; @REF: https://evil.readthedocs.io/en/latest/settings.html
;; @REF: https://stackoverflow.com/questions/75030400/using-evil-mode-in-dired-or-disable-evil-mode-in-dired
;; @REF: https://emacs.stackexchange.com/questions/19024/move-evil-tag-to-beginning-of-mode-line
;; @REF: https://github.com/lujun9972/emacs-document/blob/master/advertisement/%E6%89%8B%E6%8A%8A%E6%89%8B%E6%95%99%E4%BD%A0%E4%BB%8EVim%E8%BF%81%E7%A7%BB%E5%88%B0Emacs+Evil.org
(require-package 'evil)
(setq evil-want-integration t)
(setq evil-want-keybinding nil)
(add-hook 'after-init-hook 'evil-mode)
(with-eval-after-load 'evil
  (evil-ex-define-cmd "q" 'kill-this-buffer)
  (evil-ex-define-cmd "qq" 'kill-emacs)
  (evil-ex-define-cmd "wq" (lambda () (interactive) (save-buffer) (kill-this-buffer)))
  (setq evil-normal-state-cursor '(box "#f2cdcd"))
  (setq evil-insert-state-cursor '(bar "#f2cdcd"))
  (setq evil-visual-state-cursor '(hollow "#f2cdcd")))

(require-package 'evil-escape)
(add-hook 'evil-mode-hook 'evil-escape-mode)
(with-eval-after-load 'evil-escape
  (setq evil-escape-key-sequence "jk")
  (setq evil-escape-delay 0.2))

(require-package 'evil-anzu)
(add-hook 'evil-mode-hook 'global-anzu-mode)

(require-package 'evil-goggles)
(add-hook 'evil-mode-hook 'evil-goggles-mode)

(require-package 'evil-collection)
(add-hook 'evil-mode-hook 'evil-collection-init)

(require-package 'evil-matchit)
(add-hook 'evil-mode-hook 'global-evil-matchit-mode)

(require-package 'evil-nerd-commenter)
(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map "gcc" 'evilnc-comment-or-uncomment-lines)
  (define-key evil-visual-state-map "gc" 'evilnc-comment-or-uncomment-lines))

;; [[ init-company.el ]]
(require-package 'company)
(add-hook 'prog-mode-hook 'global-company-mode)
(with-eval-after-load 'company
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers t)
  (setq company-tooltip-align-annotations t)
  (setq company-format-margin-function 'company-vscode-dark-icons-margin)
  (setq company-global-modes '(not eshell-mode shell-mode minibuffer-inactive-mode message-mode)))

(require-package 'company-quickhelp)
(when (window-system)
  (add-hook 'company-mode-hook 'company-quickhelp-mode))
(with-eval-after-load 'company-quickhelp
  (custom-set-variables
   '(company-quickhelp-color-background "#1e1e2e")
   '(company-quickhelp-color-foreground "#cdd6f4")))

;; [[ init-tool.el ]]
(require-package 'diredfl)
(add-hook 'dired-mode-hook 'diredfl-mode)

(require-package 'nerd-icons-dired)
(add-hook 'dired-mode-hook 'nerd-icons-dired-mode)

(require-package 'nerd-icons-ibuffer)
(add-hook 'ibuffer-mode-hook 'nerd-icons-ibuffer-mode)

(require-package 'treemacs)
(require-package 'treemacs-evil)
(require-package 'treemacs-nerd-icons)
(global-set-key [f1] 'treemacs)
(with-eval-after-load 'treemacs
  (require 'treemacs-evil)
  (require 'treemacs-nerd-icons)
  (treemacs-load-theme "nerd-icons"))

(require-package 'undo-tree)
(require-package 'olivetti)

;; [[ init-window.el ]]
(require-package 'winum)
(add-hook 'after-init-hook 'winum-mode)

(require-package 'ace-window)
(global-set-key [remap other-window] 'ace-window)
(global-set-key (kbd "M-o") 'ace-window)
(with-eval-after-load 'ace-window
  (setq aw-background t)
  (setq aw-char-position 'top-left)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (custom-set-faces '(aw-leading-char-face ((t (:foreground "#ff0000" :height 500))))))

;; [[ init-misc.el ]]
(require-package 'gcmh)
(add-hook 'after-init-hook 'gcmh-mode)

(require-package 'xclip)
(add-hook 'after-init-hook 'xclip-mode)

(require-package 'sudo-edit)
(require-package 'esup)

(require-package 'which-key)
(add-hook 'after-init-hook 'which-key-mode)
(with-eval-after-load 'which-key
  (setq which-key-idle-delay 1))

;; [[ init-prog.el ]]
(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require-package 'symbol-overlay)
(add-hook 'prog-mode-hook 'symbol-overlay-mode)

(require-package 'flycheck)
(add-hook 'prog-mode-hook 'global-flycheck-mode)

(require-package 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(add-hook 'emacs-lisp-mode-hook (lambda () (highlight-indent-guides-mode -1)))
(with-eval-after-load 'highlight-indent-guides
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-responsive 'top)
  (setq highlight-indent-guides-auto-enabled nil)
  (custom-set-faces '(highlight-indent-guides-character-face ((t (:foreground "#cdd6f4"))))))

(require-package 'lua-mode)
(with-eval-after-load 'lua-mode
  (setq lua-indent-level 2)
  (setq lua-indent-nested-block-content-align nil)
  (setq lua-indent-close-paren-align nil))

(require-package 'dumb-jump)
(require-package 'markdown-mode)
(require-package 'json-mode)
(require-package 'yaml-mode)
(require-package 'rainbow-mode)
(require-package 'lsp-mode)
(require-package 'lsp-ui)
(require-package 'lsp-treemacs)

;; [[ init-yasnippet.el ]]
(require-package 'yasnippet)
(require-package 'yasnippet-snippets)
(add-hook 'prog-mode-hook 'yas-minor-mode)

;; [[ init-general.el ]]
(require-package 'general)
(run-with-idle-timer 2 nil (lambda () (require 'general)))
(with-eval-after-load 'general
  (general-create-definer space-leader-def
    :prefix "SPC"
    :keymaps 'override
    :states '(normal visual))
  (space-leader-def
    "SPC" 'execute-extended-command
    "ff" 'find-file
    "fb" 'ibuffer
    "fj" 'dired-jump
    "fB" 'consult-buffer
    "fw" 'consult-ripgrep 
    "fo" 'consult-outline
    "fi" 'consult-imenu
    "fe" 'consult-flycheck
    "pn" 'treemacs
    "ww" 'ace-window
    "wd" 'delete-other-windows
    "wD" 'delete-window
    )
  )

(provide 'init-package)
;;; init-package.el ends here
