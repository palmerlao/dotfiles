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
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (projectile ensime magit yaml-mode hcl-mode zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'zenburn t)

(global-set-key (kbd "C-x g") 'magit-status)

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(projectile-global-mode)

(add-to-list 'load-path "~/.emacs.d/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
