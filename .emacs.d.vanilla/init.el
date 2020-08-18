;; (setq package-archives '(("gnu" 64/  . "http://elpa.emacs-china.org/gnu/")
;; 			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))
;; (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                          ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")
;; 			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
;; (add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/"))
(add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))


;; packages not in elpa
(add-to-list 'load-path (expand-file-name "~/elisp/nox"))
;; exec path of some programe not installed in /usr/local/bin
;; (add-to-list 'exec-path (expand-file-name "~/tools/xxx/bin"))

;; package list
(setq package-list '(ivy
;;		     ws-bulter
		     winum
		     org-pretty-tags
		     save-visited-files
		     eshell-up
		     company
		     treemacs
 		     bbyac
		     swiper
		     which-key
		     rime
		     projectile
		     undo-fu
		     use-package
		     undo-fu-session
		     hungry-delete
		     ivy-avy
		     avy
		     ;;;--- github
		     ;;nox
		     ;;;--- end of github
		     yasnippet
		     ;;;; cpp
		     with-editor
		     cuda-mode
		     imenu-list
		     demangle-mode
		     disaster
		     modern-cpp-font-lock
		     opencl-mode
		     ;;;; end of cpp
		     smex
		     git-timemachine
		     magit
		     counsel
		     auto-highlight-symbol
		     monokai-theme))

;; ; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))





