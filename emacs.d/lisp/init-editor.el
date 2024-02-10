;;; init-editor.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require-package 'rainbow-mode)
(add-hook 'prog-mode-hook #'rainbow-mode)

(require-package 'symbol-overlay)
(add-hook 'prog-mode-hook #'symbol-overlay-mode)

(provide 'init-editor)
;;; init-editor.el ends here
