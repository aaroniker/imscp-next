<div class="user">
    <span><?=$_SESSION['user_logged']; ?></span>
    <div><?=$_SESSION['user_logged'][0]; ?></div>
    <ul>
        <li>
            <a href="/index.php?action=logout">
                <i data-eva="log-out" data-eva-fill="currentColor"></i>
            </a>
        </li>
    </ul>
</div>
