;;; init-base.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; modus-themes.el
(add-hook 'after-init-hook (lambda () (load-theme 'modus-vivendi t)))

;; flymake.el
(add-hook 'prog-mode-hook 'flymake-mode)

;; package.el
(package-initialize)
(setq package-quickstart t)
(setq package-enable-at-startup nil)
(setq
 package-archives
 '(;; ("nongnu" . "https://elpa.nongnu.org/nongnu/")
   ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
   ;; ("elpa-devel" . "https://elpa.gnu.org/devel/")
   ;; ("org" . "https://orgmode.org/elpa/")
   ;; ("marmalade" . "http://marmalade-repo.org/packages/")
   ;; ("jcs-elpa" . "https://jcs-emacs.github.io/jcs-elpa/packages/")
   ;; ("redguardtoo" . "https://raw.githubusercontent.com/redguardtoo/myelpa/master/")
   ("gnu" . "https://elpa.gnu.org/packages/")
   ("melpa" . "https://melpa.org/packages/")))

(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE with MIN-VERSION.
If NO-REFRESH is nil, `package-refresh-contents' is called."
  (unless (featurep 'package)
    (condition-case nil
        (require 'package)
      (error nil)))
  (unless (package-installed-p package min-version)
    (unless (or (assoc package package-archive-contents) no-refresh)
      (message "Missing package: %s" package)
      (package-refresh-contents))
    (package-install package)))

;; C source code
(setq use-short-answers t)
(add-hook 'minibuffer-setup-hook (lambda () (setq gc-cons-threshold most-positive-fixnum)))
(add-hook 'minibuffer-exit-hook (lambda () (setq gc-cons-threshold 800000)))

;; simple.el
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(add-hook 'prog-mode-hook #'size-indication-mode)
(add-hook 'prog-mode-hook #'line-number-mode)
(add-hook 'prog-mode-hook #'column-number-mode)
(add-hook 'prog-mode-hook #'auto-save-mode)

;; so-long.el
(add-hook 'prog-mode-hook #'global-so-long-mode)

;; loaddefs.el
(add-hook 'after-init-hook #'global-tab-line-mode)

;; autorevert.el
(add-hook 'prog-mode-hook #'global-auto-revert-mode)

;; hl-line.el
(add-hook 'prog-mode-hook #'global-hl-line-mode)

;; display-line-numbers.el
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; display-fill-column-indicator.el
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; paren.el
(add-hook 'prog-mode-hook #'show-paren-mode)

;; elec-pair
(add-hook 'prog-mode-hook #'electric-pair-mode)

;; ibuffer.el
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; treesit.el
(when (and (fboundp 'treesit-available-p) (treesit-available-p))
  (run-with-idle-timer 2 nil (lambda () (require 'treesit))))
(with-eval-after-load 'treesit
  (setq treesit-language-source-alist
        '((bash . ("https://github.com/tree-sitter/tree-sitter-bash"))
          (c . ("https://github.com/tree-sitter/tree-sitter-c"))
          (cpp . ("https://github.com/tree-sitter/tree-sitter-cpp"))
          (css . ("https://github.com/tree-sitter/tree-sitter-css"))
          (cmake . ("https://github.com/uyha/tree-sitter-cmake"))
          (csharp . ("https://github.com/tree-sitter/tree-sitter-c-sharp.git"))
          (dockerfile . ("https://github.com/camdencheek/tree-sitter-dockerfile"))
          (elisp . ("https://github.com/Wilfred/tree-sitter-elisp"))
          (go . ("https://github.com/tree-sitter/tree-sitter-go"))
          (gomod . ("https://github.com/camdencheek/tree-sitter-go-mod.git"))
          (html . ("https://github.com/tree-sitter/tree-sitter-html"))
          (java . ("https://github.com/tree-sitter/tree-sitter-java.git"))
          (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"))
          (json . ("https://github.com/tree-sitter/tree-sitter-json"))
          (lua . ("https://github.com/Azganoth/tree-sitter-lua"))
          (make . ("https://github.com/alemuller/tree-sitter-make"))
          (markdown . ("https://github.com/MDeiml/tree-sitter-markdown" nil "tree-sitter-markdown/src"))
          (ocaml . ("https://github.com/tree-sitter/tree-sitter-ocaml" nil "ocaml/src"))
          (org . ("https://github.com/milisims/tree-sitter-org"))
          (python . ("https://github.com/tree-sitter/tree-sitter-python"))
          (php . ("https://github.com/tree-sitter/tree-sitter-php"))
          (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "typescript/src"))
          (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "tsx/src"))
          (ruby . ("https://github.com/tree-sitter/tree-sitter-ruby"))
          (rust . ("https://github.com/tree-sitter/tree-sitter-rust"))
          (sql . ("https://github.com/m-novikov/tree-sitter-sql"))
          (vue . ("https://github.com/merico-dev/tree-sitter-vue"))
          (yaml . ("https://github.com/ikatyang/tree-sitter-yaml"))
          (toml . ("https://github.com/tree-sitter/tree-sitter-toml"))
          (zig . ("https://github.com/GrayJack/tree-sitter-zig"))))
  (setq major-mode-remap-alist
        '((c-mode . c-ts-mode)
          (c++-mode . c++-ts-mode)
          (cmake-mode . cmake-ts-mode)
          (conf-toml-mode . toml-ts-mode)
          (css-mode . css-ts-mode)
          (js-mode . js-ts-mode)
          (js-json-mode . json-ts-mode)
          (python-mode . python-ts-mode)
          (sh-mode . bash-ts-mode)
          (typescript-mode . typescript-ts-mode)
          (rust-mode . rust-ts-mode)
          (java-mode . java-ts-mode))))

(provide 'init-base)
;;; init-base.el ends here
