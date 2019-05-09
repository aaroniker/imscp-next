<?php
    $domainProperties = get_domain_default_props($_SESSION['user_id']);
    list($subdomainCount, $domainAliasCount, $mailAccountsCount, $ftpAccountsCount, $sqlDatabasesCount, $sqlUsersCount) = get_customer_objects_counts($_SESSION['user_id']);
    function numLimitMessage($num, $limit) {
        if($limit == -1) {
            return '<i data-eva="close-circle" data-eva-fill="currentColor"></i>'.tr('Disabled');
        }
        if($limit == 0) {
            return $num . ' / ∞';
        }
        return $num . ' / ' . $limit;
    }
    function getBackupFeatureStatus($domainProperties) {
        if(customerHasFeature('backup')) {
            $domainProperties['allowbackup'] = explode('|', $domainProperties['allowbackup']);
            $bkTranslation = [];
            foreach($domainProperties['allowbackup'] as $bkvalue) {
                switch($bkvalue) {
                    case 'dmn':
                        $bkTranslation[] = tr('Domains');
                        break;
                    case 'sql':
                        $bkTranslation[] = tr('SQL');
                        break;
                    case 'mail':
                        $bkTranslation[] = tr('Mail');
                        break;
                    default:
                }
            }
            if(count($bkTranslation) > 0) {
                return [
                    true,
                    '<i data-eva="checkmark-circle-2" data-eva-fill="currentColor"></i>'.implode(', ', $bkTranslation)
                ];
            } else {
                return [
                    false,
                    '<i data-eva="close-circle" data-eva-fill="currentColor"></i>'.tr('Disabled')
                ];
            }
        } else {
            return [
                false,
                '<i data-eva="close-circle" data-eva-fill="currentColor"></i>'.tr('Disabled')
            ];
        }
    }
?>

