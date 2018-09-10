{% from "macos/map.jinja" import macos_settings with context %}

{# configure MacOS Password Policy #}

pwpolicy-accountpolicies-xml:
  file.managed:
    - name: /private/var/tmp/pwpolicy.plist
    - source: salt://macos/files/private/var/tmp/pwpolicy.plist
    - template: jinja
    - context:
      LOCKOUT: 900
      MAX_FAILED: 5
      PW_EXPIRE: 90
      MIN_LENGTH: 16
      MIN_NUMERIC: 1
      MIN_ALPHA_LOWER: 1
      MIN_UPPER_ALPHA: 1
      MIN_SPECIAL_CHAR: 1
      PW_HISTORY: 16
    - user: root
    - group: wheel
    - mode: 0640

pwpolicy-setaccountpolicies:
  cmd.run:
    - name: pwpolicy -setaccountpolicies /private/var/tmp/pwpolicy.plist
    - require:
      - file: pwpolicy-accountpolicies-xml
    - onlyif:
      - test -f /private/var/tmp/pwpolicy.plist

pwpolicy-cleanup:
  file.absent:
    - name: /private/var/tmp/pwpolicy.plist
    - require:
      - cmd: pwpolicy-setaccountpolicies

{# EOF #}
