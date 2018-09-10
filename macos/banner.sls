{% from "macos/map.jinja" import macos_settings with context %}

{# configure bluetooth service/s #}

banner-file:
  file.managed:
    - name: /Library/Security/PolicyBanner.txt
    - user: root
    - group: wheel
    - mode: 0644
    - contents: "BANNER GOES HERE"

{# EOF #}
