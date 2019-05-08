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
            <a class="aaroniker" href="https://aaroniker.me" target="_blank">
                <svg width="32px" height="26px" viewBox="0 0 32 26" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <path fill="currentColor" d="M27.8985059,4.73539771 C28.0346959,4.8747868 28.0336531,5.09856505 27.8964203,5.23690452 L13.3366066,19.8916513 C9.94124248,23.308993 5.44342778,25.4546192 0.671147533,25.9326146 L0,26 L14.5915149,0.56191224 C15.0211494,-0.18730408 16.0954443,-0.18730408 16.5252874,0.56191224 L19.6484801,6.00690325 C20.2191015,6.99375276 20.9955721,7.47405731 22.0208553,7.47405731 L22.0212724,7.47405731 C24.143375,7.47363747 26.6329611,5.41282026 27.4131857,4.71650462 C27.553964,4.59118039 27.7666957,4.6002071 27.8985059,4.73539771 L27.8985059,4.73539771 Z M27.6697712,18.675336 C26.7339319,17.0923676 26.661026,15.3861591 27.4531852,13.6039664 C27.8739931,12.6571831 28.4408261,11.9354378 28.7486512,11.5821635 C28.8705874,11.441853 28.860355,11.2353427 28.7271205,11.1052328 L28.7249887,11.1033593 C28.5838667,10.9655469 28.3549165,10.9655469 28.2135813,11.1033593 L23.9349409,15.2816549 C21.1095162,18.0410245 21.3674583,22.6999979 24.7806071,24.9462143 C25.865456,25.660049 27.1636932,26 28.4717365,26 L32,26 L27.6697712,18.675336 Z"></path>
                </svg>
            </a>
        </div>
    </section>

    <section id="mobile">
        <img src="{ISP_LOGO}" alt="i-MSCP logo">
        <div class="right">
            <!-- BDP: logged_from -->
            <!-- INCLUDE "../partials/logged.php" -->
            <!-- EDP: logged_from -->
            <!-- INCLUDE "../partials/user.php" -->
            <div class="burger">
                <span></span>
                <span></span>
            </div>
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
