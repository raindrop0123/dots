;;; init-general.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'general)
(require 'general)

(general-create-definer space-leader-def
  :prefix "SPC"
  :keymape 'override
  :states '(normal visual))

(space-leader-def
 "SPC" 'execute-extended-command
 "ff" 'find-file
 "bf" 'ibuffer
 "/" 'evilnc-comment-or-uncomment-lines
 "gl" 'avy-goto-line
 "gw" 'avy-goto-word-0
 "fs" 'consult-line
 "fw" 'consult-ripgrep
 "fo" 'consult-outline
 "hf" 'helpful-callable
 "hv" 'helpful-variable
 "hk" 'helpful-key
 "hx" 'helpful-command)

(provide 'init-general)
;;; init-general.el ends here
