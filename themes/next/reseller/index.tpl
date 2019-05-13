<?php
    $resellerProperties = imscp_getResellerProperties($_SESSION['user_id']);
?>

<div id="overview-stats">
    <div class="box">
        <strong>{DMN_MSG}</strong>
        <span>{DOMAINS}</span>
    </div>
    <div class="box">
        <strong>{SUB_MSG}</strong>
        <span>{SUBDOMAINS}</span>
    </div>
    <div class="box">
        <strong>{ALS_MSG}</strong>
        <span>{ALIASES}</span>
    </div>
    <div class="box">
        <strong>{MAIL_MSG}</strong>
        <span>{MAIL_ACCOUNTS}</span>
    </div>
    <div class="box">
        <strong>{FTP_MSG}</strong>
        <span>{TR_FTP_ACCOUNTS}</span>
    </div>
    <div class="box">
        <strong>{SQL_DB_MSG}</strong>
        <span>{SQL_DATABASES}</span>
    </div>
    <div class="box">
        <strong>{SQL_USER_MSG}</strong>
        <span>{SQL_USERS}</span>
    </div>
    <div class="box">
        <strong class="<?=($resellerProperties['support_system'] == 'yes') ? 'success' : 'error'; ?>">
            <?=($resellerProperties['support_system'] == 'yes') ? '<i data-eva="checkmark-circle-2"></i>'.tohtml(tr('Enabled')) : '<i data-eva="close-circle"></i>'.tohtml(tr('Disabled')); ?>
        </strong>
        <span>{TR_SUPPORT}</span>
    </div>
    <div class="box">
        <strong class="<?=($resellerProperties['php_ini_system'] == 'yes') ? 'success' : 'error'; ?>">
            <?=($resellerProperties['php_ini_system'] == 'yes') ? '<i data-eva="checkmark-circle-2"></i>'.tohtml(tr('Enabled')) : '<i data-eva="close-circle"></i>'.tohtml(tr('Disabled')); ?>
        </strong>
        <span>{TR_PHP_EDITOR}</span>
    </div>
    <div class="box">
        <strong class="<?=($resellerProperties['software_allowed'] == 'yes') ? 'success' : 'error'; ?>">
            <?=($resellerProperties['software_allowed'] == 'yes') ? '<i data-eva="checkmark-circle-2"></i>'.tohtml(tr('Enabled')) : '<i data-eva="close-circle"></i>'.tohtml(tr('Disabled')); ?>
        </strong>
        <span>{TR_APS}</span>
    </div>
    <div class="box">
        <strong>{TRAFFIC_PERCENT}% <small>{TRAFFIC_USAGE_DATA}</small></strong>
        <span>{TR_TRAFFIC_USAGE}</span>
    </div>
    <div class="box">
        <strong>{DISK_PERCENT}% <small>{DISK_USAGE_DATA}</small></strong>
        <span>{TR_DISK_USAGE}</span>
    </div>
</div>
