(defvar wlh/workspace-list '("~/" "~/Desktop/" "~/Documents/" "~/Downloads/" "~/www/project/arsia/arsia_3.0.0_allibert/" "~/www/project/arsia/arsia_3.0.0_carrefour_market/" "~/www/project/arsia/arsia_3.0.0_standard/" "~/www/project/arsia/arsia_3.0.3_allibert/" "~/www/project/arsia/arsia_3.0.x_gun/" "~/www/project/arsia/arsia_3.1.0_standard/" "~/www/project/arsia/arsia_3.2.x_standard/" "~/www/project/businessmanager/" "~/www/project/easy3p/easy3p_2.18/" "~/www/project/easy3p/easy3p_2.19/" "~/www/project/easy3p/easy3p_3.0/" "~/www/project/easy3p/easy3p_3.1/" "~/www/project/easy3p/easy3p_3.2/" "~/www/project/easy3p/easy3p_3.2_ao/" "~/www/project/easy3p/easy3p_3.2_lot2/" "~/www/project/easy3p/easy3p_3.3/" "~/www/project/goaland_siteweb/goaland_siteweb_6.0.0/" "~/www/project/lifechecker/" "~/www/project/rb_3d/rb_3d_1.0/" "~/www/project/rb_siteweb/rb_siteweb_1.2/" "~/www/project/rb_siteweb/rb_siteweb_1.3/" "~/www/project/rb_siteweb/rb_siteweb_1.4/" "~/www/temp/"))

(defun wlh/workspace-action-1 (x)
  (interactive)
  (delete-other-windows)
  (if (file-exists-p (concat x "dev"))
      (progn (message "action-1: %s" x)
             (vc-dir (concat x "dev"))
             (hrs/split-window-below-and-switch)
             (if (file-exists-p (concat x "deploy_template"))
                 (progn (message "action-1: %s" x)
                        (vc-dir (concat x "deploy_template"))
                        (if (file-exists-p (concat x "pimdatamanager"))
                            (progn (hrs/split-window-below-and-switch)
                                   (message "action-1: %s" x)
                                   (vc-dir (concat x "pimdatamanager")
                                           (if (file-exists-p (concat x "pimdatamanager_deploy_template"))
                                               (progn (hrs/split-window-below-and-switch)
                                                      (message "action-1: %s" x)
                                                      (vc-dir (concat x "pimdatamanager_deploy_template")))
                                             (message "ko"))))
                          (message "ko")))
               (message "ko")))
    (message "ko"))
  (balance-windows)
  (hrs/split-window-right-and-switch)
  (evil-window-move-far-right)
  (find-file x)
  (window-resize (selected-window) 1 -100))

(defun my-action-2 (x) (message "action-2: %s" x))
(defun my-action-3 (x) (message "action-3: %s" x))
(defun wlh/workspace-search ()
  (interactive)
  (ivy-read "test: " wlh/workspace-list
            :action '(1 ("o" wlh/workspace-action-1 "action 1")
                        ("j" my-action-2 "action 2")
                        ("k" my-action-3 "action 3"))))