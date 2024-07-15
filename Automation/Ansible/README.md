### Disable host checking (testing purposes only)

*/etc/ansible/ansible.cfg*

```bash
host_key_checking = False
```

### Set Windows Domain in Linux

*/etc/krb5.conf*

```bash
default_realm = <DOMAIN.LOCAL>
```

### Configure Remoting 4 Ansible on Windows

[WinRM\Activate HTTPS listener.ps1](https://raw.githubusercontent.com/wilbrinkdesign/Automation/main/WinRM/Activate%20HTTPS%20listener.ps1)

### Get Kerberos ticket and use this to run Ansible Playbooks with

```bash
kinit <username>@<DOMAIN>
```

### Cmd Ansible ping/playbooks

```bash
ansible <windows_group> -m win_ping
ansible <linux_group> -m ping
ansible-playbook <playbook>.yml
```