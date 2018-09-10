{% from "macos/map.jinja" import macos_settings with context %}

{# configure SIP #}

sip-enable:
  cmd.run:
    - name: 'csrutil enable'
    - unless: 'csrutil status | grep -i "status: enabled"'

{# EOF #}
