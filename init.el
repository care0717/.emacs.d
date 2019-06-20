;; set up
;; M-x package-refresh-contents
;; M-x package-install git-gutter

;; package管理
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

;; use molokai
(load-theme 'misterioso t)
(enable-theme 'misterioso)


;; cmdキーを superとして割り当てる
(setq mac-command-modifier 'super)

;; バックスペースの設定
(global-set-key (kbd "C-h") 'delete-backward-char)

;; font
(add-to-list 'default-frame-alist '(font . "ricty-12"))


(column-number-mode t)
(line-number-mode t)


;; alpha
(if window-system 
    (progn
      (set-frame-parameter nil 'alpha 95)))

;; tabサイズ
(setq default-tab-width 4)

;; メニューバーを非表示
(menu-bar-mode 0)

;; ツールバーを非表示
(tool-bar-mode 0)

;; default scroll bar消去
(scroll-bar-mode -1)

;; 現在ポイントがある関数名をモードラインに表示
(which-function-mode 1)

;; 対応する括弧をハイライト
(show-paren-mode 1)

;; リージョンのハイライト
(transient-mark-mode 1)

;; タイトルにフルパス表示
(setq frame-title-format "%f")

;;current directory 表示
(let ((ls (member 'mode-line-buffer-identification
                  mode-line-format)))
  (setcdr ls
    (cons '(:eval (concat " ("
            (abbreviate-file-name default-directory)
            ")"))
            (cdr ls))))

;; スタートアップメッセージを表示させない
(setq inhibit-startup-message 1)

;; ターミナルで起動したときにメニューを表示しない
(if (eq window-system 'x)
    (menu-bar-mode 1) (menu-bar-mode 0))
(menu-bar-mode nil)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;; スクロールは1行ごとに
(setq mouse-wheel-scroll-amount '(1 ((shift) . 5)))

;; スクロールの加速をやめる
(setq mouse-wheel-progressive-speed nil)

;; bufferの最後でカーソルを動かそうとしても音をならなくする
(defun next-line (arg)
  (interactive "p")
  (condition-case nil
      (line-move arg)
    (end-of-buffer)))

;; エラー音をならなくする
(setq ring-bell-function 'ignore)

;; git-gutte
(global-git-gutter-mode 1)

;; magit
(global-set-key (kbd "C-c C-g") 'magit-diff-working-tree)

;; ファイル編集時に，bufferを再読込
(global-auto-revert-mode 1)

;; 大文字小文字を区別しない
(setq case-fold-search t)

;; バックアップファイルを.ehistに保存
 (setq backup-directory-alist '((".*" . "~/.ehist")))

;; 自動保存ファイルを.ehist/autosaveに保存
 (setq auto-save-file-name-transforms   '((".*" "~/.ehist/autosave" t)))

 ;; "yes or no" の選択を "y or n" にする
(fset 'yes-or-no-p 'y-or-n-p)

