# Personal environment notes

## Issue attachments for specs and plans

When the user approves a plan (`plans/*.md`) written by `/dev-team:plan`,
attach the plan and its spec files (`docs/specs/*.md`, from
`/dev-team:specs`) to the current issue by default:

- Don't upload drafts. Upload nothing while the specs or plan are still being
  written or reviewed, or if the plan is rejected.
- Take the issue tracker key from the current git branch name (e.g.
  `feature/DTA-5954/...` -> `DTA-5954`). If the branch has no key, ask once for
  the issue key.
- Use the issue tracker MCP. If a file of the same name is already attached,
  replace it.
- If the MCP cannot upload attachments, post the file content as a comment
  instead, headed with the file path, and say so.
- Report the result. Never silently skip on failure.

## Git conventions

This section wins if there is disagreement with other active skills.

### Branches

- Standard:
  `(feature|bugfix|config|test|pipeline|chore|docs|renovate)/<ISSUE-KEY>/<short-description>`,
  e.g. `feature/PROJ-123/add-user-auth`
- Hotfix / release: `(hotfix|release)/v<MAJOR>.<MINOR>`, e.g. `hotfix/v1.4`
- Issue key is the issue tracker ID in uppercase (`PROJ-123`). Standard
  descriptions are lowercase with hyphens, underscores or digits.

### Commit subject

- `:gitmoji: [ISSUE-KEY] type: Subject`, e.g.
  `:bug: [PROJ-123] fix: Handle empty timetable`
- Gitmoji shortcode (`:sparkles:`, `:bug:`, `:memo:`, `:wrench:`), not the emoji
  character.
- Conventional type after the issue key (`feat`, `fix`, `docs`, `refactor`,
  `test`, `ci`, `chore`).
- Imperative mood, whole line under 72 characters. Match recent `git log` in the
  repo.

### Commit body

- Short (1–3 brief paragraphs) and about *why*; the diff shows what and how.
- Lead with the real motivation (issue, branch, earlier conversation), not the
  most local symptom.
- Describe the change as a whole: no per-file walkthrough, nothing about what
  didn't change.
- Rationale for one specific line goes in a code comment, not the commit.
- Don't list expected practice (tests added, docs updated) or justify why a
  test exists.
- No first person; use impersonal phrasing ("Allows evaluation of X").
- No process history (rebases, cherry-picks, where a fix came from). A
  mechanical squash keeps the existing one-line subject with no body.
- Don't guess at rationale you don't know.

### Merge requests and merging

- One commit per MR branch. MR title = commit subject, description = commit
  body. Content that doesn't fit belongs in `docs/`.
- Fast-forward only: rebase before merging, no squash-on-merge, no merge
  commits.
- Never push directly to `main`.

### Issue keys

- Issue keys go in branch names, commits and MRs only, never in code comments or
  tests.
