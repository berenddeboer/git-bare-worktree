# Git Bare Worktree

An agent skill for creating a bare Git clone with an initial linked worktree.

## Install globally

Install this skill globally so it is available to your agents from any project:

```bash
npx skills@latest add berenddeboer/git-bare-worktree --global
```

## Example prompt

Paste this into your agent, replacing the repository URL and target directory:

```text
Create a bare Git clone and initial worktree for git@github.com:owner/repo.git at ~/src/owner/repo.
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
