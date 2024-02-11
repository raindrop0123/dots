;;; init-core.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; C source code
(setq-default scroll-step 1)
(setq-default scroll-conservatively 10000)
(setq-default auto-window-vscroll nil)
(setq-default bidi-display-reordering nil)
(defun maximize-gc-limit () (setq gc-cons-threshold most-positive-fixnum))
(defun reset-gc-limit () (setq gc-cons-threshold 800000))
(add-hook 'minibuffer-setup-hook #'maximize-gc-limit)
(add-hook 'minibuffer-exit-hook #'reset-gc-limit)

;; modus-themes.el
(add-hook 'after-init-hook #'(lambda () (load-theme 'modus-vivendi t)))

;; subr.el
(global-unset-key (kbd "C-x C-c"))

;; package.el
(package-initialize)
(setq package-quickstart t)
(setq package-check-signature nil)
(setq package-enable-at-startup nil)
(setq package-archives
      '(;; ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ;; ("elpa-devel" . "https://elpa.gnu.org/devel/")
        ;; ("org" . "https://orgmode.org/elpa/")
        ;; ("marmalade" . "http://marmalade-repo.org/packages/")
        ;; ("jcs-elpa" . "https://jcs-emacs.github.io/jcs-elpa/packages/")
        ;; ("redguardtoo" . "https://raw.githubusercontent.com/redguardtoo/myelpa/master/")
        ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(defun require-package (package &optional min-version no-refresh)
  (unless (featurep 'package)
    (condition-case nil
        (require 'package)
      (error nil)))
  (unless (package-installed-p package min-version)
    (unless (or (assoc package package-archive-contents) no-refresh)
      (message "Missing package: %s" package)
      (package-refresh-contents))
    (package-install package)))

;; simple.el
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(add-hook 'prog-mode-hook #'size-indication-mode)
(add-hook 'prog-mode-hook #'line-number-mode)
(add-hook 'prog-mode-hook #'column-number-mode)
(add-hook 'prog-mode-hook #'auto-save-mode)

;; so-long.el
(add-hook 'prog-mode-hook #'global-so-long-mode)

;; autorevert.el
(add-hook 'prog-mode-hook #'global-auto-revert-mode)

;; hl-line.el
(add-hook 'prog-mode-hook #'global-hl-line-mode)

;; display-line-numbers.el
(setq display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; display-fill-column-indicator.el
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; paren.el
(add-hook 'prog-mode-hook #'show-paren-mode)

;; elec-pair
(add-hook 'prog-mode-hook #'electric-pair-mode)

;; loaddefs.el
(add-hook 'prog-mode-hook #'save-place-mode)

;; flymake.el
(add-hook 'prog-mode-hook #'flymake-mode)

;; ibuffer.el
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; treesit.el
;; M-x `treesit-install-language-grammar' to install language grammer
(require 'treesit)
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
          (elixir "https://github.com/elixir-lang/tree-sitter-elixir" "main" "src" nil nil)
          (go . ("https://github.com/tree-sitter/tree-sitter-go"))
          (gomod . ("https://github.com/camdencheek/tree-sitter-go-mod.git"))
          (haskell "https://github.com/tree-sitter/tree-sitter-haskell" "master" "src" nil nil)
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
          (scala "https://github.com/tree-sitter/tree-sitter-scala" "master" "src" nil nil)
          (toml "https://github.com/tree-sitter/tree-sitter-toml" "master" "src" nil nil)
          (vue . ("https://github.com/merico-dev/tree-sitter-vue"))
          (kotlin . ("https://github.com/fwcd/tree-sitter-kotlin"))
          (yaml . ("https://github.com/ikatyang/tree-sitter-yaml"))
          (zig . ("https://github.com/GrayJack/tree-sitter-zig")))))

(provide 'init-core)
;;; init-core.el ends here
