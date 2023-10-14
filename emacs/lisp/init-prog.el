;;; init-prog.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require-package 'flycheck)
(add-hook 'prog-mode-hook 'global-flycheck-mode)

(require-package 'symbol-overlay)
(add-hook 'prog-mode-hook 'symbol-overlay-mode)

(require-package 'lsp-mode)
(require-package 'lsp-ui)

(require-package 'lua-mode)
(with-eval-after-load 'lua-mode
  (setq lua-indent-level 2)
  (setq lua-indent-nested-block-content-align nil)
  (setq lua-indent-close-paren-align nil))

(require-package 'yaml-mode)
(require-package 'json-mode)
(require-package 'csv-mode)
(require-package 'rainbow-mode)

(provide 'init-prog)
;;; init-prog.el ends here
