{% from "macos/map.jinja" import macos_settings with context %}

{# configure firewall #}

{# 2.6.4 Enable Firewall Stealth Mode #}
firewall-stealth-mode:
  cmd.run:
    - name: /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on
    - unless: /usr/libexec/ApplicationFirewall/socketfilterfw --getstealthmode | grep -i "stealth mode enabled"

{# EOF #}
