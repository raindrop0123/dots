;;; init-lang.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'lua-mode)
(with-eval-after-load 'lua-mode
  (setq lua-indent-level 2)
  (setq lua-indent-nested-block-content-align nil)
  (setq lua-indent-close-paren-align nil))

(require-package 'csv-mode)
(require-package 'markdown-mode)
(require-package 'json-mode)
(require-package 'yaml-mode)
(require-package 'toml-mode)

(provide 'init-lang)
;;; init-lang.el ends here
