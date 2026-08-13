---
name: dotfiles-selective-commit
description: Split a dotfiles working tree with several unrelated unstaged edits into one clean, logically-scoped commit that matches this repo's terse commit style
triggers:
  - commit one logical chunk, keep it as small as possible
  - commit a chunk of unstaged changes
  - split unstaged changes into commits
  - commit and push in dotfiles repo
---

# Dotfiles: selective logical-chunk commit

This repo (`~/dotfiles`) routinely accumulates several unrelated tweaks in the
working tree at once (a new tool's config, an unrelated one-line brew add, a
README renumber, a stray blank-line edit) because it's edited opportunistically
whenever something on the machine changes. When asked to commit "one logically
connected chunk," resist the urge to `git add -A` — the diff almost always
contains 2+ unrelated changes that need to ship as separate commits.

## Commit message format override

This repo does **not** use the ticket-prefixed, multi-line format from the
global `commit` skill. Verify against real history before writing a message:

```
git log --oneline -10
```

Actual convention here: `<scope>: <short lowercase description>`, one line,
present-tense imperative, no ticket prefix, no body, no
`Co-Authored-By` trailer unless explicitly requested. Examples from history:
`ghostty: add terminal support`, `brew: install dropbox`,
`git: update mergetool conf`, `wezterm: notifications`. Bare single-word
subjects like `editor` or `gitignore` also appear when the file/area is
self-explanatory — match whichever pattern the most recent commits use.

## Workflow

1. `git status` + `git diff` (and `cat` the untracked files) to see everything
   unstaged. Don't skip untracked files — new config directories (e.g. a new
   tool's `.config/`) are usually part of the chunk.
2. Group changes by *feature intent*, not by file. A single feature often
   spans multiple files (e.g. adding a terminal emulator touches `brew.sh`,
   `aerospace/.aerospace.toml`, and a new `<tool>/.config/...` dir together).
   A single file can also contain **multiple unrelated hunks** — don't assume
   file-level granularity is enough.
3. Pick the most complete, self-contained group as the chunk to commit.
   Leave scaffolding/placeholder files (e.g. scripts still full of `<name>`
   template blocks) and unrelated one-line additions out.
4. Stage only that group:
   - Whole files that are 100% part of the chunk: `git add <file>`.
   - A file that mixes the target chunk with unrelated hunks: don't rely on
     interactive `git add -p` (not scriptable in a non-interactive shell).
     Instead run `git diff -U0 <file>` to see exact line numbers, hand-build a
     minimal patch with just the wanted hunk, and apply it directly to the
     index:
     ```
     git apply --cached - <<'EOF'
     diff --git a/<file> b/<file>
     index <old>..<new> <mode>
     --- a/<file>
     +++ b/<file>
     @@ -<a>,<b> +<c>,<d> @@ <context>
      ...
     EOF
     ```
5. Verify before committing: `git diff --cached` must show *only* the intended
   chunk; `git status` must show the unrelated edits still unstaged.
6. Commit with the short scoped message (step above). `git push` by default if user not asked for not pushing.

## Success criteria
- `git diff --cached` before commit contains exactly one feature's worth of
  changes across however many files it touches.
- Unrelated unstaged/untracked changes are untouched (still `git status`-dirty)
  after the commit.
- Commit subject matches the terse `scope: description` style seen in
  `git log --oneline -10`, not the global ticket-prefixed template.

## Pitfalls
- Don't use `git add -A` or `git add .` here — this repo's working tree is
  almost never single-purpose.
- Don't assume one file = one logical change; check for stray unrelated lines
  (e.g. a `brew install <unrelated-tool>` line added next to the real feature
  line in `brew.sh`).
- Don't apply the global `commit` skill's ticket/body format to this repo —
  always check `git log --oneline` first, since it overrides the default.
- When hand-crafting a partial patch, keep the hunk header's line counts
  accurate (`@@ -a,b +c,d @@`) or `git apply` will fail to match context.
