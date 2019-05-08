# Information

Still heavily work in progress, so it may looks a bit unfinished.

If there is **broken functionality** please report [under issues](https://github.com/aaroniker/imscp-next/issues).

## How to use

* Download & copy the `themes/next` folder to `/var/www/imscp/gui/themes`
* Set `USER_INITIAL_THEME` in your `/etc/imscp/imscp.conf` from `default` to `next`

## Development

* Set `DEBUG = 1` in your `/etc/imscp/imscp.conf`
* Set `opcache.enable = 0` in your `/usr/local/etc/imscp_panel/php.ini`
* Restart the `imscp_panel` with `service imscp_panel restart`
* Edit the files in `/var/www/imscp/gui/themes/next`
