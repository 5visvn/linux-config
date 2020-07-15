;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
								 ("melpa" . "http://elpa.emacs-china.org/melpa/")))

;; packages not in elpa
(add-to-list 'load-path (expand-file-name "~/elisp/aweshell"))
(add-to-list 'load-path (expand-file-name "~/elisp/nox"))
;; exec path of some programe not installed in /usr/local/bin
;; (add-to-list 'exec-path (expand-file-name "~/tools/xxx/bin"))

;;; package list
(defvar installed-packages '(
			     winum
			     bbyac
			     monokai-theme
			     swiper
			     treemacs
			     which-key
			     rime
			     undo-fu
			     undo-fu-session
			     hungry-delete
			     ivy
			     nox
			     aweshell
			     yasnippet
			     counsel
			     ))

;; TODO auto update packages
;; TODO auto update installed-packages list when a new is installed manually



;; key-bindings for editing
(require 'hungry-delete)
(global-set-key (kbd "C-h") 'hungry-delete-backward)
(global-set-key (kbd "C-d") 'hungry-delete-forward)
(global-set-key (kbd "M-k") 'kill-whole-line)
(require 'bbyac)
(global-set-key (kbd "M-/") 'bbyac-expand-symbols)
(global-set-key (kbd "M-l") 'bbyac-expand-lines)
;; TODO newline without break current line
;; (global-set-key (kbd "C-<return>") 'newline)


;;;;;------------------------------ Keybindings----------------------------
;; key-bindings for jumping
(require 'avy)
(global-set-key (kbd "C-'") 'avy-goto-line)
(global-set-key (kbd "M-'") 'avy-goto-char)
(require 'nox)
(dolist (hook (list
               ;; 'js-mode-hook
               ;; 'rust-mode-hook
               ;; 'python-mode-hook
               ;; 'ruby-mode-hook
               ;; 'java-mode-hook
               ;; 'sh-mode-hook
               ;; 'php-mode-hook
               'c-mode-common-hook
               'c-mode-hook
               ;; 'csharp-mode-hook
               'c++-mode-hook
               ;; 'haskell-mode-hook
               ))
  (add-hook hook '(lambda () (nox-ensure))))
;; (require 'better-jumper)
(global-set-key (kbd "C-.") 'xref-find-references)


;; key-bindings for search
(require 'swiper)
(global-set-key (kbd "C-s") 'swiper-isearch-thing-at-point)

;; key-bindings for file
(global-set-key (kbd "M-c") 'switch-to-buffer)
(global-set-key (kbd "M-p") 'previous-buffer)
(global-set-key (kbd "M-n") 'next-buffer)

;; key-bindings for window
(require 'winum)
(global-set-key (kbd "M-1") 'winum-select-window-1)
(global-set-key (kbd "M-2") 'winum-select-window-2)
(global-set-key (kbd "M-3") 'winum-select-window-3)
(global-set-key (kbd "M-4") 'winum-select-window-4)
(global-set-key (kbd "M-0") 'treemacs-select-window)
(global-set-key (kbd "C-x C-o") 'other-window)

;; key-bindings for buffers
(global-set-key (kbd "C-r") 'ivy-resume)


;;;;;------------------------------ UI ----------------------------

;; Disable startup screen
(setq inhibit-splash-screen 1)
;; TODO: switch to recently buffer on startup

;; no need to reply "yes/no"
(fset 'yes-or-no-p 'y-or-n-p)

;; set cursor to bar not block
(setq-default cursor-type 'bar)

;; disable ring bell noise
(setq ring-bell-function 'ignore)
(setq visible-bell  t)

;; minibuffer resize
(ivy-mode t)
(setq resize-mini-windows t)
(setq max-mini-window-height 4)

;; display time
(display-time-mode 1)

(scroll-bar-mode -1)
(setq show-trailing-whitespace t)
(setq indent-tabs-mode nil)
(setq default-tab-width 3)
(setq tab-width 3)
(setq c-default-style "ellemtel" c-basic-offset 3)
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq make-backup-files nil)
(setq mark-ring-max 100)

;; auto highlight
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode 1)



;; auto revert when file changed in disk
(global-auto-revert-mode 1)


;;(add-hook 'minibuffer-setup-hook
			 ;;(lambda () (setq truncate-lines nil)))


;;; org-mode customize
(setq org-image-actual-width nil)


;; scroll
(setq scroll-step 1
		scroll-margin 0
		scroll-conservatively 10000)

;; auto add pair () {} [] ...
;; (electric-pair-mode t)


;;;; company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(global-company-mode t)
(setq company-idle-delay 0.1
   company-minimum-prefix-length 2
   company-require-match nil
   company-dabbrev-ignore-case t
   company-show-numbers t
   company-auto-complete t
   )

(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous-or-abort)

;; counsel
;; (require 'counsel)
;; (counsel-mode t)


;; eshell
(require 'aweshell)

;; save
(require 'save-visited-files)
(save-visited-files-mode t)
(require 'saveplace)
(save-place-mode t)


;; (global-display-line-numbers-mode t)

;; which-key
;; set which key delay
(require 'which-key)
(setq which-key-idle-delay 2.0)
(which-key-mode 1)

;; delete trailing whitespace on save only changed lines
(require 'ws-butler)
(ws-butler-global-mode 1)


;; coding




;; pdumper
;; should dump after packages loaded
;; require emacs version >= 27.0


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(blink-cursor-mode t)
 '(compilation-message-face 'default)
 '(custom-enabled-themes '(monokai))
 '(custom-safe-themes
   '("f3ab34b145c3b2a0f3a570ddff8fabb92dafc7679ac19444c31058ac305275e1" default))
 '(delete-trailing-lines t)
 '(fci-rule-color "#3C3D37")
 '(global-mark-ring-max 100)
 '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   '(("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100)))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   '(auto-highlight-symbol counsel yasnippet ivy-avy hungry-delete eshell-up save-visited-files swiper org-pretty-tags org-roam undo-fu-session undo-fu treemacs bbyac winum ws-butler rime monokai-theme which-key company))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
 '(which-key-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 136 :width normal :foundry "outline" :family "Source Code Pro")))))
