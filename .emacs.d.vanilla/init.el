(package-initialize)
(setq package-archives '(("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("melpa-stable" . "http://mirrors.ustc.edu.cn/elpa/melpa-stable/")
                         ("org" . "http://mirrors.ustc.edu.cn/elpa/org/")))

;; packages not in elpa
;; (add-to-list 'load-path (expand-file-name "~/elisp/nox"))
(let ((default-directory  "~/elisp/"))
  (normal-top-level-add-subdirs-to-load-path))
;; exec path of some programe not installed in /usr/local/bin
;; (add-to-list 'exec-path (expand-file-name "~/tools/xxx/bin"))
;; common lisp
(setq inferior-lisp-program "/usr/bin/sbcl")

;; package list
(setq package-list '(swiper
                     ivy
                     winum
                     save-visited-files
                     eshell-up
                     company
                     slime
                     ;; treemacs
                     all-the-icons
                     bbyac
                     which-key
                     rime
                     projectile
                     plantuml-mode
                     undo-fu
                     use-package
                     undo-fu-session
                     hungry-delete
                     ivy-avy
                     origami
                     hl-todo
                     ws-butler
                     avy
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
                     ;; org
                     org-bullets
                     org-pretty-tags
                     ;; end of org
                     smex
                     git-timemachine
                     magit
                     counsel
                     auto-highlight-symbol
                     goto-last-change
                     monokai-theme
                     monokai-alt-theme))

;;; install the missing packages
(let ((need-refresh t))
  (dolist (package package-list)
    (unless (package-installed-p package)
      (if need-refresh
          (progn
            (package-refresh-contents)
            (setf need-refresh nil)
            (package-install package))
        (package-install package)))))

;; require all packages
(dolist (package package-list)
  (require package))

;; TODO: download github packages automatically
(setq github-package-list '((nox . "lazycat")
                            ))
(dolist (package github-package-list)
  (require (car package)))


;;;;;------------------------------ Keybindings----------------------------

