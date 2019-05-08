<!DOCTYPE html>
<html>
<head>

    <title>{TR_PAGE_TITLE}</title>

    <meta charset="{THEME_CHARSET}">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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

        <div class="toolbar">
            <div class="top">
                <!-- INCLUDE "../partials/navigation/breadcrumbs.tpl" -->
                <!-- BDP: logged_from -->
                <!-- INCLUDE "../partials/logged.php" -->
                <!-- EDP: logged_from -->
            </div>
            <div class="headline">
                <h1>{TR_SECTION_TITLE}</h1>
                <!-- INCLUDE "../partials/user.php" -->
            </div>
        </div>

        <div class="message-container">
            <!-- BDP: page_message -->
            <div class="message {MESSAGE_CLS}">{MESSAGE}</div>
            <!-- EDP: page_message -->
        </div>

        <h2>{TR_TITLE}</h2>

        {LAYOUT_CONTENT}

    </section>

    <script>
        eva.replace();
    </script>

</body>
</html>
