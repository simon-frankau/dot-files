;; Simon Frankau's .emacs file.
;; Last edited 2011-06-08

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basics

; FIXME: Conditionally execute if in X.

;; Need to store my lisp somewhere...
(add-to-list 'load-path "~/.emacs.d/lisp")

;; Favourite programming font.
;(set-face-font 'default "proggytinytt-14")

;; Initial window size...
;; 1024 x 768
;(add-to-list 'default-frame-alist '(width  . 80))
;(add-to-list 'default-frame-alist '(height . 64))
;; 1024 x 1280
;(add-to-list 'default-frame-alist '(width  . 80))
;(add-to-list 'default-frame-alist '(height . 112))
;; 1024 x 1280 wide
;(add-to-list 'default-frame-alist '(width  . 160))
;(add-to-list 'default-frame-alist '(height . 117))
;; 1024 x 1280 wide, not too high
;(add-to-list 'default-frame-alist '(width  . 160))
;(add-to-list 'default-frame-alist '(height . 108))

;(add-to-list 'default-frame-alist '(top  . 0))
;(add-to-list 'default-frame-alist '(left . 1024))

;; Colours
(add-to-list 'default-frame-alist '(foreground-color . "white"))
(add-to-list 'default-frame-alist '(background-color . "black"))

;; Various toys.
; (mouse-wheel-mode t)      ; Make the mouse wheel work.
(blink-cursor-mode nil)   ; Don't blink cursor.
(display-time)            ; Always display the time.
(column-number-mode t)    ; Column numbers on.
(show-paren-mode t)       ; Automatically highlight parens.
(global-font-lock-mode t) ; Colour! Everywhere!
(iswitchb-mode 1)         ; Use iswitchb.
(server-mode t)           ; Enable emacsclient.

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; Disable crap
(menu-bar-mode -1) ; Menu bar off, please.
;(tool-bar-mode nil) ; Ditto toolbar.

;; Force size of initial frame
;(set-frame-size  (selected-frame)
;                 (cdr (assoc 'width  default-frame-alist))
;                 (cdr (assoc 'height default-frame-alist)))

;; Make our other frame, now it's all set up.
;(make-frame '((left . 2048) (top . 0)))

;; X clipboard pain with oldy versions
(setq x-select-enable-clipboard t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; More stuff...

;; Sentences end with a single '.'
(setq sentence-end-double-space nil)
(setq sentence-end "[.?!][]\"')}]*\\($\\|\t\\| \\)[ \t\n]*")

;; Get sunrise/sunset right!
(setq calendar-latitude 51.5)
(setq calendar-longitude -0.1)
(setq calendar-location-name "London, UK")
(setq calendar-week-start-day 1)

;; Uniquify buffers
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

; I hope this doesn't screw with Makefile-mode!
(setq-default indent-tabs-mode nil)

; FIXME (require 'column-marker)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ispell

(setq ispell-enable-tex-parser t)
; Easier to install than ispell on Win32.
(setq-default ispell-program-name "c:/program files/aspell/bin/aspell")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C++ mode

;; Set up C/C++ modes nicely.
(require 'cc-mode)
(add-hook 'c-mode-common-hook
          '(lambda ()
             (c-set-style "K&R")
             (c-set-offset 'innamespace 0)
             (c-set-offset 'inline-open 0)
             (c-set-offset 'member-init-intro '+)
             (local-set-key  (kbd "C-c o") 'ff-get-other-file)
             (setq c-basic-offset 4)
             (setq indent-tabs-mode nil)
             (show-paren-mode t)))

;; .h files can be C++
(add-to-list 'auto-mode-alist '("\.h$" . c++-mode))
;; Hook .tex to latex-mode.
(add-to-list 'auto-mode-alist '("\.tex$" . latex-mode))

;; Draw tabs with the same color as trailing whitespace
(add-hook 'font-lock-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '(("\t" 0 'trailing-whitespace prepend)))))

(setq         compilation-window-height 32)     ; Compilation output window.
(setq-default show-trailing-whitespace t)       ; See the trailing whitespace.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; OCAML mode.

;(add-to-list 'load-path "/homes/sgf22/ocaml.emacs")
;(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . caml-mode))
;(autoload 'caml-mode "caml" "Major mode for editing Caml code." t)
;(autoload 'run-caml "inf-caml" "Run an inferior Caml process." t)
;(autoload 'camldebug "camldebug" "Run the Caml debugger." t)

;; OCAML mode seems to explicitly want the activation of colour.
;(add-hook 'caml-mode-hook 'turn-on-font-lock)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Make

;; Work with visual studio...
;; FIXME: Using unix-utils now (setq compile-command "C:/Progra~1/Micros~1.1/Common7/IDE/devenv.exe XLayerContext.sln /build Debug")
;; (setq compile-command "make exes")
(setq compile-command "c:/temp/build_aleph.cmd")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Source control

; FIXME (load-library "clearcase")

;; P4 stuff...
;(load-library "p4")
;(require 'vc-p4)
;(setq p4-do-find-file nil)
;(setq p4-verbose      nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Paths

;(setenv "PATH" (concat "C:/p4_ws/frankaus_fpf_blah_ws/fpf_dev/ThirdParty/UnixUtils;" (getenv "PATH")))

; ediff sometimes gets lost. Argh.
;(setq ediff-diff-program "c:/p4_ws/frankaus_fpf_blah_ws/FPF/ThirdParty/UnixUtils/diff.exe")
;(setq ediff-diff3-program "c:/p4_ws/frankaus_fpf_blah_ws/FPF/ThirdParty/UnixUtils/diff.exe")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Haskell mode

; FIXME

;(load-library "haskell-mode-2.1\\haskell-site-file")
;(load-library "haskell-mode-2.1/haskell-site-file")

;; Add camel case to Haskell
;(autoload 'camelCase-mode "~/camelCase-mode")
;(add-hook 'haskell-mode-hook '(lambda () (camelCase-mode 1)))

; Nice little function to align 'name'd definitions.
;(defun ra ()
;  "Align name exprs"
;  (interactive)
;  (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)=" 1 align-default-spacing nil)
;  (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)[a-zA-Z']*$" 1 align-default-spacing nil))

;; FPF TAGS Table location fix
;(add-hook 'find-file-hook 'fpf-tags-redirect-hook)
;(defun fpf-tags-redirect-hook ()
;"Redirect the FPF TAGS file's default-directory to be the FPF src directory rather than the Build directory which is where the TAGS file is kept."
;(interactive)
;(if (string= (substring buffer-file-name -10 -1) "Build/TAG") (setq default-directory (expand-file-name "../src"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TeX mode

;; Stupid subscript stuff in TeX-mode.
(eval-after-load "tex-mode" '(fset 'tex-font-lock-suscript 'ignore))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Lua mode

(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(setq lua-indent-level 4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org mode

;(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Sort into priority order.
(setq org-agenda-sorting-strategy '(priority-down category-up))

(setq org-startup-folded 'showall)
(setq org-hide-leading-stars t)
;(setq org-odd-levels-only t)

(setq org-todo-keywords
      '((sequence "NEXT" "WAITING" "LATER" "PROJECT" "ONEDAY" "|" "DONE" "CANCELLED")))

(setq org-todo-keyword-faces
      '(
        ("NEXT"       . (:foreground "firebrick2"  :weight bold))
        ("WAITING"    . (:foreground "goldenrod"   :weight bold))
        ("LATER"      . (:foreground "sienna"      :weight bold))
        ("PROJECT"    . (:foreground "steelblue"   :weight bold))
        ("DONE"       . (:foreground "forestgreen" :weight bold))
        ("ONEDAY"     . (:foreground "dimgrey"     :weight bold))
        ("CANCELLED"  . (:foreground "darkgreen"   :weight bold))
        ))

(setq org-tag-alist '(("Asia"     . ?a)
                      ("Chat"     . ?c)
                      ("Desk"     . ?d)
                      ("Outside"  . ?o)
                      ("Aaron"    . ?A)
                      ("Ben"      . ?B)
                      ("Roman"    . ?C)
                      ("Dom"      . ?D)
                      ("Elias"    . ?E)
                      ("Marc"     . ?M)
                      ("Peter"    . ?P)
                      ("Rob"      . ?R)
                      ("Simon"    . ?S)
                      ("Bernhard" . ?W)
                      ("Roland"   . ?Z)
                      ))

(setq org-tags-column 120)
(setq org-agenda-tags-column 120)

(setq org-export-select-tags ":export:")

(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)

(setq org-agenda-ndays 14)

(setq org-agenda-custom-commands
      '(("t" "Next items"         todo   "NEXT"    ((org-agenda-sorting-strategy '(priority-down category-up))))
        ("w" "Waiting items"      todo   "WAITING" ((org-agenda-sorting-strategy '(priority-down category-up))))
        ("l" "Later items"        todo   "LATER"   ((org-agenda-sorting-strategy '(priority-down category-up))))
        ("o" "One day..."         todo   "ONEDAY"  ((org-agenda-sorting-strategy '(priority-down category-up))))
        ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Semantic bovinator...

;(load-library "cedet-1.1/common/cedet.el")
;(global-ede-mode 1)
;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;(require 'semantic-ia)
;; (require 'semantic-gcc)

;(ede-cpp-root-project "Aleph"
; :file "C:/p4_ws/frankaus_qa_ws/depot/QA/QALibrary/EDG/aleph/CMakeLists.txt"
; :include-path '("/src" "/local_build/src"))

;; (setq semanticdb-project-roots '("C:/p4_ws/frankaus_qa_ws/depot/QA/QALibrary/EDG/aleph/src"))

;; Enable M-* for popping back from semantic jumps
;(require 'etags)
;(defun push-tag-mark ()
;  (ring-insert find-tag-marker-ring (point-marker)))

;;; FIXME: Should be hooked onto specific modes!
;(global-set-key "\M-?" 'semantic-ia-complete-symbol)
;(global-set-key (kbd "C-M-?") 'senator-completion-menu-popup)

;(global-set-key "\C-cj" 'semantic-ia-fast-jump)
;(global-set-key "\C-cq" 'semantic-ia-show-doc)
;(global-set-key "\C-cs" 'semantic-ia-show-summary)
;(global-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
;(global-set-key "\C-c=" 'semantic-decoration-include-visit)
;(global-set-key "\C-c\C-r" 'semantic-symref)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; More new things

; FIXME (require 'revbufs)

(defun copy-full-path-to-kill-ring ()
  "copy buffer's full path to kill ring"
  (interactive)
  (when buffer-file-name
    (kill-new (replace-regexp-in-string "/" "\\\\" (file-truename buffer-file-name)))))

(global-set-key (kbd "C-c C-p") 'copy-full-path-to-kill-ring)
(global-set-key (kbd "C-c C-a") 'align-regexp)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("f:/org/Steering.org" "f:/org/Misc.org" "f:/org/FPF.org" "f:/org/Aleph.org"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


(put 'narrow-to-region 'disabled nil)

;; DOS line endings have screwed me over...
(setq inhibit-eol-conversion t)
