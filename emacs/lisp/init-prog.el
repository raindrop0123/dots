;;; init-prog.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require-package 'symbol-overlay)
(add-hook 'prog-mode-hook 'symbol-overlay-mode)

(require-package 'flycheck)
(add-hook 'prog-mode-hook 'global-flycheck-mode)

(provide 'init-prog)
;;; init-prog.el ends here
