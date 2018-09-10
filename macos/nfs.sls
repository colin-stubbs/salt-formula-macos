{% from "macos/map.jinja" import macos_settings with context %}

{# configure NFS service #}

{# 4.5 Ensure nfs server is not running #}
nfs-disable:
  cmd.run:
    - name: nfsd disable ; rm -f /etc/export
    - unless: ps -ef | grep -i nfsd || stat /etc/export

{# EOF #}
