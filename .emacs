(setq custom-file "~/.config/emacs/emacs.custom.el")
(load custom-file t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)

(global-display-line-numbers-mode 1)

(ido-mode 1)

(set-frame-font "Iosevka-14" nil t)

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
