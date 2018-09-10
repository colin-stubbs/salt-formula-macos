{% from "macos/map.jinja" import macos_settings with context %}

include:
  - macos.bluetooth
  - macos.defaults
  - macos.firewall
  - macos.gatekeeper
  - macos.guest
  - macos.nfs
  - macos.ntp
  - macos.pwpolicy
  - macos.screensaver
  - macos.sudo
  - macos.systemsetup
  - macos.user_template
  - macos.xcode

{# EOF #}
