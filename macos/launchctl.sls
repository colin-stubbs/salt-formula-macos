{% from "macos/map.jinja" import macos_settings with context %}

{# iterate thru services and make sure they're set the way we'd like them to be #}

{# This exists for the following reason,
 #
 # [root@desktop file_root]# salt 'macos.lab.routedlogic.net' launchctl.get_all
 # macos.lab.routedlogic.net:
 #     'launchctl' __virtual__ returned False: Failed to load the mac_service module:
 #     Not available on El Capitan, uses mac_service.py
 #
 #
 # -------------------------------------------
 # Summary
 # -------------------------------------------
 # # of minions targeted: 1
 # # of minions returned: 1
 # # of minions that did not return: 0
 # # of minions with errors: 1
 # -------------------------------------------
 #}

{% if 'launchctl' in macos_settings %}

{% for command, command_config in macos_settings.launchctl.items() %}

{% set command_args = command_config.args|default('') %}

{% for service in command_config.service_list %}
launchctl-{{ command }}-{{ service }}:
  cmd.run:
    - name: launchctl {{ command }} {{ command_args }} {{ service }}
    {% if 'onlyif' in command_config %}
    - onlyif: {{ command_config.onlyif }}
    {% endif %}
{% endfor %}

{% endfor %}

{% endif %}

{# EOF #}
