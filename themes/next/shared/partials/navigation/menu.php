<?php

$icons = [
    'general' => 'monitor',
    'manage_users' => 'people',
    'webtools' => 'browser',
    'statistics' => 'pie-chart-2',
    'support' => 'question-mark-circle',
    'settings' => 'settings',
    'profile' => 'person',
    'domains' => 'globe-3',
    'ftp' => 'cloud-upload',
    'database' => 'layers',
    'email' => 'at',
    'hosting_plans' => 'briefcase'
];

echo '<ul>';
foreach(clone iMSCP_Registry::get('navigation') as $obj) {
    if($obj->_visible) {

        echo $obj->_active || $obj->_uri == $_SERVER['REQUEST_URI'] || count(array_filter($obj->_pages, function($r) {
            return $r->_active || $r->_uri == $_SERVER['REQUEST_URI'];
        })) ? '<li class="active opened">' : '<li>';

        echo '<a href="'.$obj->_uri.'">';
        echo isset($icons[$obj->_class]) ? '<i data-eva="'.$icons[$obj->_class].'" data-eva-fill="currentColor"></i>' : '<i data-eva="arrow-right-outline" data-eva-fill="currentColor"></i>';
        echo $obj->_label;
        echo '</a>';

        if(count($obj->_pages)) {
            echo '<span></span><ul>';
            foreach($obj->_pages as $sub) {
                if($sub->_visible) {
                    echo $sub->_active || $sub->_uri == $_SERVER['REQUEST_URI'] ? '<li class="active">' : '<li>';
                    echo '<a href="'.$sub->_uri.'">'.$sub->_label.'</a>';
                    echo '</li>';
                }
            }
            echo '</ul>';
        }

        echo '</li>';
    }
}
echo '</ul>';

?>
