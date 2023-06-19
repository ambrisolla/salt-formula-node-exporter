stop_service:
  service.dead:
    - name: node-exporter

remove_files:
  file.absent:
    - names:
      - /etc/systemd/system/node-exporter.service
      - /opt/node-exporter
  
systemd_reload:
  cmd.run:
    - name: systemctl --system daemon-reload
      onchanges:
        - file: /etc/systemd/system/node-exporter.service

remove_user:
  user.absent:
    - name: prometheus