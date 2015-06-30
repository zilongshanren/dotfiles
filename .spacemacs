;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.emacs.d/spacemacs-private/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; --------------------------------------------------------
     ;; Example of useful layers you may want to use right away
     ;; Uncomment a layer name and press C-c C-c to install it
     ;;  Guide key
     ;; --------------------------------------------------------
     auto-completion
     better-defaults
     (colors :variables
             colors-enable-nyan-cat-progress-bar t)
     (git :variables
          git-magit-status-fullscreen t)
     github
     version-control
     osx
     semantic                           ; too slow
     markdown
     org
     dash
     games
     search-engine
     syntax-checking
     python
     html
     javascript
     restclient
     emacs-lisp
     racket
     gtags
     (shell :variables
            shell-default-shell 'ansi-term
            shell-default-term-shell "/bin/zsh")
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode)
     deft
     ycmd
     lua
     ;; semantic
     (clojure :variables clojure-enable-fancify-symbols t)
     eyebrowse
     ;; replace with  eyebrowser
     ;; (perspectives :variables
     ;;               perspective-enable-persp-projectile t)
     (chinese :variables chinese-default-input-method 'pinyin)
     zilongshanren
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(;; remove mode for git layer
                                    magit-gh-pulls
                                    magit-gitflow
                                    magit-svn
                                    ;; remove mode for python layer
                                    nose
                                    pony-mode
                                    hy-mode
                                    )
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progess in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to a .PNG file.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner 'doge
   ;; better company auto completion
   auto-completion-enable-sort-by-usage t
   ;; t if you always want to see the changelog at startup
   dotspacemacs-always-show-changelog t
   ;; Adding packages to this list will install them without needing them to be wrapped in a layer. Ideal for quickly add a package. 
   dotspacemacs-additional-packages '()
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects bookmarks)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         solarized-light
                         solarized-dark
                         sanityinc-solarized-light
                         sanityinc-solarized-dark
                         sanityinc-tomorrow-day
                         sanityinc-tomorrow-night
                         ;; monokai
                         ;; leuven
                         ;; zenburn
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode t
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil)
  ;; User initialization goes here
  )

