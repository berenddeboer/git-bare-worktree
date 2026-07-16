# Git Bare Worktree

An agent skill for creating a bare Git clone with an initial linked worktree.

## Install globally

Install this skill globally so it is available to your agents from any project:

```bash
npx skills@latest add berenddeboer/git-bare-worktree --global
```

## Example prompts

Paste one of these into your agent, replacing the repository URL and target
folder.

### Create one worktree

```text
Create a bare Git clone and one initial worktree for
`git@github.com:owner/repo.git` at `~/src/owner/repo`.
```

### Create four worktrees

```text
Create a bare Git clone for `git@github.com:owner/repo.git` at
`~/src/owner/repo`, with four worktrees named `worktree1` through `worktree4`.
```

## What it creates

```text
<target>/
├── .bare/       # bare clone
├── .git         # points Git at ./.bare
└── worktree1/   # initial linked worktree
```

## License

MIT. See [LICENSE](LICENSE).
