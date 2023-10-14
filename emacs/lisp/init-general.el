;;; init-general.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'general)
(require 'general)

(general-create-definer space-leader-def
  :prefix "SPC"
  :keymaps 'override
  :states '(normal visual))

(general-create-definer comma-leader-def
  :prefix ","
  :keymaps 'override
  :states '(normal visual))

(space-leader-def
 "SPC" 'execute-extended-command
 "ff" 'find-file
 "fs" 'swiper-isearch
 "fw" 'counsel-rg
 "fc" 'load-theme
 "fb" 'counsel-ibuffer
 "fB" 'ibuffer
 "fs" 'save-buffer
 "fj" 'dired-jump
 "bk" 'kill-this-buffer
 "fm" 'counsel-flycheck
 "ww" 'ace-window
 "wd" 'delete-window
 "wD" 'delete-other-windows
 "L" 'avy-goto-line
 "W" 'avy-goto-word-0)

(comma-leader-def
 "," 'execute-extended-command)

(provide 'init-general)
;;; init-general.el ends here
