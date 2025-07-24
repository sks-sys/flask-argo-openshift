- hosts: ec2
  become: yes
  tasks:
    - name: Update all packages
      yum:
        name: "*"
        state: latest
      when: ansible_os_family == "RedHat"

    - name: Install Docker
      yum:
        name: docker
        state: present
      when: ansible_os_family == "RedHat"

    - name: Start and enable Docker service
      systemd:
        name: docker
        state: started
        enabled: yes

    - name: Install OpenShift CLI (oc)
      get_url:
        url: https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz
        dest: /tmp/oc.tar.gz
        mode: '0755'
      register: download_oc

    - name: Extract oc binary
      unarchive:
        src: /tmp/oc.tar.gz
        dest: /usr/local/bin/
        remote_src: yes
        extra_opts: [--strip-components=1]
      when: download_oc is changed

    - name: Ensure oc is executable
      file:
        path: /usr/local/bin/oc
        mode: '0755'
