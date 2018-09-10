{% from "macos/map.jinja" import macos_settings with context %}

{# ensures xcode developer tools are installed without requiring user interaction #}

xcode-install-headless-trigger:
  file.managed:
    - name: /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
    - unless:
      - xcode-select -p | grep -i '/Library/Developer/CommandLineTools'

xcode-install:
  cmd.run:
    - name: softwareupdate -i "`softwareupdate -l | grep '\*.*Command Line' | head -n 1 | awk -F'*' '{print $2}' | sed -e 's/^ *//' | tr -d '\n'`" --verbose
    - require:
      - file: xcode-install-headless-trigger
    - onlyif:
      - test -f /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress

xcode-cleanup:
  file.absent:
    - name: /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
    - require:
      - cmd: xcode-install

{# EOF #}
