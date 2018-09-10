{% from "macos/map.jinja" import macos_settings with context %}

{# configure MacOS sudo in a basic way (harden it) #}

/private/etc/sudoers:
  file.managed:
    - source: salt://macos/files/private/etc/sudoers
    - template: jinja
    - user: root
    - group: wheel
    - mode: 0440

{# EOF #}
