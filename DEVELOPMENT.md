# Publishing to edge

Follow the instructions: https://github.com/canonical/data-platform-workflows/blob/v49.0.0/.github/workflows/release_snap_pr.md
In this case, run the below command and then copy the file contents to SNAP_STORE_TOKEN_EDGE_PR in the edge-pr environment.
```
snapcraft export-login --snaps registry --channels latest/edge/pr-* --expires 2026-10-25 snapcraft-registery-latest-edge-pr.auth
```

Follow the instructions: https://github.com/canonical/data-platform-workflows/blob/main/.github/workflows/release_snap_edge.md
In this case, run the below command and then copy the file contents to SNAP_STORE_TOKEN_EDGE in the edge environment.
```
snapcraft export-login --snaps registry --channels latest/edge --expires 2026-10-25 snapcraft-registery-latest-edge.auth
```

# TODO
- Require action pinning in repo settings once https://github.com/canonical/data-platform-workflows/issues/368 is fixed
- Add promotion workflows
