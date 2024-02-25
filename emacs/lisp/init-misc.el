;;; init-misc.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require-package 'which-key)
(run-with-idle-timer 2 nil #'which-key-mode)

(require-package 'gcmh)
(run-with-idle-timer 2 nil #'gcmh-mode)

(require-package 'xclip)
(run-with-idle-timer 2 nil #'xclip-mode)

(provide 'init-misc)
;;; init-misc.el ends here
