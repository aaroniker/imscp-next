<!DOCTYPE html>
<html>
<head>

    <title>{TR_PAGE_TITLE}</title>
    <meta charset="{THEME_CHARSET}">
    <meta name="robots" content="nofollow, noindex">
    <link rel="shortcut icon" href="{THEME_ASSETS_PATH}/images/favicon.ico">

    <link rel="stylesheet" href="https://rsms.me/inter/inter.css">
    <link rel="stylesheet" href="{THEME_ASSETS_PATH}/css/jquery-ui.css">
    <link rel="stylesheet" href="{THEME_ASSETS_PATH}/css/simple.css">
    <link rel="stylesheet" href="{THEME_ASSETS_PATH}/css/style.min.css">

    <script>
        imscp_i18n = {JS_TRANSLATIONS};
    </script>
    <script src="{THEME_ASSETS_PATH}/js/jquery/jquery.js"></script>
    <script src="{THEME_ASSETS_PATH}/js/jquery/jquery-ui.js"></script>
    <script src="{THEME_ASSETS_PATH}/js/imscp.js"></script>

</head>
<body class="simple">
    <section>

        <!-- BDP: header_block -->
        <h1>i-MSCP</h1>
        <!-- EDP: header_block -->

        <!-- BDP: page_message -->
        <div id="notice" class="{MESSAGE_CLS}">{MESSAGE}</div>
        <!-- EDP: page_message -->

        {LAYOUT_CONTENT}

        <a class="copyright" href="{productLink}" target="blank">{productCopyright}</a>

    </section>
</body>
</html>
