;;; init-general.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'general)
(general-evil-setup t)

(general-create-definer leader-key
  :prefix "SPC"
  :keymaps 'override
  :states '(normal visual))

(general-create-definer local-leader-key
  :prefix ","
  :keymaps 'override
  :states '(normal visual))

(leader-key
  "SPC" 'execute-extended-command
  "E" 'eval-last-sexp
  "dw" 'delete-other-windows
  "dW" 'delete-window
  "bk" 'kill-this-buffer
  "fj" 'dired-jump
  "fl" 'load-file
  "fs" 'save-buffer
  "ff" 'find-file
  "w" 'ace-window
  "fb" 'consult-buffer
  "fc" 'consult-theme
  "fo" 'consult-outline
  "fi" 'consult-imenu
  "fw" 'consult-ripgrep
  "gl" 'avy-goto-line
  "gw" 'avy-goto-word-0
  "/" 'evilnc-comment-or-uncomment-lines)

(provide 'init-general)
;;; init-general.el ends here
