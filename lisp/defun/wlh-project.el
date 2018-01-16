(defvar wlh/workspace-list '("~/"
                             "~/Desktop/"
                             "~/Documents/"
                             "~/Downloads/"
                             "~/www/project/arsia/arsia_3.0.0_allibert/"
                             "~/www/project/arsia/arsia_3.0.0_carrefour_market/"
                             "~/www/project/arsia/arsia_3.0.0_standard/"
                             "~/www/project/arsia/arsia_3.0.3_allibert/"
                             "~/www/project/arsia/arsia_3.0.x_gun/"
                             "~/www/project/arsia/arsia_3.1.0_standard/"
                             "~/www/project/arsia/arsia_3.2.x_standard/"
                             "~/www/project/arsia/arsia_3.2.x_standard_editzone/"
                             "~/www/project/arsia/arsia_3.0.0_weiss_poc/"
                             "~/www/project/arsia/arsia_3.1.x_ccas/"
                             "~/www/project/businessmanager/"
                             "~/www/project/easy3p/easy3p_2.18/"
                             "~/www/project/easy3p/easy3p_2.19/"
                             "~/www/project/easy3p/easy3p_3.0/"
                             "~/www/project/easy3p/easy3p_3.1/"
                             "~/www/project/easy3p/easy3p_3.2/"
                             "~/www/project/easy3p/easy3p_3.2_ao/"
                             "~/www/project/easy3p/easy3p_3.2_lot2/"
                             "~/www/project/easy3p/easy3p_3.3/"
                             "~/www/project/easy3p/easy3p_3.4/"
                             "~/www/project/goaland_siteweb/goaland_siteweb_6.0.0/"
                             "~/www/project/lifechecker/"
                             "~/www/project/rb_3d/rb_3d_1.0/"
                             "~/www/project/rb_siteweb/rb_siteweb_1.2/"
                             "~/www/project/rb_siteweb/rb_siteweb_1.3/"
                             "~/www/project/rb_siteweb/rb_siteweb_1.4/"
                             "~/www/temp/"
                             "~/www/project/goaland_maintenance/"
                             ))

(defvar wlh/workspace-vc-dir '("dev"
                               "deploy_template"
                               "pimdatamanager"
                               "pimdatamanager_deploy_template"
                               ))

(defun wlh/workspace-add-vc-view (workspace-dir vc-dir)
  (if (file-exists-p (concat workspace-dir vc-dir))
      (progn
        (vc-dir (concat workspace-dir vc-dir))
        ;; (wlh/vc-dir (concat workspace-dir vc-dir))
             (hrs/split-window-below-and-switch)
             (balance-windows))
    (message "ko")))

(defun wlh/workspace-action-1 (x)
  (interactive)
  (delete-other-windows)
  (hrs/split-window-right-and-switch)
  (find-file x)
  (other-window 1)

  ;; (progn (mapcar (lambda(y) ((wlh/workspace-add-vc-view x y))) wlh/workspace-vc-dir))

  (progn (wlh/workspace-add-vc-view x "dev")
         (wlh/workspace-add-vc-view x "deploy_template")
         (wlh/workspace-add-vc-view x "license")
         (wlh/workspace-add-vc-view x "pimdatamanager")
         (wlh/workspace-add-vc-view x "pimdatamanager_deploy_template")
         (wlh/workspace-add-vc-view x "resources")
         (wlh/workspace-add-vc-view x "translate"))

  (other-window 1)
  (window-resize (selected-window) 1 -100))

(defun my-action-2 (x) (message "action-2: %s" x))

(defun my-action-3 (x) (message "action-3: %s" x))

(defun wlh/workspace-search ()
  (interactive)
  (ivy-read "test: " wlh/workspace-list
            :action '(1 ("o" wlh/workspace-action-1 "action 1")
                        ("j" my-action-2 "action 2")
                        ("k" my-action-3 "action 3"))))
