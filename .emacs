(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(split-window-horizontally)

(use-package gruber-darker-theme
  :ensure t)

(use-package avy
  :ensure t
  :init
  (progn
    (global-set-key (kbd "M-g w") 'avy-goto-word-1)))

(use-package hl-todo
  :ensure t
  :init
  (progn
    (global-hl-todo-mode 1)
    (setq hl-todo-keyword-faces
          '(("TODO"   . "#FF00FF")
            ("FIXME"  . "#FF0000")
            ("DEBUG"  . "#A020F0")
            ("NOTE"   . "#00FF00")))
    (keymap-set hl-todo-mode-map "C-c p" #'hl-todo-previous)
    (keymap-set hl-todo-mode-map "C-c n" #'hl-todo-next)
    (keymap-set hl-todo-mode-map "C-c o" #'hl-todo-occur)
    (keymap-set hl-todo-mode-map "C-c i" #'hl-todo-insert)))

(use-package magit
  :ensure t
  :config
  (with-eval-after-load 'magit-mode
    (add-hook 'after-save-hook 'magit-after-save-refresh-status t)))

(use-package smex
  :ensure t)

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package org-bullets
  :ensure t
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)))

(use-package multiple-cursors
  :ensure t
  :init
  (progn
    (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
    (global-set-key (kbd "C->")         'mc/mark-next-like-this)
    (global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
    (global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
    (global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
    (global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)))

(use-package expand-region
  :ensure t
  :init (global-set-key (kbd "C-=") 'er/expand-region))

;; ido
(setq ido-enable-flex-matching t)

(ido-mode 1)
(ido-everywhere 1)

(use-package ido-completing-read+
  :ensure t
  :config (ido-ubiquitous-mode 1))

(add-to-list 'load-path "~/.emacs.local/")

(require 'no-easy-keys)
(no-easy-keys 1)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)

(global-display-line-numbers-mode 1)

(setq custom-file "~/.config/emacs/emacs.custom.el")
(load custom-file t)

(set-frame-font "Iosevka-12" nil t)

;; default coding style
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default standard-indent 4)
(setq-default c-basic-offset 4)

(electric-indent-mode 1)

;; coding style for C
(defun linux-kernel-coding-style ()
  (c-set-style "linux")
  (setq-local indent-tabs-mode t)
  (setq-local tab-width 8)
  (setq-local c-basic-offset 8))

(add-hook 'c-mode-hook #'linux-kernel-coding-style)

(setq backup-directory-alist
      '(("." . "~/.config/emacs/backups/")))

(setq auto-save-file-name-transforms
      `((".*" "~/.config/emacs/autosaves/" t)))

(setq create-lockfiles nil)
