<!DOCTYPE html>
<html>
<head>
    <title>{TR_PAGE_TITLE}</title>
    <meta charset="{THEME_CHARSET}">
    <meta name="robots" content="nofollow, noindex">
    <link rel="shortcut icon" href="{THEME_ASSETS_PATH}/images/favicon.ico">
    <link rel="stylesheet" href="{THEME_ASSETS_PATH}/css/jquery-ui.css">
    <link rel="stylesheet" href="{THEME_ASSETS_PATH}/css/ui.css">
    <link rel="stylesheet" href="{THEME_ASSETS_PATH}/css/black.css">
    <script>
        imscp_i18n = {JS_TRANSLATIONS};
    </script>
    <script src="{THEME_ASSETS_PATH}/js/jquery/jquery.js"></script>
    <script src="{THEME_ASSETS_PATH}/js/jquery/jquery-ui.js"></script>
    <script src="{THEME_ASSETS_PATH}/js/jquery/plugins/dataTables.js"></script>
    <script src="{THEME_ASSETS_PATH}/js/jquery/plugins/dataTables_naturalSorting.js"></script>
    <script src="{THEME_ASSETS_PATH}/js/jquery/plugins/pGenerator.js"></script>
    <script src="{THEME_ASSETS_PATH}/js/imscp.js"></script>
</head>
<body>

    <div id="wrapper">

        <!-- INCLUDE "../partials/navigation/main_menu.tpl" -->
        <img src="{ISP_LOGO}" alt="i-MSCP logo">

        <div class="location">
            <div class="location-area">
                <h1 class="{SECTION_TITLE_CLASS}">{TR_SECTION_TITLE}</h1>
            </div>
            <ul class="location-menu">
                <!-- BDP: logged_from -->
                <li><a class="backadmin" href="change_user_interface.php?action=go_back">{YOU_ARE_LOGGED_AS}</a></li>
                <!-- EDP: logged_from -->
                <li><a class="logout" href="/index.php?action=logout">{TR_MENU_LOGOUT}</a></li>
            </ul>
            <!-- INCLUDE "../partials/navigation/breadcrumbs.tpl" -->
        </div>

        <!-- INCLUDE "../partials/navigation/left_menu.tpl" -->
        <div class="body">
            <h2 class="{TITLE_CLASS}"><span>{TR_TITLE}</span></h2>
            <!-- BDP: page_message -->
            <div class="{MESSAGE_CLS}">{MESSAGE}</div>
            <!-- EDP: page_message -->
            {LAYOUT_CONTENT}
        </div>

    </div>

    <div class="footer">
        i-MSCP {VERSION}<br>
        Build: {BUILDDATE}<br>
        Codename: {CODENAME}
    </div>

</body>
</html>
