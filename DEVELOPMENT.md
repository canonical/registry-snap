# Promoting past edge

There's no workflows for this. Once a PR is merged to main and the workflows all pass, it should be safe to promote.

```
snapcraft export-login --snaps registry --expires 2026-05-01 snapcraft-registry-login.auth
SNAPCRAFT_STORE_CREDENTIALS=$(cat <snapcraft-registry-login.auth) snapcraft promote registry --from-channel latest/edge --to-channel latest/stable
```

# Rotating Tokens

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
- Publish to 3.1 tracks
- Review by other humans
- Require action pinning in repo settings once https://github.com/canonical/data-platform-workflows/issues/368 is fixed
- Pin all actions
- Node js 20 actions issues
- Add promotion workflows
- Transfer to Canonical ownership