;; key-bindings for editing -------------------------------
(global-set-key (kbd "C-h") 'hungry-delete-backward)
;; (global-set-key (kbd "C-h") 'backward-delete-char-untabify)
(global-set-key (kbd "M-h") 'backward-kill-word)
;;(global-set-key (kbd "C-d") 'hungry-delete-forward)
(global-set-key (kbd "M-k") 'kill-whole-line)
(global-set-key (kbd "M-/") 'bbyac-expand-symbols)
(global-set-key (kbd "M-l") 'bbyac-expand-lines)
;; TODO newline without break current line
;; (global-set-key (kbd "C-<return>") 'newline)
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
(global-set-key (kbd "C-c C-l") 'comment-line)
(global-set-key (kbd "C-x a a") 'align-regexp)

;; key-bindings for jumping -------------------------------
(global-set-key (kbd "M-'") 'avy-goto-line)
(global-set-key (kbd "M-c") 'avy-goto-char-2)
(global-set-key (kbd "M-C") 'avy-goto-char)
(global-set-key (kbd "C-.") 'xref-find-references)
(global-set-key (kbd "M-[ 1 ; 5 n") 'xref-find-references)
(global-set-key (kbd "M-s i") 'imenu)
(global-set-key (kbd "M-[ [") 'beginning-of-defun)
(global-set-key (kbd "M-] ]") 'end-of-defun)
(global-set-key (kbd "M-[ M-[") 'beginning-of-defun)
(global-set-key (kbd "M-] M-]") 'end-of-defun)
(global-set-key (kbd "C-z") 'origami-toggle-node)
(global-set-key (kbd "C-c /") 'goto-last-change)
;; (better-jumper-mode 1)
;; (global-set-key (kbd "M-n") 'better-jumper-jump-forward)
;; (global-set-key (kbd "M-p") 'better-jumper-jump-backward)

;; ivy
(ivy-mode)

;; key-bindings for search -------------------------------
(global-set-key (kbd "C-s") 'swiper-thing-at-point)
(global-set-key (kbd "M-s s") 'counsel-projectile-rg)
(global-set-key (kbd "M-s M-s") 'swiper-all-thing-at-point);; 'counsel-projectile-rg-thing-at-point)

;; key-bindings for file -------------------------------
(global-set-key (kbd "M-z") 'switch-to-buffer)
;; (global-set-key (kbd "C-c b") 'switch-to-buffer)
(global-set-key (kbd "C-c C-f") 'find-file)
(global-set-key (kbd "M-p f") 'projectile--find-file)
(global-set-key (kbd "C-c p f") 'projectile--find-file)
(global-set-key (kbd "C-c p i") 'projectile-invalidate-cache)
;; (global-set-key (kbd "M-p") 'previous-buffer)
;; (global-set-key (kbd "M-n") 'next-buffer)
(global-set-key (kbd "M-g a") 'ff-get-other-file)
(global-set-key (kbd "M-g M-a") 'ff-get-other-file)
(global-set-key (kbd "M-g b") 'magit-blame)
(global-set-key (kbd "M-g t") 'git-timemachine)



;; key-bindings for window -------------------------------
(winum-mode)
(global-set-key (kbd "M-1") 'winum-select-window-1)
(global-set-key (kbd "M-2") 'winum-select-window-2)

(global-set-key (kbd "M-3") 'winum-select-window-3)
(global-set-key (kbd "M-4") 'winum-select-window-4)
(global-set-key (kbd "M-0") 'treemacs-select-window)
(global-set-key (kbd "C-x C-o") 'other-window)
(global-set-key (kbd "C-c o") 'other-window)
(global-set-key (kbd "C-r") 'ivy-resume)

;; key-bindings for magit -------------------------------
(global-set-key (kbd "M-g f") 'magit-pull)
(global-set-key (kbd "M-g p") 'magit-push)
(global-set-key (kbd "M-g d") 'magit-diff)
(global-set-key (kbd "M-g s") 'magit-status)
(global-set-key (kbd "M-g l") 'magit-log)
(global-set-key (kbd "M-g m") 'smerge-keep-mine)
(global-set-key (kbd "M-g o") 'smerge-keep-other)


;; key-bindings for term -------------------------------
(add-hook 'term-mode-hook
          (lambda ()
            (setq show-trailing-whitespace nil)
            (define-key term-raw-map (kbd "M-z") 'switch-to-buffer)
            (define-key term-raw-map (kbd "M-x") 'counsel-M-x)))

;;;;;------------------------------ UI ----------------------------

;; (global-hl-todo-mode 1) ;; hl todo seems not be used frequency

;; (add-to-list 'default-frame-alist '(font . "Source Code Pro"))
;; (set-face-attribute 'default t :font "Source Code Pro" :height 130)
(set-frame-font "Source Code Pro-13")

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
(setq resize-mini-windows t)
(setq max-mini-window-height 4)

;; display time
(display-time-mode 1)

;; scroll bar
(scroll-bar-mode -1)

(global-hl-line-mode t)
;; display line number
(global-display-line-numbers-mode -1)

(tool-bar-mode -1)
(menu-bar-mode -1)
;; show tabs and trailing whitespace
(setq whitespace-style '(face trailing tabs tab-mark))


;;;;;------------------------------ EDIT ----------------------------

(setq-default indent-tabs-mode nil)
(setq default-tab-width 3)
(setq tab-width 3)
(setq c-default-style "ellemtel" c-basic-offset 3)
(setq make-backup-files nil)
(setq mark-ring-max 6)
(setq global-mark-ring-max 6)



;; TODO: mode-line
(setq-default mode-line-format
              '(
                "%e"
                ;; mode-line-front-space
                ;; Standard info about the current buffer
                ;; mode-line-mule-info
                ;; mode-line-client
                mode-line-modified
                "  "
                ;; mode-line-remote
                ;; mode-line-frame-idejtification
                mode-line-buffer-identification
                "\t  "
                mode-line-position
                ;; Some specific information about the current buffer:
                ;; lunaryorn-projectile-mode-line ; Project information
                ;; (vc-mode lunaryorn-vc-mode-line)   VC information
                ;; (flycheck-mode flycheck-mode-line) ; Flycheck status
                ;; (multiple-cursors-mode mc/mode-line) ; Number of cursors
                ;; Misc information, notably battery state and function name
                "\t  "
                mode-line-misc-info
                "\t  "
                (vc-mode vc-mode)
                ;; And the modes, which I don't really care for anyway
                ;; " "
                ;; mode-line-modes
                ;; mode-line-end-spaces
                ))


;; enable mouse in terminal
(xterm-mouse-mode)

;; mouse scroll with wsl-terminal
(global-set-key [mouse-4] (lambda ()
                            (interactive)
                            (scroll-down-line 10)
                            ))
(global-set-key [mouse-5] (lambda ()
                            (interactive)
                            (scroll-up-line 10)
                            ))
;; (global-set-key [C-mouse-4] (lambda ()
;;                             (interactive)
;;                             (scroll-down-line 20)
;;                             ))
;; (global-set-key [C-mouse-5] (lambda ()
;;                             (interactive)
;;                             (scroll-up-line 20)
;;                             ))




;; scroll ones line
(setq redisplay-dont-pause t
  scroll-margin 0
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; gnutls for emacs
;;(let ((gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")))

;; auto highlight
(global-auto-highlight-symbol-mode t)

;; disable auto save
(setq auto-save-default nil)

;; recenter
(setq recenter-positions '(middle top bottom))

;; (setq nox-python-server-dir (concat "/home/" user-login-name "/tools/python-language-server/bin"))
;; (setq nox-python-server "pyls")

;; add exec-path for running command
;; todo use home directory, home directory is quiet slow, maybe the reason is GOROOT
;; (add-to-list 'exec-path (concat "/home/" user-login-name "/tools/go-language-server/bin"))
;; (add-to-list 'exec-path (concat "/tmp/" user-login-name "/sapc_go/bin"))
;; (add-to-list 'nox-server-programs '((go-mode) . ((concat "/home/" user-login-name "/tools/go-language-server/bin/gopls"))))

;; plantuml
(add-to-list 'auto-mode-alist '("\\.uml\\'" . plantuml-mode)) ;; auto enable plantuml-mode for .uml files
(setq org-plantuml-jar-path (expand-file-name "~/tools/plantuml.jar"))
;; (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(setq plantuml-jar-path (expand-file-name "~/tools/plantuml.jar"))
(setq plantuml-default-exec-mode 'jar)
;; set plantuml-preview to png for svg image can not displayed correctly in dark themes
;; You may need to plantuml-set-output-type 'svg or 'txt manualy for output to a svg(more clear and can scale without lose picture )
(setq plantuml-output-type "png")
(add-hook 'plantuml-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-c") 'plantuml-preview-current-block)))


(add-to-list 'exec-path (concat "/tmp/" user-login-name "/tools/clang+llvm-10.0.0-x86_64-linux-sles11.3/bin/"))
(add-to-list 'nox-server-programs '((c++-mode c-mode) . ("clangd")))
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
(org-babel-do-load-languages
 'org-babel-load-languages
 '((plantuml . t)
   (latex . t)
   (shell . t)
   (emacs-lisp . t)
   (lisp . t)
   (C . t)))
;; image can be resize on view
(setq org-image-actual-width nil)
(setq org-startup-with-inline-images t)
;; org source code indentation
(setq org-src-tab-acts-natively t)
(add-hook 'org-mode-hook
          (lambda ()
            (org-bullets-mode 1)))



(setq c-default-style "ellemtel" c-basic-offset 3)


;; tag file
;;(setq tags-file-name (concat "/tmp/" user-login-name "/esapc/gtags"))


;; find other file for hh and cc
(setq cc-search-directories '("."
                              ".."
                              "./mobile"
                              "../incl"
                              "../src"
                              ))

;; projectile use ivy
(setq projectile-completion-system 'ivy)

;; auto revert when file changed in disk
(global-auto-revert-mode 1)

;; hide-show collapse code block
(global-origami-mode 1)

;;(add-hook 'minibuffer-setup-hook
                         ;;(lambda () (setq truncate-lines nil)))


;; (follow-mode) ;; for read in two screens, it can scroll screens together
(add-hook 'follow-mode-hook
          (lambda ()
            (local-set-key (kbd "C-v") 'follow-scroll-up)
            (local-set-key (kbd "M-v") 'follow-scroll-down)))

;;;; company
(add-hook 'after-init-hook 'global-company-mode)
(global-company-mode t)
(setq company-idle-delay 0
   company-minimum-prefix-length 1
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
(counsel-mode t)
;; remove '^' in M-x
(setq ivy-initial-inputs-alist nil)

;; eshell
(add-hook 'eshell-mode-hook
          (lambda ()
            (company-mode -1)))
;; mapping eshell editors to emacs
(defun eshell/emacs (file)
  (find-file file))
(defun eshell/vim (file)
  (find-file file))
(defun eshell/vi (file)
  (find-file file))

(setenv "TOOL_DIR" (concat "/tmp/" user-login-name "/tools/"))
(setenv "TMP_DIR" (concat "/tmp/" user-login-name "/"))
(setenv "LS_OPTIONS" "-N --color=tty -T 0") ;; TODO: seems not work

;; history
;; (save-visited-files-mode t)
(save-place-mode t)


;; proectile
(projectile-mode 1)
;; project root
(setq projectile-enable-caching t)
;; use .proectile for generating projectile
;; (setq projectile-indexing-method 'native)


;; which-key
;; set which key delay
(setq which-key-idle-delay 2.0)
(which-key-mode 1)

;; delete trailing whitespace on save only changed lines
(ws-butler-global-mode 1)

;; coding



;; auto complete pair for () {} [] "" ...
(electric-pair-mode 1)
;; abbrev
(define-abbrev-table 'global-abbrev-table
  `(
   ("db" ,(concat "TRACE_DEBUG(\"" user-login-name ": [s]\");"))
    ("dx" ,(concat "TRACE_DEBUG_EX(\"" user-login-name ": s[\"<< v <<\"]\");"))
    ("td" ,(concat "// TODO: " user-login-name ": "))
    ))
(abbrev-mode 1)


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
  (let ((thing (thing-at-point 'symbol)))
    (progn
      (counsel-projectile-rg)
      ))
  (kill-ring-save 0 0 (ivy-thing-at-point))
  )




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(monokai))
 '(custom-safe-themes
   '("d9646b131c4aa37f01f909fbdd5a9099389518eb68f25277ed19ba99adeb7279" "0231f20341414f4091fc8ea36f28fa1447a4bc62923565af83cfb89a6a1e7d4a" "46b2d7d5ab1ee639f81bde99fcd69eb6b53c09f7e54051a591288650c29135b0" "f3ab34b145c3b2a0f3a570ddff8fabb92dafc7679ac19444c31058ac305275e1" default))
 '(package-selected-packages
   '(w32-browser xmind-org org-mind-map leetcode plantuml-mode org-bullets disaster electric-operator auto-complete w3m goto-last-change goto-last-point magit-gerrit origami monokai-alt-theme counsel-gtags all-the-icons-ivy all-the-icons liberime imenu-list ivy-avy treemacs eshell-up save-visited-files org-pretty-tags go-mode yaml-imenu yaml-mode better-jumper folding bind-key cuda-mode demangle-mode modern-cpp-font-lock opencl-mode go smex projectile-ripgrep counsel use-package counsel-projectile swiper ivy-xref imenus magit git-timemachine fzf yasnippet undo-fu-session undo-fu rime which-key bbyac avy monokai-theme hungry-delete ivy))
 '(show-trailing-whitespace t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
