<!-- BDP: page_message -->
<div class="{MESSAGE_CLS}">{MESSAGE}</div>
<!-- EDP: page_message -->

<!-- BDP: ftp_chooser -->
<div class="ftp_chooser">
    <ul>
        <!-- BDP: dir_item -->
        <li>
            <span data-link="{LINK}" class="ftp_choose_dir {ICON}">
                <i data-eva="corner-left-up"></i>
                <i data-eva="folder-outline"></i>
                {DIR_NAME}
            </span>
            <!-- BDP: action_link -->
            <span data-directory="{DIRECTORY}" class="ftp_choose_dir btn link sm icon-right" data-tooltip="{TOOLTIP_CHOOSE}">
                {CHOOSE}
                <i data-eva="chevron-right"></i>
            </span>
            <!-- EDP: action_link -->
        </li>
        <!-- EDP: dir_item -->
    </ul>
</div>
<!-- EDP: ftp_chooser -->
