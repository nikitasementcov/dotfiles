---
name: commit
description: Commit message formatting and guidelines
---

# Commit

Use this skill whenever the user asks you to create a git commit for the current work.

## Instructions

1. Review the current git state before committing:
   - `git status`
   - `git diff`
   - `git log -5 --oneline`
2. Only stage files relevant to the requested change. Do not include unrelated untracked files, generated files, or likely-local artifacts.
3. Split the change into the smallest set of logically consistent commits, not one bundled commit. Group by concern — e.g. a bug fix, a refactor, and an unrelated cleanup are separate commits even if touched in the same session. Within a single file, stage only the hunks belonging to the current commit (`git add -p`) if the file mixes concerns.
4. If any of files are already stages, commit only them
5. DO NOT ADD Co-Authored-By: line at the end of a commit message
6. Run `git status --short` after committing and confirm the result.
7. If more changes remain for another logical commit, repeat from step 2 for the next one.

## Important
- Do not push to remote unless the user explicitly asks
- Keep commits focused and avoid bundling unrelated changes — prefer more small commits over one large one
- If there are no relevant changes, do not create an empty commit
- If hooks fail, fix the issue and create a new commit. Never bypass hooks.
- When pushing, push one commit at a time rather than batching all local commits into a single `git push`: push the oldest unpushed commit first (`git push origin <commit-sha>:<branch>`), confirm its pre-push hook output, then push the next one, and so on. This isolates a hook failure to the single commit that caused it instead of blocking or obscuring commits that already pass.
- `git push` can re-run a pre-push hook (tests, type-check) whose combined output exceeds the tool's inline limit and gets truncated to a saved file. Don't judge push success/failure from the truncated preview — read or tail the saved output file to confirm the hook actually passed before reporting the push as done.

## Commit message format

We have a handful of simple standards for commit messages which help us to generate readable changelogs. Please follow this wherever possible and mention the associated issue number.

- **1st line:** Max 80 character summary
   - If you see similar prefix in last commits messages from `git log -5 --oneline`, e.g. MYZ-123456, then use this prefix in summary. If there is no prefix in previous commit, check the branch name for the similar prefix with a task number.
   - Written in past tense e.g. “Fixed the thing” not “Fixes the thing”
   - Start with one of: Fixed, Changed, Updated, Improved, Added, Removed, Reverted, Moved, Released, Bumped, Cleaned
- **2nd line:** [Always blank]
- **3rd line:** `ref <issue link>`, `fixes <issue link>`, `closes <issue link>` or blank
- **4th line:** Why this change was made - the code includes the what, the commit message should describe the context of why - why this, why now, why not something else?

### Example

```
MYZ-123456 Added config flag for disabling page analytics

- analytics are brand new under development, therefore they need to be behind a flag
- not using the developerExperiments flag as that is already in wide use and we aren't ready to deploy this anywhere yet
- using the term `pageAnalytics` as this was discussed as best reflecting what this does
```
