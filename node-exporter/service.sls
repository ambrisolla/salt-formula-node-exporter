{% from 'salt-formula-node-exporter/node-exporter/map.jinja' import config with context %}

configure_systemd_file:
  file.managed:
    - source: salt://{{ tpldir }}/files/node-exporter.service
    - name: /etc/systemd/system/node-exporter.service
    - template: jinja
    - defaults:
        arch: {{ config.arch }}
        version: {{ config.version }}
        port: {{ config.port }}

configure_systemd:
  service.running:
    - name: node-exporter
    - enable: True
    - watch:
      - file: /etc/systemd/system/node-exporter.service