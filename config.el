;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "ykumards"
      user-mail-address "ykumards@fastmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/Work/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; UI
(setq mac-command-modifier 'control)
(which-key-mode)

(set-face-attribute 'default nil :font "Fira Code-20")
;; Better scrolling
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)
;; These settings relate to how emacs interacts with your operating system
(setq ;; makes killing/yanking interact with the clipboard
      x-select-enable-clipboard t

      ;; I'm actually not sure what this does but it's recommended?
      x-select-enable-primary t

      ;; Save clipboard strings into kill ring before replacing them.
      ;; When one selects something in another program to paste it into Emacs,
      ;; but kills something in Emacs before actually pasting it,
      ;; this selection is gone unless this variable is non-nil
      save-interprogram-paste-before-kill t

      ;; Shows all options when running apropos. For more info,
      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
      apropos-do-all t

      ;; Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)
;; Show line numbers everywhere
(global-linum-mode)

;; Nyan-mode
(nyan-mode)

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(meta shift up)]  'move-line-up)
(global-set-key [(meta shift down)]  'move-line-down)
;; Markdown related settings
(setq markdown-toggle-math t)

;; SHORTCUTS
; Org agenda
(global-set-key (kbd "C-q") 'org-agenda)

;; Neotree toggle
;; (global-set-key (kbd "C-c n") 'neotree-toggle)
(global-set-key (kbd "C-c C-n") 'treemacs)

;;windmove
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; Projectile Shortcuts
;; This gives us a sublime like shortcut to open a file
;; we can add the directory name along with the filename
(global-set-key (kbd "C-p")  'projectile-find-file)
(global-set-key (kbd "C-f") 'helm-projectile-grep)

;; Steve Yegge's idea to use replace M-x with C-x C-m
(global-set-key "\C-x\C-m" 'helm-M-x)
(global-set-key "\C-c\C-m" 'helm-M-x)


(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Add shortcut for helm-org-rifle
(global-set-key "\C-cf" 'helm-org-rifle)
;; Helm projectile switch project
(global-set-key (kbd "C-c p p") 'helm-projectile-switch-project)

(global-set-key (kbd "C-x C-g") 'deft-find-file)

;; Interactive search key bindings. By default, C-s runs
;; isearch-forward, so this swaps the bindings.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Key binding to use "hippie expand" for text autocompletion
;; http://www.emacswiki.org/emacs/HippieExpand
(global-set-key (kbd "M-/") 'hippie-expand)

;; ORG
;; Prettify to display latex symbols inline
(add-hook 'org-mode-hook 'org-toggle-pretty-entities)

(setq org-agenda-files (list "~/Documents/Work/org/2020.org"
                             "~/Documents/Work/org/todo.org"
                             "~/Documents/Work/org/inbox.org"
                             "~/Documents/Work/org/projects.org"))
(setq org-default-notes-file "~/Documents/Work/org/inbox.org")

(setq org-indent-mode t)
(setq org-startup-with-inline-images t)

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "MEETING(m)" "|" "DONE(d)"))))

(setq org-todo-keyword-faces
      (quote (("NEXT" :foreground "blue" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

;; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)
(setq org-completion-use-ido nil)
(setq ido-everywhere nil)
(setq ido-max-directory-size 100000)

;; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
;; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/Documents/Work/org/inbox.org")
               "* TODO %?\n%U\n%a\n")
              ("j" "Journal Entry"
               entry (file+datetree "~/Documents/Work/org/journal.org")
               "* %?"
               :empty-lines 1)
              ("n" "note" entry (file "~/Documents/Work/org/inbox.org")
               "* %? :NOTE:\n%U\n%a\n"))))

;; Configure refile to use ido and allow nested targets
(setq org-outline-path-complete-in-steps nil)
(setq org-indent-indentation-per-level 2)
(setq org-refile-use-outline-path t)
(setq org-refile-targets '((nil . (:maxlevel . 5))))
(setq org-capture-bookmark nil)

;; Org Journal
(setq org-journal-date-prefix "#+title: ")
(setq org-journal-file-format "%Y-%m-%d.org")
(setq org-journal-dir "~/Documents/Work/org/notes/musings")
(setq org-journal-date-format "%A, %d %B %Y")
(global-set-key (kbd "C-c j") 'org-journal-new-entry)
