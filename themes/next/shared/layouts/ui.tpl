<!DOCTYPE html>
<html>
<head>

    <title>{TR_PAGE_TITLE}</title>
    <meta charset="{THEME_CHARSET}">
    <meta name="robots" content="nofollow, noindex">
    <link rel="shortcut icon" href="{THEME_ASSETS_PATH}/images/favicon.ico">

    <link rel="stylesheet" href="https://rsms.me/inter/inter.css">
    <link rel="stylesheet" href="{THEME_ASSETS_PATH}/css/jquery-ui.css">
    <link rel="stylesheet" href="{THEME_ASSETS_PATH}/css/ui.css">
    <link rel="stylesheet" href="{THEME_ASSETS_PATH}/css/style.min.css">

    <script>
        imscp_i18n = {JS_TRANSLATIONS};
    </script>
    <script src="{THEME_ASSETS_PATH}/js/jquery/jquery.js"></script>
    <script src="{THEME_ASSETS_PATH}/js/jquery/jquery-ui.js"></script>
    <script src="{THEME_ASSETS_PATH}/js/jquery/plugins/dataTables.js"></script>
    <script src="{THEME_ASSETS_PATH}/js/jquery/plugins/dataTables_naturalSorting.js"></script>
    <script src="{THEME_ASSETS_PATH}/js/jquery/plugins/pGenerator.js"></script>
    <script src="{THEME_ASSETS_PATH}/js/imscp.js"></script>
    <script src="https://unpkg.com/eva-icons"></script>

</head>
<body class="interface">

    <section id="sidebar">
        <div class="inner">
            <img src="{ISP_LOGO}" alt="i-MSCP logo">
            <nav>
                <!-- INCLUDE "../partials/navigation/menu.php" -->
            </nav>
            <ul>
                <li>i-MSCP <span>{VERSION}</span></li>
                <li>Build <span>{BUILDDATE}</span></li>
                <li>Codename <span>{CODENAME}</span></li>
            </ul>
        </div>
    </section>

    <section id="content">

        <div class="headline">
            <!-- INCLUDE "../partials/navigation/breadcrumbs.tpl" -->
            <h1>{TR_SECTION_TITLE}</h1>
        </div>

        <h2>{TR_TITLE}</h2>

        <ul>
            <!-- BDP: logged_from -->
            <li><a href="change_user_interface.php?action=go_back">{YOU_ARE_LOGGED_AS}</a></li>
            <!-- EDP: logged_from -->
            <li><a class="logout" href="/index.php?action=logout">{TR_MENU_LOGOUT}</a></li>
        </ul>

        <!-- BDP: page_message -->
        <div class="{MESSAGE_CLS}">{MESSAGE}</div>
        <!-- EDP: page_message -->

        {LAYOUT_CONTENT}

    </section>

    <script>
        eva.replace();
    </script>

</body>
</html>
