# devops-cicd-security-platform

[![Development Pipeline](https://github.com/shubham34970/devops-cicd-security-platform/actions/workflows/dev-pipeline.yml/badge.svg)](https://github.com/shubham34970/devops-cicd-security-platform/actions/workflows/dev-pipeline.yml)
[![Production Pipeline](https://github.com/shubham34970/devops-cicd-security-platform/actions/workflows/prod-pipeline.yml/badge.svg)](https://github.com/shubham34970/devops-cicd-security-platform/actions/workflows/prod-pipeline.yml)

## Branching Strategy

This repository follows a structured branching strategy to manage features, releases, and environments safely:

- **`main`**: The primary branch containing the fully integrated and functional codebase. All completed feature branches are merged here.
- **`development`**: The active integration branch where new features and bug fixes are gathered and tested together before moving towards production.
- **`staging`**: The pre-production environment branch. Code is merged here for final QA, user acceptance testing (UAT), and release preparation.
- **`production`**: The stable, deployable code currently live in the production environment.
- **`feature-*`** (e.g., `feature-conflict-a`, `feature-cherry-pick`): Short-lived branches created for specific features, experiments, or bug fixes. These are branched from `development` (or `main`) and merged back once completed.

*   2ea6760 (HEAD -> main, origin/main, origin/HEAD) Merge feature-conflict-b into main
|\  
| *   e3825cb (origin/feature-conflict-b, feature-conflict-b) Merge branch 'feature-conflict-a' into feature-conflict-b - resolved conflict
| |\  
| | * 6c1302b feat: Add new change to feature A
| * | 7b80d06 feat: Add conflicting change to feature B
* | |   7ea048a Merge feature-conflict-a into main
|\ \ \  
| * | | 443e3c1 (origin/feature-conflict-a, feature-conflict-a) feat: Add new change to feature A
| * | | 7ebda3b feat: Feature A message
| * | | 050993a feat: Create demo API endpoint
* | | |   ac2222b Merge development into main
|\ \ \ \  
| * | | | 04c60dc (origin/development, development) chore: restore README
| * | | | 7740a96 chore: delete README
| * | | | dd20f4b Revert "feat: Add stash-demo endpoint"
| |/ / /  
| * | | 353e0c7 feat: Add stash-demo endpoint
| * | | 3301015 feat: add new demo API endpoint
| * | | 9d95e94 feat: Add utils.js
* | | | bc31ee8 feat: Add utils.js
* | | | 419c759 (feature-cherry-pick) feat: Add stash-demo endpoint
| |/ /  
|/| |   
* | |   79973db Merge branch 'feature-conflict-a' into feature-conflict-b
|\ \ \  
| | |/  
| |/|   
| * | b6338b0 feat: Feature A message
* | | 7c85d08 feat: Feature B message
|/ /  
* / c5974fb feat: Create demo API endpoint
|/  
* 9fea698 (origin/staging, origin/production, staging, production) Initial commit
