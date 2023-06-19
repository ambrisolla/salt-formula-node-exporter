{% from 'salt-formula-node-exporter/node-exporter/map.jinja' import config with context %}

download-node-exporter-binary:
  file.managed:
    - source: https://github.com/prometheus/node_exporter/releases/download/v{{ config.version }}/node_exporter-{{ config.version }}.linux-{{ config.arch }}.tar.gz
    - name: /tmp/node_exporter-{{ config.version }}.linux-{{ config.arch }}.tar.gz
    - skip_verify: True

extract_node_exporter:
  archive.extracted:
    - name: /opt/node-exporter
    - source: /tmp/node_exporter-{{ config.version }}.linux-{{ config.arch }}.tar.gz
