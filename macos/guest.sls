{% from "macos/map.jinja" import macos_settings with context %}

{# ensure the guest user is disabled and removed #}

remove-guest-home:
  file.absent:
    - name: /Users/Guest

{# EOF #}
