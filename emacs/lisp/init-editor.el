;;; init-editor.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'rainbow-mode)
(add-hook 'prog-mode-hook #'rainbow-mode)

(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require-package 'symbol-overlay)
(run-with-idle-timer 2 nil #'symbol-overlay-mode)

(require-package 'which-key)
(run-with-idle-timer 2 nil #'which-key-mode)

(provide 'init-editor)
;;; init-editor.el ends here
