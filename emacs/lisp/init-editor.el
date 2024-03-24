;;; init-editor.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'which-key)
(run-with-idle-timer 2 nil #'which-key-mode)

(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require-package 'symbol-overlay)
(add-hook 'prog-mode-hook #'symbol-overlay-mode)

(provide 'init-editor)
;;; init-editor.el ends here
