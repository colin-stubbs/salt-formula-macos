{% from "macos/map.jinja" import macos_settings with context %}

{# configure MacOS Power Management Policy #}

restart-timed:
  cmd.run:
    - name: 'pmset -a womp 0'

{# EOF #}
