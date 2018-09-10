{% from "macos/map.jinja" import macos_settings with context %}

{# configure MacOS logging & auditing features #}

{# 3.1.1 Retain system.log for 90 or more days #}
{# 3.1.2 Retain appfirewall.log for 90 or more days #}
/private/etc/asl.conf:
  file.managed:
    - source: salt://macos/files/private/etc/asl.conf
    - template: jinja
    - user: root
    - group: wheel
    - mode: 0644

{# 3.1.3 Retain authd.log for 90 or more days #}
/private/etc/asl/com.apple.authd:
  file.managed:
    - source: salt://macos/files/private/etc/asl/com.apple.authd
    - template: jinja
    - user: root
    - group: wheel
    - mode: 0644

{# 3.2 Enable security auditing #}
load-com.apple.auditd:
  cmd.run:
    - name: launchctl load -w /System/Library/LaunchDaemons/com.apple.auditd.plist
    - unless: launchctl list | grep -i auditd

{# 3.3 Configure Security Auditing Flags #}
{# TODO - level 2 setting #}

{# 3.4 Enable remote logging for Desktops on trusted networks #}
{# TODO - level 2 setting #}

{# retain install.log for 365 or more days #}
/private/etc/asl/com.apple.install:
  file.managed:
    - source: salt://macos/files/private/etc/asl/com.apple.install
    - template: jinja
    - user: root
    - group: wheel
    - mode: 0644

{# EOF #}
