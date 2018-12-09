(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
	       ;; --- Auto-completion ---
	       company
	       ;; --- Better Editor ---
	       hungry-delete
	       swiper
	       counsel
	       smartparens
	       ;; --- Major Mode ---
	       js2-mode
	       ;; --- Minor Mode ---
       	       nodejs-repl
	       exec-path-from-shell
	       ;; --- Themes ---
       	       monokai-theme
	       ;; solarized-theme
	       ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
    (loop for pkg in my/packages
	  when (not (package-installed-p pkg)) do (return nil)
	  finally (return t)))

(unless (my/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg my/packages)
      (when (not (package-installed-p pkg))
	(package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;;关闭文件滑动控件
(scroll-bar-mode -1)

;;显示行号
(global-linum-mode 1)

;; 更改光标样式（不能生效，解决方案见第二集）
(setq-default cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 关闭缩进，第二天去除
;; (electric-indent-mode -1)

;;更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 160)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 这一行代码, 将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (org company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)

;; 开启全局 Company 补全
(global-company-mode 1)

;; 关闭备份文件
(setq make-backup-files nil)

;; 加入最近打开的文件这个选项
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; 这个快捷键绑定可以用之后的插件 counsel 代替
;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; 使用下面的函数可以选中文字后输入一个字符就替换掉选中的文字
(delete-selection-mode 1)

;; 默认开启全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 启用自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 高亮当前行
(global-hl-line-mode 1)

;; 安装主题
(add-to-list 'my/packages 'monokai-theme)

;; 每次启动编辑器时加载主题
(load-theme 'monokai 1)

;; 添加Org-mode 文本内语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;; 设置默认 org Agenda 文件目录
(setq org-agenda-files '("~/org"))

;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

