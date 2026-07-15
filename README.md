# Git Bare Worktree

An agent skill for cloning a Git repository as a **bare repository** and creating an initial linked worktree.

## Install globally

This skill is intended to be installed **globally** so it is available to your agents from any project:

```bash
npx skills@latest add berenddeboer/git-bare-worktree --global
```

## What it creates

Given an SSH repository URL and a target directory, the included setup script creates:

```text
<target>/
├── .bare/       # bare clone
├── .git         # points Git at ./.bare
└── worktree1/   # first linked worktree, on branch worktree1
```

For example:

```bash
scripts/setup-bare-worktree.sh \
  git@github.com:owner/repo.git \
  ~/src/owner/repo
```

The script accepts SSH Git URLs ending in `.git`, including:

- `git@github.com:owner/repo.git`
- `ssh://git@github.com/owner/repo.git`

It refuses non-empty target directories and does not create additional worktrees.

## License

MIT. See [LICENSE](LICENSE).
