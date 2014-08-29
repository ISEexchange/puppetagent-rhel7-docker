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


OVAL vulnerability scan
-----------------------

This image runs a vulnerability scan during `docker build`.
You can also perform the scan inside a running container via:

    /oval/oval-vulnerability-scan.sh

See https://github.com/jumanjihouse/oval for details.


FAQ
---

**What is inside the secrets dir?**

    secrets/
    |-- etc-pki-entitlement
    |   |-- 2896949744472165499-key.pem
    |   |-- 2896949744472165499.pem
    |   |-- 365563431994835044-key.pem
    |   `-- 365563431994835044.pem
    `-- rhel7.repo


**How can I create my own secrets?**

See https://access.redhat.com/articles/881893 and
https://access.redhat.com/documentation/en-US/Red_Hat_Subscription_Management/