(defun dotspacemacs/config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  ;; linum-mode is very slow
  ;; (add-hook 'prog-mode-hook #'linum-mode)
  ;; change evil initial mode state
  (global-company-mode t)
  (setq powerline-default-separator 'arrow)
  (global-set-key (kbd "s-l") 'goto-line)
  (menu-bar-mode t)
  (setq-default yas-prompt-functions '(yas-ido-prompt yas-dropdown-prompt))
  ;; See https://github.com/bbatsov/prelude/pull/670 for a detailed
  ;; discussion of these options.
  (setq helm-split-window-in-side-p t
        helm-move-to-line-cycle-in-source t
        helm-ff-search-library-in-sexp t
        helm-ff-file-name-history-use-recentf t)
  (diminish 'global-whitespace-mode)
  (require 'yasnippet)
  (add-to-list 'yas/root-directory "~/.emacs.d/yasnippet-snippets/")
  (global-set-key (kbd "s-s") 'save-buffer)
  (global-set-key (kbd "C-c SPC") 'avy-goto-char-2)
  (setq magit-repository-directories '("~/cocos2d-x/"))
  (global-set-key (kbd "C-`") 'toggle-input-method)
  (define-key evil-normal-state-map (kbd ",,w") 'ace-jump-char-mode)
  (evil-leader/set-key "fR" 'rename-file-and-buffer)
  (define-key evil-insert-state-map (kbd "C-y") 'lispy-yank)
  (define-key evil-insert-state-map (kbd "C-d") 'lispy-delete)
  (define-key evil-insert-state-map (kbd "C-p") 'previous-line)
  (define-key yas-minor-mode-map (kbd "TAB") 'yas-expand)
  (set-variable 'ycmd-server-command `("python" ,(expand-file-name "~/Github/ycmd/ycmd/__main__.py")))
  (evil-leader/set-key "pf" 'helm-ls-git-ls)
  (setq flycheck-display-errors-function 'flycheck-display-error-messages)
  (setq ycmd-request-message-level -1)
  (setq url-show-status nil)
  ;; the solution is not perfect, maybe I should wait for the spacemacs author
  ;; to fix the issue
  (setq helm-ag-insert-at-point 'symbol)
  (spacemacs|hide-lighter doxymacs-mode)
  ;; By default, spacemacs does not show snippets in the autocomplete popup
  ;; This snippet enables the display of snippets in the popup
  (defun autocomplete-show-snippets ()
    "Show snippets in autocomplete popup."
    (let ((backend (car company-backends)))
      (unless (listp backend)
        (setcar company-backends `(,backend :with company-yasnippet company-files)))))

  ;; See http://www.gnu.org/software/emacs/manual/html_node/emacs/Hooks.html
  ;; for what this line means
  (add-hook 'after-change-major-mode-hook 'autocomplete-show-snippets)
  (require 'lispy)
  (define-key lispy-mode-map (kbd "s-1") 'lispy-describe-inline)
  (define-key lispy-mode-map (kbd "s-2") 'lispy-arglist-inline)
  (eval-after-load 'racket-repl-mode
    '(progn
       (define-key racket-repl-mode-map (kbd "]") nil)
       (define-key racket-repl-mode-map (kbd "[") nil)
       ))
  (evil-leader/set-key "oy" 'youdao-dictionary-search-at-point+)
  (add-hook 'racket-repl-mode-hook #'(lambda () (lispy-mode t)))
  (add-hook 'racket-repl-mode-hook #'(lambda () (smartparens-mode t)))
  (setq deft-extension "org")
  (evil-leader/set-key "l" 'avy-goto-line)
  (setq deft-directory "~/org-notes/wiki")
  (add-to-list 'auto-mode-alist '("\\.eml\\'" . org-mode))
  (add-to-list 'auto-mode-alist '("\\.c\\'" . c++-mode))
  (add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))
  ;; save desktop ;unprintable entity
  ;; (desktop-save-mode t)
  (delete "*Async Shell Command*" 'popwin:special-display-config)
  (delete 'company-c-headers company-backends-c-mode-common)
  (delete 'company-clang company-backends-c-mode-common)
  (push 'company-c-headers company-backends-c-mode-common)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(cfs--current-profile-name "profile1" t)
 '(expand-region-contract-fast-key "V")
 '(expand-region-reset-fast-key "r")
 '(helm-ls-git-show-abs-or-relative (quote absolute))
 '(magit-use-overlays nil)
 '(org-agenda-custom-commands nil)
 '(org-agenda-files (quote ("~/org-notes/gtd.org")))
 '(org-agenda-ndays 1)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-deadline-prewarning-if-scheduled t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-text-search-extra-files (file-expand-wildcards "~/org-notes/wiki/*.org"))
 '(org-deadline-warning-days 14)
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-reverse-note-order t)
 '(package-selected-packages
   (quote
    (edn paredit queue peg json-rpc dash-functional web-completion-data makey anzu highlight goto-chg flx gh logito pcache pos-tip guide-key request parent-mode simple-httpd json-snatcher json-reformat multiple-cursors moz ctable orglue epic alert log4e gntp spinner epl hydra async deferred f s chinese-word-at-point dash youdao-dictionary ws-butler window-numbering web-mode web-beautify volatile-highlights vi-tilde-fringe use-package tagedit smooth-scrolling slim-mode scss-mode sass-mode rfringe reveal-in-finder rainbow-mode rainbow-identifiers rainbow-delimiters pyvenv pyenv-mode popwin pip-requirements persp-projectile pbcopy page-break-lines ox-reveal org-repo-todo org-present org-octopress org-mac-link org-download org-bullets open-junk-file neotree multi-term moz-controller move-text monokai-theme markdown-toc magit macrostep lispy linum-relative leuven-theme less-css-mode json-mode js2-refactor js-doc indent-guide impatient-mode ido-vertical-mode hungry-delete hl-anything highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-ls-git helm-gtags helm-gitignore helm-github-stars helm-flyspell helm-descbinds helm-css-scss helm-c-yasnippet helm-ag guide-key-tip google-translate golden-ratio github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh-md ggtags geiser fringe-helper flycheck-ycmd flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-tutor evil-terminal-cursor-changer evil-surround evil-search-highlight-persist evil-org evil-numbers evil-nerd-commenter evil-matchit evil-lisp-state evil-jumper evil-indent-textobject evil-iedit-state evil-exchange evil-args evil-anzu engine-mode emmet-mode elisp-slime-nav elfeed discover-my-major deft dash-at-point cython-mode company-ycmd company-web company-tern company-statistics company-quickhelp company-c-headers company-anaconda command-log-mode coffee-mode cmake-font-lock clj-refactor clean-aindent-mode clang-format cider-eval-sexp-fu chinese-fonts-setup buffer-move auto-yasnippet auto-highlight-symbol auto-dictionary align-cljlet aggressive-indent adaptive-wrap ace-jump-mode ac-ispell 2048-game)))
 '(paradox-github-token t)
 '(pyim-dicts
   (quote
    ((:name "BigDict-01" :file "/Users/guanghui/.emacs.d/pyim/dicts/pyim-bigdict.pyim" :coding utf-8-unix)
     (:name "BigDict-01" :file "/Users/guanghui/.emacs.d/.cache/pyim-bigdict.pyim" :coding utf-8-unix))))
 '(ring-bell-function (quote ignore) t)
 '(safe-local-variable-values
   (quote
    ((eval setenv "PYTHONPATH" "/Users/guanghui/cocos2d-x/tools/cocos2d-console/plugins:/Users/guanghui/cocos2d-x/tools/cocos2d-console/bin"))))
 '(vc-follow-symlinks t)
 '(ycmd-extra-conf-handler (quote load))
 '(ycmd-extra-conf-whitelist (quote ("~/cocos2d-x/*"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(git-gutter-fr:added ((t (:foreground "#859900" :weight bold :width extra-expanded))))
 '(helm-ls-git-modified-and-staged-face ((t (:foreground "dark cyan"))))
 '(helm-ls-git-modified-not-staged-face ((t (:foreground "dark cyan"))))
 '(helm-ls-git-renamed-modified-face ((t (:foreground "dark cyan")))))