<div id="overview-stats">
    <div class="box">
        <strong>{DOMAIN_NAME}</strong>
        <span>{TR_ACCOUNT_NAME}</span>
    </div>
    <div class="box">
        <strong>{CREATE_DATE}</strong>
        <span>{TR_CREATE_DATE}</span>
    </div>
    <div class="box">
        <strong>{DOMAIN_REMAINING_TIME} {DOMAIN_EXPIRES_DATE}</strong>
        <span>{TR_DOMAIN_EXPIRES_DATE}</span>
    </div>
    <div class="box">
        <strong class="error"><?=numLimitMessage($domainAliasCount, $domainProperties['domain_alias_limit']); ?></strong>
        <span>{TR_DOMAIN_ALIASES_FEATURE}</span>
    </div>
    <div class="box">
        <strong class="error"><?=numLimitMessage($subdomainCount, $domainProperties['domain_subd_limit']); ?></strong>
        <span>{TR_SUBDOMAINS_FEATURE}</span>
    </div>
    <div class="box">
        <strong class="error"><?=numLimitMessage($ftpAccountsCount, $domainProperties['domain_ftpacc_limit']); ?></strong>
        <span>{TR_FTP_ACCOUNTS_FEATURE}</span>
    </div>
    <div class="box">
        <strong class="error"><?=numLimitMessage($mailAccountsCount, $domainProperties['domain_mailacc_limit']); ?></strong>
        <span>{TR_MAIL_ACCOUNTS_FEATURE}</span>
    </div>
    <div class="box">
        <strong>{EMAIL_QUOTA_STATUS}</strong>
        <span>{TR_MAIL_QUOTA}</span>
    </div>
    <div class="box">
        <strong class="error"><?=numLimitMessage($sqlDatabasesCount, $domainProperties['domain_sqld_limit']); ?></strong>
        <span>{TR_SQL_DATABASES_FEATURE}</span>
    </div>
    <div class="box">
        <strong class="error"><?=numLimitMessage($sqlUsersCount, $domainProperties['domain_sqlu_limit']); ?></strong>
        <span>{TR_SQL_USERS_FEATURE}</span>
    </div>
    <div class="box">
        <strong class="<?=customerHasFeature('php') ? 'success' : 'error'; ?>">
            <?=customerHasFeature('php') ? '<i data-eva="checkmark-circle-2" data-eva-fill="currentColor"></i>'.tohtml(tr('Enabled')) : '<i data-eva="close-circle" data-eva-fill="currentColor"></i>'.tohtml(tr('Disabled')); ?>
        </strong>
        <span>{TR_PHP_SUPPORT_FEATURE}</span>
    </div>
    <div class="box">
        <strong class="<?=customerHasFeature('php_editor') ? 'success' : 'error'; ?>">
            <?=customerHasFeature('php_editor') ? '<i data-eva="checkmark-circle-2" data-eva-fill="currentColor"></i>'.tohtml(tr('Enabled')) : '<i data-eva="close-circle" data-eva-fill="currentColor"></i>'.tohtml(tr('Disabled')); ?>
        </strong>
        <span>{TR_PHP_DIRECTIVES_EDITOR_SUPPORT_FEATURE}</span>
    </div>
    <div class="box">
        <strong class="<?=customerHasFeature('cgi') ? 'success' : 'error'; ?>">
            <?=customerHasFeature('cgi') ? '<i data-eva="checkmark-circle-2" data-eva-fill="currentColor"></i>'.tohtml(tr('Enabled')) : '<i data-eva="close-circle" data-eva-fill="currentColor"></i>'.tohtml(tr('Disabled')); ?>
        </strong>
        <span>{TR_CGI_SUPPORT_FEATURE}</span>
    </div>
    <div class="box">
        <strong class="<?=customerHasFeature('custom_dns_records') ? 'success' : 'error'; ?>">
            <?=customerHasFeature('custom_dns_records') ? '<i data-eva="checkmark-circle-2" data-eva-fill="currentColor"></i>'.tohtml(tr('Enabled')) : '<i data-eva="close-circle" data-eva-fill="currentColor"></i>'.tohtml(tr('Disabled')); ?>
        </strong>
        <span>{TR_CUSTOM_DNS_RECORDS_FEATURE}</span>
    </div>
    <div class="box">
        <strong class="<?=customerHasFeature('external_mail') ? 'success' : 'error'; ?>">
            <?=customerHasFeature('external_mail') ? '<i data-eva="checkmark-circle-2" data-eva-fill="currentColor"></i>'.tohtml(tr('Enabled')) : '<i data-eva="close-circle" data-eva-fill="currentColor"></i>'.tohtml(tr('Disabled')); ?>
        </strong>
        <span>{TR_EXTERNAL_MAIL_SERVER_FEATURE}</span>
    </div>
    <div class="box">
        <strong class="<?=customerHasFeature('aps') ? 'success' : 'error'; ?>">
            <?=customerHasFeature('aps') ? '<i data-eva="checkmark-circle-2" data-eva-fill="currentColor"></i>'.tohtml(tr('Enabled')) : '<i data-eva="close-circle" data-eva-fill="currentColor"></i>'.tohtml(tr('Disabled')); ?>
        </strong>
        <span>{TR_APP_INSTALLER_FEATURE}</span>
    </div>
    <div class="box">
        <strong class="<?=customerHasFeature('webstats') ? 'success' : 'error'; ?>">
            <?=customerHasFeature('webstats') ? '<i data-eva="checkmark-circle-2" data-eva-fill="currentColor"></i>'.tohtml(tr('Enabled')) : '<i data-eva="close-circle" data-eva-fill="currentColor"></i>'.tohtml(tr('Disabled')); ?>
        </strong>
        <span>{TR_WEBSTATS_FEATURE}</span>
    </div>
    <div class="box">
        <strong class="<?=getBackupFeatureStatus($domainProperties)[0] ? 'success' : 'error'; ?>">
            <?=getBackupFeatureStatus($domainProperties)[1]; ?>
        </strong>
        <span>{TR_BACKUP_FEATURE}</span>
    </div>
    <div class="box">
        <strong>{TRAFFIC_PERCENT}% <small>{TRAFFIC_USAGE_DATA}</small></strong>
        <span>{TR_TRAFFIC_USAGE}</span>
    </div>
    <div class="box">
        <strong>{DISK_PERCENT}% <small>{DISK_USAGE_DATA}</small></strong>
        <span>{TR_DISK_USAGE}</span>
    </div>
    <div class="box">
        <strong>{DISK_FILESIZE}</strong>
        <span>{TR_DISK_FILE_USAGE}</span>
    </div>
    <div class="box">
        <strong>{DISK_SQLSIZE}</strong>
        <span>{TR_DISK_DATABASE_USAGE}</span>
    </div>
    <div class="box">
        <strong>{DISK_MAILSIZE}</strong>
        <span>{TR_DISK_MAIL_USAGE}</span>
    </div>
</div>
