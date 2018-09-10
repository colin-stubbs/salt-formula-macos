{% from "macos/map.jinja" import macos_settings with context %}

{# configure bluetooth service/s #}

kill-blued:
  cmd.run:
    - name: killall -HUP blued
    - onlyif: ps aux | pgrep blued

{# EOF #}
