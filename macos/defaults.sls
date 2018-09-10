{% from "macos/map.jinja" import macos_settings with context %}

{# iterate thru defaults and make sure they're set the way we'd like them to be #}

{% for domain, domain_keys in macos_settings.defaults.items() %}
{% for key, value_config in domain_keys }
{% if 'value' in value_config and 'vtype' in value_config %}
{{ domain }}-{{ key }}:
  mac_defaults.write:
    - name: {{ key }}
    - domain: {{ domain }}
    - value: {{ value_config.value }}
    - vtype: {{ value_config.type }}
    {% if 'user' in value_config %}
    - user: {{ value_config.user }}
    {% endif %}
{% endif %}
{% endfor %}
{% endfor %}

{# EOF #}
