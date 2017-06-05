(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-linum-mode 1)
(setq column-number-mode t)
(setq inhibit-startup-message t)

(windmove-default-keybindings)

;; put the backups somewhere else
(setq backup-directory-alist `(("." . "~/.saves")))
;; keep entire copies
(setq backup-by-copying t)
;; more backups
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(require 'ido)
(ido-mode t)

;; mode for terraform/grunt
(add-to-list 'auto-mode-alist '(".tf" . hcl-mode))
(add-to-list 'auto-mode-alist '(".tfvars" . hcl-mode))

(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 '(package-selected-packages
   (quote
    (ag projectile ensime magit yaml-mode hcl-mode zenburn-theme))))
(custom-set-faces)

(load-theme 'zenburn t)

(global-set-key (kbd "C-x g") 'magit-status)

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(projectile-global-mode)

(add-to-list 'load-path "~/.emacs.d/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(setq ag-highlight-search t)

(if (eq system-type 'darwin)
  (setq ag-executable "/usr/local/bin/ag"))

(if (eq system-type 'gnu/linux)
  (set-face-attribute 'default nil :height 100)
  (setq ensime-sbt-command "/usr/bin/sbt")
  (setq sbt:program-name "/usr/bin/sbt"))
