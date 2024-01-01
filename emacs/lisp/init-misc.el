;;; init-misc.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'which-key)
(add-hook 'after-init-hook 'which-key-mode)

(require-package 'diredfl)
(add-hook 'dired-mode-hook 'diredfl-mode)

(require-package 'avy)
(global-set-key (kbd "M-g w") 'avy-goto-word-0)
(global-set-key (kbd "M-g l") 'avy-goto-line)

(require-package 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (run-with-idle-timer 2 nil 'exec-path-from-shell-initialize))

(require-package 'gcmh)
(add-hook 'after-init-hook 'gcmh-mode)

(require-package 'xclip)
(add-hook 'after-init-hook 'xclip-mode)

(require-package 'esup)
(require-package 'sudo-edit)

(provide 'init-misc)
;;; init-misc.el ends here
