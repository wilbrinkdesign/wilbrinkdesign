### /etc/ansible/hosts

**Linux hosts group**

```bash
[linux]
<ip>

[linux:vars]
ansible_user=<user>
ansible_password=<password>
```

**Windows Domain hosts group**

```bash
[windows_domain]
<fqdn>

[windows_domain:vars]
ansible_user=<user>
ansible_password=<password>
ansible_connection=winrm
ansible_winrm_transport=kerberos
ansible_winrm_ca_trust_path=<path_cert>
```

**Windows Workgroup hosts group**

```bash
[windows_workgroup]
<dns>

[windows_workgroup:vars]
ansible_user=<user>
ansible_password=<password>
ansible_connection=winrm
ansible_winrm_server_cert_validation=ignore
```