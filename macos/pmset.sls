{% from "macos/map.jinja" import macos_settings with context %}

{# configure MacOS Power Management Policy #}

disable-wake-on-lan:
  cmd.run:
    - name: 'pmset -a womp 0'

standby-delay:
  cmd.run:
    - name: 'pmset -a standbydelay 900'

{# EOF #}
