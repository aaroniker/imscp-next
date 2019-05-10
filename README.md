# I-MSCP Next

![iMSCP Theme Next](https://aaroniker.me/overview.png)

## Important

Still heavily work in progress, so it may looks a bit unfinished.  
If there is **broken functionality** or layout issues (maybe broken layout for some languages because of the translation) please report [under issues](https://github.com/aaroniker/imscp-next/issues).

## How to use

* Download & copy the `themes/next` folder to `/var/www/imscp/gui/themes`
* Set `USER_INITIAL_THEME` in your `/etc/imscp/imscp.conf` from `default` to `next`

## Copyright

I added my personal logo to the bottom at the login page & the sidebar - it's to support me a bit, if you want to remove it, follow these steps:
* Remove `<a class="aaroniker" ...>...</a>` at `themes/next/shared/layouts/simple.tpl` at line 48
* Remove `<a class="aaroniker" ...>...</a>` at `themes/next/shared/layouts/ui.tpl` at line 44

## Known bugs

* `Profile -> Layout` settings doenst affect the theme yet
* ...

## Development

* Set `DEBUG = 1` in your `/etc/imscp/imscp.conf`
* Set `opcache.enable = 0` in your `/usr/local/etc/imscp_panel/php.ini`
* Restart the `imscp_panel` with `service imscp_panel restart`
* Edit the files in `/var/www/imscp/gui/themes/next`

## Credis

* [Eva Icons](https://akveo.github.io/eva-icons/#/)
* [DataTables](https://datatables.net/)

## Author

**Aaron Iker** - [Twitter](https://twitter.com/aaroniker_me) - [Website](https://aaroniker.me/)
