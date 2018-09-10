{% from "macos/map.jinja" import macos_settings with context %}

include:
  - macos.defaults
  - macos.firewall
  - macos.gatekeeper
  - macos.launchctl
  - macos.logging
  - macos.ntp
  - macos.screensaver
  - macos.sudo
  - macos.systemsetup
  - macos.user_template

{# EOF #}
