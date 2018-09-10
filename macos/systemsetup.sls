{% from "macos/map.jinja" import macos_settings with context %}

{# set system options using systemsetup #}

{% if 'systemsetup' in macos_settings %}

{% for option, option_value in macos_settings.systemsetup.items() %}
systemsetup-{{ option }}-{{ option_value }}:
  cmd.run:
    - name: 'systemsetup -set{{ option }} {{ option_value }}'
    - unless: 'systemsetup -get{{ option }} | grep -i ": {{ option_value }}$"'
{% endfor %}

{% endif %}

{# EOF #}
