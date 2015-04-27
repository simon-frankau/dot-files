;; Simon Frankau's .emacs file.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basics

; FIXME: Conditionally execute parts if in X.

;; Need to store my lisp somewhere...
(add-to-list 'load-path "~/repos/dot-files/lisp")

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
(ido-mode t)              ; Use ido (used to use iswitchb)
(setq ido-enable-flex-matching t) ; I've got used to Idea
(global-subword-mode t)   ; Deal with camelCase

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

(require 'column-marker)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ispell

(setq ispell-enable-tex-parser t)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TeX

;; Hook .tex to latex-mode.
(add-to-list 'auto-mode-alist '("\.tex$" . latex-mode))

;; Disable stupid subscript stuff in TeX-mode.
(eval-after-load "tex-mode" '(fset 'tex-font-lock-suscript 'ignore))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Misc

;; Draw tabs with the same color as trailing whitespace
(add-hook 'font-lock-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '(("\t" 0 'trailing-whitespace prepend)))))

(setq-default show-trailing-whitespace t)       ; See the trailing whitespace.

(setq         compilation-window-height 32)     ; Compilation output window.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Source control

; FIXME: magit

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Haskell mode

;; FIXME: Install as needed...
(require 'haskell-mode nil 'noerror)

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

;; For whatever future tags are needed...
;(setq org-tag-alist '(("Asia"     . ?a)
;                      ("Chat"     . ?c)
;                      ("Desk"     . ?d)
;                      ))

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
;; More new things

(require 'revbufs)

(defun copy-full-path-to-kill-ring ()
  "copy buffer's full path to kill ring"
  (interactive)
  (when buffer-file-name
    (kill-new (replace-regexp-in-string "/" "\\\\" (file-truename buffer-file-name)))))

(global-set-key (kbd "C-c C-p") 'copy-full-path-to-kill-ring)

(put 'narrow-to-region 'disabled nil)

;; DOS line endings have screwed me over...
(setq inhibit-eol-conversion t)
