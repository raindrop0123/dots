;;; init-evil.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

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
  (setq evil-normal-state-cursor '(box "#ffffff"))
  (setq evil-insert-state-cursor '(bar "#ffffff"))
  (setq evil-visual-state-cursor '(hollow "#ffffff")))

(require-package 'evil-escape)
(add-hook 'evil-mode-hook 'evil-escape-mode)
(with-eval-after-load 'evil-escape
  (setq evil-escape-key-sequence "jk")
  (setq evil-escape-delay 0.2))

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

(provide 'init-evil)
;;; init-evil.el ends here
