;;; init-package.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'vertico)
(add-hook 'after-init-hook 'vertico-mode)
(with-eval-after-load 'vertico
  (setq-default vertico-scroll-margin 0)
  (setq-default vertico-count 16)
  (setq-default vertico-resize t)
  (setq-default vertico-cycle t))

(require-package 'orderless)
(setq completion-styles '(orderless basic))
(setq completion-category-defaults nil)
(setq completion-category-overrides '((file (styles partial-completion))))

(require-package 'consult)
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
(setq-default evil-want-integration t)
(setq-default evil-want-keybinding nil)
(add-hook 'after-init-hook 'evil-mode)
(with-eval-after-load 'evil
  (evil-ex-define-cmd "q" 'kill-this-buffer)
  (evil-ex-define-cmd "qq" 'kill-emacs)
  (evil-ex-define-cmd "wq" (lambda () (interactive) (save-buffer) (kill-this-buffer))))

(require-package 'evil-escape)
(add-hook 'evil-mode-hook 'evil-escape-mode)
(with-eval-after-load 'evil-escape
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.2))

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

(require-package 'company)
(add-hook 'prog-mode-hook 'global-company-mode)
(with-eval-after-load 'company
  (setq-default company-idle-delay 0.1)
  (setq-default company-minimum-prefix-length 1)
  (setq-default company-show-numbers t)
  (setq-default company-tooltip-align-annotations t)
  (setq-default company-global-modes
                '(not eshell-mode shell-mode minibuffer-inactive-mode message-mode)))

(require-package 'xclip)
(add-hook 'after-init-hook 'xclip-mode)

(require-package 'which-key)
(add-hook 'after-init-hook 'which-key-mode)
(with-eval-after-load 'which-key
  (setq-default which-key-idle-delay 1))

(require-package 'ace-window)
(global-set-key [remap other-window] 'ace-window)
(global-set-key (kbd "M-o") 'ace-window)
(with-eval-after-load 'ace-window
  (setq-default aw-background t)
  (setq-default aw-char-position 'top-left)
  (setq-default aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (custom-set-faces '(aw-leading-char-face ((t (:foreground "#ff0000" :height 500))))))

(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require-package 'symbol-overlay)
(add-hook 'prog-mode-hook 'symbol-overlay-mode)

(require-package 'sudo-edit)
(require-package 'magit)
(require-package 'esup)

(provide 'init-package)
;;; init-package.el ends here
