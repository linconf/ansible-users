# Ansible Role: users

[![Build Status](https://travis-ci.org/linconf/ansible-users.svg?branch=master)](https://travis-ci.org/linconf/ansible-users)
[![Ansible Galaxy](https://img.shields.io/badge/docs-ansible-users-blue.svg)](http://linconf.com/ansible-users/)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-linconf.users-660198.svg)](https://galaxy.ansible.com/linconf/users/)

An Ansible Role that manages users and groups on Debian/Ubuntu and RHEL/CentOS.

## Installation

```
ansible-galaxy install linconf.users
```

## Example Playbooks

**Add a User**

```
- hosts: localhost
  roles:
    - linconf.users
  vars:
    users_accounts:
      - name: 'NewUser'
        group: 'NewUser'
        # Additional Groups
        groups: ['wheel', 'users']
        password: '$6$c6pQJ3kzW80oZwTi$...'
        update_password: 'always'
```

See the [Ansible user module](http://docs.ansible.com/ansible/user_module.html) for a full list of available options.

Password hash created using: `mkpasswd --method=SHA-512`

**Remove a User**

```
users_accounts:
  - name: 'NewUser'
    state: absent
```

**Add a Group**

```
users_groups:
  - name: 'NewGroup'
```

Whenever you add a user to a group that doesn't yet exist on the system (using
the `groups:` option of `users_accounts`) you must also use `users_groups` to
add the group to the system.

**Additional Options**

See the [linconf.users documentation](http://linconf.com/ansible-users/) for a full list of available options.

Optionally, this role has 3 lists for users, and 3 lists for groups. This can be useful in 
situations where groups of hosts share the same users.

- `users_accounts: []`
- `users_host_accounts: []`
- `users_group_accounts: []`
- `users_groups: []`
- `users_host_groups: []`
- `users_group_groups: []`


## Dependencies / Requirements

- None

## Testing

The master branch is continuously validated by Travis-CI.

Minor versions indicate the role passed local testing as described by the
`.kitchen` declaration. Instructions for performing test-kitchen runs locally
are detailed in the [LinConf Documentation](http://linconf.com/about/methodology/).

## Author and License

Chad Sheets - [GitHub](https://github.com/cjsheets) | [Blog](http://chadsheets.com/) | [Email](mailto:chad@linconf.com)

Released under the [MIT License](https://tldrlegal.com/license/mit-license)

[![Analytics](https://cjs-beacon.appspot.com/UA-10006093-3/github/linconf/ansible-users?pixel)](https://github.com/linconf/ansible-users)