;; theme
;; (require 'monokai-theme)
;; (load-theme 'monokai)


;;;;;------------------------------ Keybindings----------------------------

;; key-bindings for editing
(require 'hungry-delete)
(global-set-key (kbd "C-h") 'backward-delete-char-untabify)
(global-set-key (kbd "M-h") 'backward-kill-word)
;;(global-set-key (kbd "C-d") 'hungry-delete-forward)
(global-set-key (kbd "M-k") 'kill-whole-line)
(require 'bbyac)
(global-set-key (kbd "M-/") 'bbyac-expand-symbols)
(global-set-key (kbd "M-l") 'bbyac-expand-lines)
;; TODO newline without break current line
;; (global-set-key (kbd "C-<return>") 'newline)
(require 'undo-fu)
(global-set-key (kbd "C-u") 'undo-fu-only-redo)
(global-set-key (kbd "M-j") (lambda()
			      (interactive)
			      (end-of-line)
			      (newline-and-indent)))
(global-set-key (kbd "M-o") (lambda()
			      (interactive)
			      (beginning-of-line)
			      (open-line 1)))
(global-set-key (kbd "C-c l") 'comment-line)

;; key-bindings for jumping
(require 'avy)
(global-set-key (kbd "M-'") 'avy-goto-line)
(global-set-key (kbd "M-c") 'avy-goto-char)
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
(global-set-key (kbd "M-[ 1 ; 5 n") 'xref-find-references)
(global-set-key (kbd "M-s i") 'imenu)
(global-set-key (kbd "M-[ [") 'beginning-of-defun)
(global-set-key (kbd "M-] ]") 'end-of-defun)
(global-set-key (kbd "M-[ M-[") 'beginning-of-defun)
(global-set-key (kbd "M-] M-]") 'end-of-defun)
(global-set-key (kbd "C-z") 'hs-hide-block)
;; (require 'better-jumper)
;; (better-jumper-mode 1)
;; (global-set-key (kbd "M-n") 'better-jumper-jump-forward)
;; (global-set-key (kbd "M-p") 'better-jumper-jump-backward)


;; key-bindings for search
(require 'swiper)
(global-set-key (kbd "C-s") 'swiper-isearch-thing-at-point)
(global-set-key (kbd "M-s s") 'counsel-projectile-rg)
(global-set-key (kbd "M-s M-s") 'counsel-projectile-rg-thing-at-point)

;; key-bindings for file
(global-set-key (kbd "M-z") 'switch-to-buffer)
(global-set-key (kbd "C-c b") 'switch-to-buffer)
(global-set-key (kbd "C-c C-f") 'find-file)
(require 'projectile)
(global-set-key (kbd "M-p f") 'projectile--find-file)
(global-set-key (kbd "C-c p f") 'projectile--find-file)
(global-set-key (kbd "C-c p i") 'projectile-invalidate-cache)
;; (global-set-key (kbd "M-p") 'previous-buffer)
;; (global-set-key (kbd "M-n") 'next-buffer)
(global-set-key (kbd "M-g a") 'ff-get-other-file)
(global-set-key (kbd "M-g M-a") 'ff-get-other-file)
(global-set-key (kbd "M-g b") 'magit-blame)
(global-set-key (kbd "M-g t") 'git-timemachine)



;; key-bindings for window
(require 'winum)
(winum-mode)
(global-set-key (kbd "M-1") 'winum-select-window-1)
(global-set-key (kbd "M-2") 'winum-select-window-2)

(global-set-key (kbd "M-3") 'winum-select-window-3)
(global-set-key (kbd "M-4") 'winum-select-window-4)
(global-set-key (kbd "M-0") 'treemacs-select-window)
(global-set-key (kbd "C-x C-o") 'other-window)
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

;; scroll-bar
(scroll-bar-mode -1)

;; TODO: mode-line


(setq show-trailing-whitespace t)
(setq-default indent-tabs-mode nil)
(setq default-tab-width 3)
(setq tab-width 3)
(setq c-default-style "ellemtel" c-basic-offset 3)
(tool-bar-mode -1)
(menu-bar-mode -1)
;; show tabs and trailing whitespace
(setq whitespace-style '(face trailing tabs tab-mark))

(setq make-backup-files nil)
(setq mark-ring-max 100)


;; enable mouse in terminal
(xterm-mouse-mode)
;; mouse scroll with wsl-terminal
(global-set-key [mouse-4] (lambda ()
                            (interactive)
                            (scroll-down-line 6)
                            ))
(global-set-key [mouse-5] (lambda ()
                            (interactive)
                            (scroll-up-line 6)
                            ))
(global-set-key [C-mouse-4] (lambda ()
                            (interactive)
                            (scroll-down-line 15)
                            ))
(global-set-key [C-mouse-5] (lambda ()
                            (interactive)
                            (scroll-up-line 15)
                            ))


;; scroll ones line
(setq redisplay-dont-pause t
  scroll-margin 0
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; gnutls for emacs
;;(let ((gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")))

;; auto highlight
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)


(require 'nox)
(setq nox-python-server-dir "/home/zwxeiwu/tools/python-language-server/bin")
(setq nox-python-server "pyls")
;; add exec-path for running command
;; todo use home directory, home directory is quiet slow, maybe the reason is GOROOT
;; (add-to-list 'exec-path "/home/zwxeiwu/tools/go-language-server/bin")
(add-to-list 'exec-path "/tmp/zwxeiwu/sapc_go/bin")

(add-to-list 'nox-server-programs '((c++-mode c-mode) . ("clangd")))
;; (add-to-list 'nox-server-programs '((go-mode) . ("/home/zwxeiwu/tools/go-language-server/bin/gopls")))
(dolist (hook (list
               ;; 'js-mode-hook
               ;; 'python-mode-hook
               ;; 'java-mode-hook
               ;; 'sh-mode-hook
               'c-mode-common-hook
               'c-mode-hook
               'c++-mode-hook
               ;; 'go-mode-hook   ;; gopls is quiet slow
               ))
  (add-hook hook '(lambda () (nox-ensure))))

;;(add-hook 'minibuffer-setup-hook
                         ;;(lambda () (setq truncate-lines nil)))


;;; org-mode customize
(setq org-image-actual-width nil)

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

;; tag file
;; (setq tags-file-name "/tmp/zwxeiwu/esapc/gtags")


;; find other file for hh and cc
(setq cc-search-directories '("."
			      ".."
			      "./mobile"
			      "./sessionhandler"))

;; projectile use ivy
(setq projectile-completion-system 'ivy)

;; auto revert when file changed in disk
(global-auto-revert-mode 1)


;;(add-hook 'minibuffer-setup-hook
                         ;;(lambda () (setq truncate-lines nil)))


;;; org-mode customize
(setq org-image-actual-width nil)

;;;; company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(global-company-mode t)
(setq company-idle-delay 0
   company-minimum-prefix-length 2
   company-require-match nil
   company-dabbrev-ignore-case t
   company-show-numbers 'left
   company-auto-complete t
   )
;; set keybindings for company completion
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous-or-abort)
(define-key company-active-map (kbd "TAB") #'company-complete-selection)
;;(define-key company-active-map (kbd "C-j") #'company-complete-selection)
(define-key company-active-map (kbd "SPC") 'nil)
;;(define-key company-active-map (kbd "RET") 'nil)
;;(define-key company-active-map (kbd "<return>") 'nil)
(setq company-auto-complete-chars nil)



;; counsel
(require 'counsel)
(counsel-mode t)
;; remove '^' in M-x
(setq ivy-initial-inputs-alist nil)



;; eshell

;; save
;; (require 'save-visited-files)
;; (save-visited-files-mode t)
;; (require 'saveplace)
;; (save-place-mode t)

;;

;;
(require 'projectile)
(projectile-mode 1)
;; project root
(setq projectile-project-root "/tmp/zwxeiwu/esapc/")
(setq projectile-enable-caching t)
;; use .proectile for generating projectile
;; (setq projectile-indexing-method 'native)


;;(global-display-line-numbers-mode t)

;; which-key
;; set which key delay
(require 'which-key)
(setq which-key-idle-delay 2.0)
(which-key-mode 1)

;; delete trailing whitespace on save only changed lines
(require 'ws-butler)
(ws-butler-global-mode 1)

;; coding



;; abbrev
(require 'abbrev)
(define-abbrev-table 'global-abbrev-table
  '(
    ("db" "TRACE_DEBUG(\"---zwxeiwu--:[ ]\");")
    ("dx" "TRACE_DEBUG_EX(\"---zwxeiwu----: [\"<< <<\"]\");")
    ("td" "// TODO: zwxeiwu")
    ))
(abbrev-mode 1)
;; (use-package abbrev
;;   :ensure t
;;   :init
;;   (abbrev-mode t)
;;   ;; a hook funtion that sets the abbrev-table to org-mode-abbrev-table
;;   ;; whenever the major mode is a text mode
;;   ;; (defun tec/set-text-mode-abbrev-table ()
;;   ;;   (if (derived-mode-p 'text-mode)
;;   ;;       (setq local-abbrev-table org-mode-abbrev-table)))
;;   ;; :commands abbrev-mode
;;   ;; :hook
;;   ;; (abbrev-mode . tec/set-text-mode-abbrev-table)
;;   ;; :config
;;   ;; (setq abbrev-file-name (expand-file-name "abbrev.el" doom-private-dir))
;;   ;; (setq save-abbrevs 'silently)
;;   )






;; ivy
(require 'ivy)
(ivy-mode)

;; avy
(require 'avy)
;; avy goto char mode mark to a specific char
(defun avy-action-mark-to-char (pt)
  "Mark sexp at PT."
  (set-mark (point))
  (goto-char pt)
)
(add-to-list 'avy-dispatch-alist '(?v . avy-action-mark-to-char))


;; copy file path
(defun xah-copy-file-path (&optional @dir-path-only-p)
  "Copy the current buffer's file path or dired path to `kill-ring'.
Result is full path.
If `universal-argument' is called first, copy only the dir path.

If in dired, copy the file/dir cursor is on, or marked files.

If a buffer is not file and not dired, copy value of `default-directory' (which is usually the “current” dir when that buffer was created)

URL `http://ergoemacs.org/emacs/emacs_copy_file_path.html'
Version 2017-09-01"
  (interactive "P")
  (let (($fpath
         (if (string-equal major-mode 'dired-mode)
             (progn
               (let (($result (mapconcat 'identity (dired-get-marked-files) "\n")))
                 (if (equal (length $result) 0)
                     (progn default-directory )
                   (progn $result))))
           (if (buffer-file-name)
               (buffer-file-name)
             (expand-file-name default-directory)))))
    (kill-new
     (if @dir-path-only-p
         (progn
           (message "Directory path copied: 「%s」" (file-name-directory $fpath))
           (file-name-directory $fpath))
       (progn
         (message "File path copied: 「%s」" $fpath)
         $fpath )))))



;; open init file
(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el")
  )


;; project search at point
(defun counsel-projectile-rg-thing-at-point ()
  (interactive)
  ;; (counsel-projectile-rg (thing-at-point 'symbol))
  (setq-local thing (symbol-at-point))
  (counsel-projectile-rg)
)






(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(monokai))
 '(custom-safe-themes
   '("f3ab34b145c3b2a0f3a570ddff8fabb92dafc7679ac19444c31058ac305275e1" default))
 '(face-font-family-alternatives
   '(("Source Code Pro" "fixed")
     ("helv" "helvetica" "arial" "fixed")))
 '(package-selected-packages
   '(go-mode yaml-imenu yaml-mode better-jumper folding bind-key cuda-mode demangle-mode disaster modern-cpp-font-lock opencl-mode go smex projectile-ripgrep counsel use-package counsel-projectile swiper ivy-xref imenus magit git-timemachine fzf yasnippet undo-fu-session undo-fu rime which-key bbyac avy monokai-theme hungry-delete ivy))
 '(show-trailing-whitespace t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
