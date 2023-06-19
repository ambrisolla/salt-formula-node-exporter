create_service_user:
  user.present:
    - name: prometheus
      shell: /sbin/nologin