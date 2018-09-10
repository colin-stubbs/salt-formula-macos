{% from "macos/map.jinja" import macos_settings with context %}

{# iterate thru defaults and make sure they're set the way we'd like them to be #}

{% if 'defaults' in macos_settings %}

{% if 'delete' in macos_settings.defaults %}
{% for domain, domain_keys in macos_settings.defaults.delete.items() %}
{% for key in domain_keys %}
{{ domain }}-{{ key }}:
  mac_defaults.absent:
    - name: {{ key }}
    - domain: {{ domain }}
    {# TODO - add unless/onlyif checks because mac_defaults module/state doesn't do it already ? #}
{% endfor %}
{% endfor %}
{% endif %}

{% if 'write' in macos_settings.defaults %}
{% for domain, domain_keys in macos_settings.defaults.write.items() %}
{% for key, value_config in domain_keys.items() %}
{% if 'value' in value_config and 'type' in value_config %}
{{ domain }}-{{ key }}:
  mac_defaults.write:
    - name: {{ key }}
    - domain: {{ domain }}
    - value: {{ value_config.value }}
    - vtype: {{ value_config.type }}
    {% if 'user' in value_config %}
    - user: {{ value_config.user }}
    {% endif %}
    {# TODO - add unless/onlyif checks because mac_defaults module/state doesn't do it already ? #}
{% endif %}
{% endfor %}
{% endfor %}
{% endif %}

{% endif %}

{# EOF #}
