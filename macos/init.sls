{% from "macos/map.jinja" import macos_settings with context %}

include:
  - macos.banner
  - macos.bluetooth
  - macos.defaults
  - macos.firewall
  - macos.gatekeeper
  - macos.guest
  - macos.logging
  - macos.nfs
  - macos.ntp
  - macos.pmset
  - macos.pwpolicy
  - macos.screensaver
  - macos.system_integrity_protection
  - macos.sudo
  - macos.systemsetup
  - macos.user_template
  - macos.xcode

{# EOF #}
