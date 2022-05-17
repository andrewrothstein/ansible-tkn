andrewrothstein.tkn
=========

![Build Status](https://github.com/andrewrothstein/ansible-tkn/actions/workflows/build.yml/badge.svg)

Installs the Tekton cli [tkn](https://github.com/tektoncd/cli).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.tkn
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
