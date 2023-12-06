;;; init-general.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'general)
(require 'general)

(general-create-definer space-leader-def
  :prefix "SPC"
  :keymaps 'override
  :states '(normal visual))

(space-leader-def
  "SPC" 'execute-extended-command
  "ff" 'find-file
  "fb" 'ibuffer
  "fc" 'load-theme
  "bk" 'kill-this-buffer
  "fj" 'dired-jump
  "tt" 'eshell
  "wd" 'delete-other-windows
  "wD" 'delete-window
  ;; ace-window
  "ww" 'ace-window
  ;; avy
  "W" 'avy-goto-word-0
  "L" 'avy-goto-line
  ;; consult
  "fw" 'consult-ripgrep
  "fs" 'consult-line
  "fm" 'consult-flycheck
  "fo" 'consult-outline)

(provide 'init-general)
;;; init-general.el ends here
