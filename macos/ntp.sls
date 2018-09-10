{% from "macos/map.jinja" import macos_settings with context %}

{# configure MacOS NTP & time sync features #}

{# no longer required on high sierra,

ntp-restrict:
  file.managed:
    - name: /private/etc/ntp-restrict.conf
    - source: salt://macos/files/private/etc/ntp-restrict.conf
    - template: jinja
    - user: root
    - group: wheel
    - mode: 0644
 #}

{# TODO: systemsetup -setnetworktimeserver SERVER/S #}

restart-timed:
  cmd.run:
    - name: 'launchctl stop com.apple.timed && sleep 2 && launchctl start com.apple.timed'
    - onchanges:
      - file: ntp-restrict

{# EOF #}
