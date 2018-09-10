{% from "macos/map.jinja" import macos_settings with context %}

{# configure MacOS Password Policy #}

/private/var/tmp/pwpolicy.plist:
  file.managed:
    - source: salt://macos/files/private/var/tmp/pwpolicy.plist
    - template: jinja
    - user: root
    - group: wheel
    - mode: 0640

{# EOF #}
