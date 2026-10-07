# Gitflow

## Branches

- `main`: production-ready code. Only release and hotfix changes are merged here.
- `develop`: integration branch and starting point for planned work.
- `feature/<story-id>-<short-description>`: one user story, branched from `develop` and merged back into `develop`.
- `release/<version>`: release stabilization branch, branched from `develop`; merge into both `main` and `develop` when ready.
- `hotfix/<version>-<short-description>`: urgent production fix, branched from `main`; merge into both `main` and `develop` when ready.

## Working agreement

1. Open a feature branch from an up-to-date `develop` branch. Keep it scoped to one cohesive work item; use its story ID in the branch name when it represents a single story. Related baseline specifications may be grouped on one branch.
2. Push the branch and open a pull request into `develop`. Require review and passing checks before merging. Delete the feature branch after merge.
3. For a release, branch `release/<version>` from `develop`. Make only release-readiness fixes there. Merge it into `main`, create a version tag, then merge the release changes back into `develop` and delete the release branch.
4. For a production hotfix, branch `hotfix/<version>-<short-description>` from `main`. After review and checks, merge into `main` and `develop`, create a version tag, and delete the hotfix branch.
5. Do not commit directly to `main` or `develop`; use pull requests so review and automated checks are part of the flow.

## Current baseline work

The ATS baseline requirements are being prepared on `feature/ats-baseline-stories`, based on `develop`. Merge this branch into `develop` through a reviewed pull request when the baseline is accepted. No release or hotfix branch is needed for this requirements-only change.

## Common commands

```sh
git switch develop
git pull --ff-only
git switch -c feature/ATS-001-application-submission

# After review and merge, start a release from develop:
git switch develop
git pull --ff-only
git switch -c release/1.0.0

# After release approval, merge release/1.0.0 into main and develop via pull requests,
# then tag the production merge:
git tag -a v1.0.0 -m "Release 1.0.0"

# Urgent production fixes start from main:
git switch main
git pull --ff-only
git switch -c hotfix/1.0.1-fix-description
```