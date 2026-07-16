# Git Bare Worktree

An agent skill for cloning a Git repository as a **bare repository** and creating an initial linked worktree.

## Install globally

This skill is intended to be installed **globally** so it is available to your agents from any project:

```bash
npx skills@latest add berenddeboer/git-bare-worktree --global
```

## Using the script

The global installation makes this an **agent skill**. Agents read `SKILL.md` and invoke the bundled script from the skill's installed directory; it does **not** put `setup-bare-worktree.sh` on your shell `PATH`.

The relative command below is for a checkout of this repository. Clone the repository first if you want to run the script yourself:

```bash
git clone git@github.com:berenddeboer/git-bare-worktree.git ~/src/git-bare-worktree
~/src/git-bare-worktree/scripts/setup-bare-worktree.sh \
  git@github.com:owner/repo.git \
  ~/src/owner/repo
```

## What it creates

Given an SSH repository URL and a target directory, the bundled setup script creates:

```text
<target>/
├── .bare/       # bare clone
├── .git         # points Git at ./.bare
└── worktree1/   # first linked worktree, on branch worktree1
```

The script accepts SSH Git URLs ending in `.git`, including:

- `git@github.com:owner/repo.git`
- `ssh://git@github.com/owner/repo.git`

It refuses non-empty target directories and does not create additional worktrees.

## License

MIT. See [LICENSE](LICENSE).
