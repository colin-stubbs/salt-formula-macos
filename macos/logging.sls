{% from "macos/map.jinja" import macos_settings with context %}

{# configure MacOS logging & auditing features #}

{# re-check for High Sierra

/private/etc/asl.conf:
  file.managed:
    - source: salt://macos/files/private/etc/asl.conf
    - template: jinja
    - user: root
    - group: wheel
    - mode: 0644

/private/etc/asl/com.apple.authd:
  file.managed:
    - source: salt://macos/files/private/etc/asl/com.apple.authd
    - template: jinja
    - user: root
    - group: wheel
    - mode: 0644

load-com.apple.auditd:
  cmd.run:
    - name: launchctl load -w /System/Library/LaunchDaemons/com.apple.auditd.plist
    - unless: launchctl list | grep -i auditd

/private/etc/asl/com.apple.install:
  file.managed:
    - source: salt://macos/files/private/etc/asl/com.apple.install
    - template: jinja
    - user: root
    - group: wheel
    - mode: 0644

#}

{# EOF #}
