(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes
   (quote
    ("d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (solarized-theme rainbow-delimiters ace-jump-mode cargo toml-mode flycheck-perl6 perl6-mode flycheck-rust racer rust-mode company))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; rustfmt on save
(setq rust-format-on-save t)

;; C-y, C-w, M-w work with OS clipboard
(setq x-select-enable-clipboard t)

;; rust autocomplete stuff
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(require 'rust-mode)
(define-key rust-mode-map (kbd "<C-tab>") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

;; utf-8... probably not needed
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; linter
(global-flycheck-mode)
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; highlight matching brackets
(show-paren-mode 1)

;; cargo mode, M-x cargo-...
(add-hook 'rust-mode-hook 'cargo-minor-mode)

;; ace jump mode major function
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;; rainbow delims in programming files
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; colunm numbers
(column-number-mode)

;; c style
(setq c-default-style "stroustrup"
      c-basic-offset 4)

;; default tab width
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)

;; window resizing
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
