{% from "macos/map.jinja" import macos_settings with context %}

{# enforce MacOS user template so that new users will receive defaults we want them to receive on first login #}

{% if 'user_template' in macos_settings and 'source' in macos_settings.user_template %}
{#
 #
 # Manage /System/Library/User Template/ content, which controls many default user settings
 #
 # This creates CIS compliant defaults for new users one first login when their profile is first created/duped from the template
 #
 # Relevant to the following requirements:
 #  - N
 #
 # NOTE: Users may change their defaults to non-compliant values after profile creation.
 #
 #}
user_template:
  file.recurse:
    - name: {{ macos_settings.lookup.locations.user_template }}
    - source: {{ macos_settings.user_template.source }}
    - clean: {{ macos_settings.user_template.clean|default(False) }}
    - include_empty: True
    - user: root
    - group: wheel
    - dir_mode: 0700
    - file_mode: 0600
    {% for option, value in macos_settings.user_template.options %}
    - {{ option }}: {{ value }}
    {% endfor %}
{% endif %}

{# EOF #}
