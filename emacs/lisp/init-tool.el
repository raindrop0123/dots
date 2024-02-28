;;; init-tool.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require-package 'rg)
(require-package 'wgrep)
(global-set-key (kbd "M-g r") 'rg)

(require-package 'ace-window)
(global-set-key [remap other-window] 'ace-window)
(with-eval-after-load 'ace-window
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(require-package 'winum)
(run-with-idle-timer 2 nil #'winum-mode)
(with-eval-after-load 'winum
  (setq winum-format "[%s]")
  (setq winum-mode-line-position 0))

(require-package 'yasnippet)
(require-package 'yasnippet-snippets)
(add-hook 'prog-mode-hook #'yas-global-mode)

(require-package 'helpful)
(global-set-key [remap describe-function] #'helpful-callable)
(global-set-key [remap describe-variable] #'helpful-variable)
(global-set-key [remap describe-key] #'helpful-key)
(global-set-key [remap describe-command] #'helpful-command)

(require-package 'gcmh)
(run-with-idle-timer 2 nil #'gcmh-mode)

(require-package 'xclip)
(run-with-idle-timer 2 nil #'xclip-mode)

(provide 'init-tool)
;;; init-tool.el ends here
