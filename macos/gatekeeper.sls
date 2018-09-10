{% from "macos/map.jinja" import macos_settings with context %}

{# configure gatekeeper #}

spctl-master-enable:
  cmd.run:
    - name: 'spctl --master-enable'
    - unless: 'spctl --status | grep -i "assessments enabled"'

{# EOF #}
