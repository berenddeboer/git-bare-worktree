---
name: git-bare-worktree
description: Create a bare Git clone with an initial worktree from an SSH repository URL. Use when setting up bare Git repositories, Git worktrees, or when the user provides an SSH repo such as git@github.com:owner/repo.git and a target directory.
---

# Git Bare Worktree Setup

## Quick Start

Use `scripts/setup-bare-worktree.sh` to create a bare Git setup from an SSH repo URL:

```bash
/home/berend/.agents/skills/git-bare-worktree/scripts/setup-bare-worktree.sh "git@github.com:jdjlnz/monorepo.git" "/home/berend/src/jdjl/monorepo"
```

This creates:

```text
~/src/jdjl/monorepo/
├── .bare/
├── .git
└── worktree1/
```

## Workflow

1. Require a repository URL.
2. Reject non-SSH repository URLs. HTTPS URLs do not make sense for this setup.
3. Ask the user for the target directory if it was not provided.
4. Run the setup script with the SSH repository URL and target directory.
5. Report the created bare repository and worktree paths.

## Behavior

- The target directory is the setup root, not the worktree path.
- Target directories may use `~` or absolute paths; the script expands a leading `~` before creating directories.
- The bare repository is cloned into `<target>/.bare`.
- A root-level `.git` file points Git commands from `<target>` at `./.bare`.
- The first worktree is created at `<target>/worktree1`.
- The initial worktree branch is named `worktree1` and starts from the repository default `HEAD`.
- Existing target directories are only accepted when empty.

## Validation

Accepted repository formats include:

```text
git@github.com:owner/repo.git
ssh://git@github.com/owner/repo.git
```

Reject repository formats like:

```text
https://github.com/owner/repo.git
github.com:owner/repo.git
```

## Notes

- Do not guess a directory. Ask one short question if it is missing.
- Do not create additional worktrees unless the user asks for them.
- If the script fails because the destination already contains files, ask for a different empty directory or explicit permission to use another path.
