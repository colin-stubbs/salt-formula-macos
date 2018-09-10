{% from "macos/map.jinja" import macos_settings with context %}

{# set system options using systemsetup #}

{# WARNING: Some systemsetup -set/-get commands will hang and cause the minion to hang
 #
 # e.g. On High Sierra/10.13 -set/getremotelogin on/off will hang. Avoid using.
 #
 #}

{% if 'systemsetup' in macos_settings %}

{% for option, option_value in macos_settings.systemsetup.items() %}
systemsetup-{{ option }}-{{ option_value }}:
  cmd.run:
    - name: 'systemsetup -set{{ option }} {{ option_value }}'
    - unless: 'systemsetup -get{{ option }} | grep -i ": {{ option_value }}$"'
{% endfor %}

{% endif %}

{# EOF #}
