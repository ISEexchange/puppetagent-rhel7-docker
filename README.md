Puppet Agent on RHEL7 docker image
==================================

Usage
-----

Install RHEL7 entitlements:

```
# Private repo needs auth!
git submodule update --init --recursive
```

Then...

```
docker build --rm -t puppetagent:el7 .
```
