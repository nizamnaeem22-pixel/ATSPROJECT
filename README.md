# ATSPROJECT

Application Tracking System (ATS) baseline requirements and Gitflow workflow.

## Requirements baseline

The initial ATS stories and acceptance scenarios are in [docs/features/ats-baseline.feature](docs/features/ats-baseline.feature). Estimates use Fibonacci story points. Each story and each scenario has its own estimate; scenario estimates are not added to calculate the story estimate.

## Branch workflow

This repository uses Gitflow with `main` for production-ready releases and `develop` for integration. Work on the baseline is on `feature/ats-baseline-stories`, branched from `develop`. See [docs/GITFLOW.md](docs/GITFLOW.md) for branch naming, merge paths, and release steps.