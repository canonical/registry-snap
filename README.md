# Registry snap

This is a snapcraft package for [CNCF Distribution](https://github.com/distribution/distribution) (OCI image registry)

## Usage

```bash
$ sudo snap install registry
$ curl localhost:5000/v2/_catalog
```

## Configuration

The configuration file is available at `/var/snap/registry/common/config.yaml`.

```bash
$ sudo vim /var/snap/registry/common/config.yaml
$ sudo snap restart registry
```
