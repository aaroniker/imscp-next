<div class="user-panel">
    <span><?=$_SESSION['user_logged']; ?></span>
    <div><?=$_SESSION['user_logged'][0]; ?></div>
    <ul>
        <li>
            <a href="/index.php?action=logout">
                <i data-eva="log-out"></i>
            </a>
        </li>
    </ul>
</div>
