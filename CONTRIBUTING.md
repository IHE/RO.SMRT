# Contributing to the IHE-RO FHIR Implementation Guide

Thank you for contributing to the IHE Radiation Oncology (IHE-RO) FHIR Implementation Guide. This guide defines the working conventions for authors, reviewers, and maintainers contributing narrative content, FHIR Shorthand (FSH), examples, terminology, diagrams, and publication configuration.

The repository is the authoring record. The continuously built Implementation Guide is the primary review artifact. A contribution is complete only when the source, rendered narrative, computable artifacts, examples, and QA results are consistent.

## 1. Contribution principles

Contributions should follow these principles:

- Start with the interoperability problem, actors, workflow, and required information before changing profiles.
- Keep narrative requirements, conformance artifacts, terminology, and examples aligned.
- Use one branch and one pull request for one logically cohesive change.
- Keep commits focused and explain the reason for the change.
- Link design decisions to GitHub issues or IHE-RO Change Proposals where applicable.
- Review both the source changes and the rendered CI build.
- Treat a successful build as necessary, but not sufficient. Clinical, workflow, and interoperability correctness require human review.
- Prefer established FHIR resources, profiles, and terminology over locally defined alternatives when they meet the use case.
- Do not introduce vendor-specific behavior into normative requirements unless the behavior represents an agreed interoperability requirement.

## 2. Prerequisites

Contributors should have:

- Git
- GitHub CLI (`gh`)
- A GitHub account with appropriate access to the IHE organization or repository
- Visual Studio Code or another text editor
- A Java runtime supported by the current IG Publisher
- SUSHI
- The repository's local IG build scripts

Authenticate GitHub CLI:

```bash
gh auth login
```

Verify the installation and authentication:

```bash
git --version
gh --version
gh auth status
sushi --version
java -version
```

Repository membership and write access are managed by the IHE GitHub organization. Contributors without write access may fork the repository and open a pull request from their fork.

## 3. Convention layers

This guide separates conventions by their source and authority. Contributors should not assume that every convention in this document applies to all IHE repositories or all FHIR Implementation Guides.

### 3.1 IHE conventions

These conventions arise from IHE governance and the IHE profile-development and publication model. They take precedence for IHE-RO work:

- describe interoperability using actors, transactions, responsibilities, and expected behavior;
- distinguish normative requirements from informative guidance;
- use approved IHE conformance language intentionally;
- maintain traceability to issues, committee decisions, and Change Proposals where applicable;
- follow the IHE publication process, repository configuration, and approved governance decisions;
- assess changes for effects on Technical Framework content, actors, transactions, and existing implementations.

### 3.2 FHIR IG authoring conventions

These conventions are adopted from established FHIR Implementation Guide authoring practice and the FHIR toolchain:

- author computable artifacts using FSH where the repository has adopted FSH;
- build FSH with SUSHI and publish and validate with the IG Publisher;
- keep narrative, StructureDefinitions, terminology, capability artifacts, and examples aligned;
- review `qa.html`, generated artifact pages, examples, and the rendered CI build;
- use stable canonical URLs, FHIR identifiers, package metadata, and dependency declarations;
- reuse existing FHIR resources, profiles, extensions, and terminology where they satisfy the use case.

Filename prefixes such as `SD-`, `EX-`, and `VS-` are project-adopted FHIR authoring conventions. They are not asserted here as universal requirements of FHIR or IHE.

### 3.3 IHE-RO project conventions

These conventions are local working agreements for IHE-RO IG authoring:

- the branch categories defined in this guide;
- one branch and one pull request for one logically cohesive change;
- a merged branch is complete and is not reused for follow-up work;
- the IHE-RO filename-prefix set and naming rules;
- the pull request template and author checklist in this guide;
- review by both radiotherapy domain or workflow expertise and FHIR IG authoring expertise for substantial semantic changes;
- separation of training material from normative publication content.

Repository automation, branch protection, `CODEOWNERS`, and approved IHE decisions remain authoritative over local guidance.

## 4. Before starting work

### 4.1 Check for existing work

Before creating a branch:

1. Search open and closed GitHub issues.
2. Search open pull requests.
3. Check whether the topic is already covered by an IHE-RO Change Proposal, committee decision, or design discussion.
4. For substantial changes, open or reference an issue before implementing the change.

Useful GitHub CLI commands:

```bash
gh issue list
gh issue list --search "search terms"
gh pr list
gh pr list --search "search terms"
```

### 4.2 Define the intended change

The issue or pull request should make clear:

- the interoperability problem or defect;
- the affected actors, transactions, profiles, examples, or narrative pages;
- whether the change is normative, informative, editorial, or educational;
- relevant IHE-RO decisions, issue numbers, or Change Proposal identifiers;
- expected effects on existing implementations and examples.

## 5. Branch naming conventions

Use the following format:

```text
<category>/<short-description>
```

### 5.1 IHE-RO branch categories

- `feature/` for new IG functionality, transactions, profiles, or substantial capabilities
- `fix/` for defects in narrative, artifacts, terminology, examples, or build configuration
- `docs/` for documentation-only changes, including `README.md` and `CONTRIBUTING.md`
- `refactor/` for restructuring without an intended semantic or functional change
- `chore/` for repository maintenance, tooling, dependencies, or publication infrastructure
- `cp/` for work implementing an IHE Change Proposal
- `training/` for educational content, tutorials, workshops, or hands-on exercises

### 5.2 Naming rules

- Use lowercase letters.
- Separate words with hyphens.
- Do not use spaces or underscores.
- Keep names concise but descriptive.
- Include an issue or Change Proposal identifier when useful.
- Do not reuse a branch whose pull request has already been merged. Create a new branch from the current `main` branch for follow-up work.

Examples:

```text
feature/add-plan-approval-notification
fix/123-servicerequest-cardinality
docs/update-contribution-guidelines
refactor/split-transaction-pages
chore/update-publisher
cp/042-treatment-session
training/fhir-profile-exercise
```

## 6. File naming conventions

IHE-RO adopts predictable filenames so related FSH artifacts can be found and reviewed together. The `SD-`, `EX-`, and `VS-` prefixes reflect established FHIR IG authoring practice observed in radiotherapy IG work. In this guide they are defined as IHE-RO project conventions, not as universal IHE or FHIR requirements.

### 6.1 IHE-RO FSH source filenames

Use the following pattern:

```text
<PREFIX>-<descriptive-name>.fsh
```

IHE-RO adopted prefixes:

- `SD-` for profiles and other StructureDefinitions
- `EX-` for example instances
- `VS-` for ValueSets
- `CS-` for CodeSystems
- `EXT-` for extensions
- `CAP-` for CapabilityStatements
- `SP-` for SearchParameters
- `OP-` for OperationDefinitions
- `INV-` for reusable invariants
- `ALIAS-` for shared aliases
- `MAP-` for mappings

Examples:

```text
SD-ROTreatmentPlan.fsh
SD-PlanApprovalProvenance.fsh
EX-PlanApprovalMessage.fsh
VS-PlanApprovalActivity.fsh
CS-ROWorkflowEvents.fsh
EXT-TreatmentPlanReference.fsh
CAP-TreatmentManagementSystem.fsh
ALIAS-IHERO.fsh
```

If the repository already uses a more specific convention for a given artifact type, follow the established repository convention and keep the change internally consistent.

### 6.2 FHIR artifact naming

Use stable, descriptive identifiers:

```fsh
Profile: ROPlanApprovalProvenance
Id: ro-plan-approval-provenance
Title: "RO Plan Approval Provenance"
Description: "..."
```

General rules:

- Use PascalCase for FSH names such as profiles, extensions, ValueSets, and CodeSystems.
- Use lowercase kebab-case for FHIR `id` values.
- Use human-readable titles.
- Avoid embedding a version number in the logical name or canonical identifier unless versioning is part of the concept itself.
- Avoid product or vendor names in normative artifact names.
- Keep example identifiers stable when the example is referenced by narrative content or another example.

### 6.3 IHE-RO narrative pages and images

- Use lowercase kebab-case for new Markdown filenames unless an IHE template requires another pattern.
- Preserve required IHE transaction page names where the template or publication process depends on them.
- Give diagrams and images descriptive names rather than generic names such as `image1.png`.
- Keep diagram source files alongside, or clearly associated with, their rendered outputs.

Examples:

```text
plan-approval-workflow.md
ro-smrt-01.md
plan-approval-sequence.puml
plan-approval-sequence.svg
```

## 7. GitHub CLI development workflow

### 7.1 Clone the repository

```bash
gh repo clone IHE/REPOSITORY
cd REPOSITORY
```

### 7.2 Update `main`

Always start new work from the latest `main` branch:

```bash
git switch main
git fetch origin
git pull --ff-only origin main
```

### 7.3 Create a working branch

```bash
git switch -c <category>/<short-description>
```

Example:

```bash
git switch -c docs/update-contribution-guidelines
```

Do not make contribution changes directly on `main`.

### 7.4 Make and review changes

```bash
git status
git diff
```

Review staged changes before committing:

```bash
git diff --staged
```

### 7.5 Commit changes

Stage only the intended files when possible:

```bash
git add path/to/file
```

Commit with a concise imperative message:

```bash
git commit -m "Update contribution guidelines"
```

Good commit messages include:

```text
Add plan approval Provenance profile
Fix ServiceRequest cardinality
Add validating plan approval example
Update CP-042 transaction requirements
Clarify receiver obligations
```

Avoid mixing unrelated editorial, profiling, terminology, and tooling work in one commit unless they are inseparable parts of the same change.

### 7.6 Push the branch

```bash
git push -u origin HEAD
```

Subsequent updates require only:

```bash
git push
```

### 7.7 Create the pull request

```bash
gh pr create --base main --fill
```

For incomplete work that is ready for early discussion:

```bash
gh pr create --base main --fill --draft
```

Open the pull request and CI links in a browser:

```bash
gh pr view --web
```

Check the pull request and automated checks:

```bash
gh pr status
gh pr checks
```

## 8. Keeping a branch current

### 8.1 Pull request is still open

Update the existing branch from current `main`:

```bash
git switch <category>/<short-description>
git fetch origin
git rebase origin/main
git push --force-with-lease
```

Use `--force-with-lease`, not `--force`.

### 8.2 Previous pull request has already been merged

Treat the merged branch as complete. Create a new branch from the latest `main`, even when the follow-up change is related:

```bash
git switch main
git pull --ff-only origin main
git switch -c <category>/<follow-up-description>
```

This preserves the principle:

> One branch, one logical change, one pull request. Once merged, the branch is finished.

## 9. Local validation and build

Run the repository-provided scripts rather than manually assembling publisher commands. Depending on the repository, the typical sequence is:

```bash
_updatePublisher.bat
sushi .
_genonce.bat
```

Use the corresponding shell scripts where provided on non-Windows systems.

Before opening or updating a pull request:

- confirm that SUSHI completes successfully;
- confirm that the IG Publisher build completes;
- review `qa.html`;
- review newly introduced errors and warnings;
- open the generated pages affected by the change;
- confirm that examples render and validate as intended;
- confirm that links, diagrams, tables, and anchors render correctly.

Do not commit generated output unless the repository explicitly tracks it.

## 10. Pull request requirements

### 10.1 Pull request title

Use a concise title describing the outcome:

```text
Add plan approval notification artifacts
Fix Treatment Plan profile cardinality
Update contribution guidelines
```

Where applicable, include the issue or Change Proposal identifier:

```text
CP-042: Update treatment session requirements
```

### 10.2 Pull request description

A pull request should include:

- **Purpose:** Why the change is needed.
- **Scope:** What is changed and what is intentionally not changed.
- **Affected content:** Transactions, narrative pages, profiles, terminology, examples, or tooling.
- **Design decisions:** Important modelling or conformance choices.
- **Related work:** Issue, Change Proposal, committee decision, or dependency.
- **Validation:** Local build result and relevant QA findings.
- **Review guidance:** Pages and artifacts reviewers should inspect.
- **Compatibility impact:** Any expected effect on existing implementations or examples.

Suggested template:

```markdown
## Purpose

## Scope

## Affected artifacts

## Design decisions

## Related issues or Change Proposals

## Validation performed

## Reviewer guidance

## Compatibility or migration impact
```

### 10.3 Pull request checklist

Before requesting review, confirm:

- [ ] The branch was created from the current `main` branch.
- [ ] The change is linked to an issue or Change Proposal when appropriate.
- [ ] The pull request contains one logically cohesive change.
- [ ] Narrative and computable artifacts express the same requirement.
- [ ] New or changed profiles have clear scope, title, description, and canonical identity.
- [ ] Terminology bindings and binding strengths are intentional.
- [ ] New artifact filenames follow the repository naming conventions.
- [ ] Examples cover the principal expected workflow.
- [ ] Examples validate against the intended profiles.
- [ ] References between examples resolve correctly.
- [ ] CapabilityStatements or actor requirements are updated when behavior changes.
- [ ] The local SUSHI and IG Publisher builds complete.
- [ ] `qa.html` was reviewed.
- [ ] New errors are resolved.
- [ ] New warnings are resolved or explained in the pull request.
- [ ] The rendered CI build was reviewed, not only the source diff.
- [ ] Normative keywords are used intentionally and consistently.
- [ ] No secrets, credentials, local paths, generated caches, or unrelated editor files are committed.
- [ ] Relevant documentation, diagrams, and examples are updated.

## 11. Review expectations

This section combines IHE review concerns, FHIR IG validation concerns, and IHE-RO project review expectations. The applicable source is identified in each subsection.


IHE-RO IG review requires complementary expertise. Reviewers should cover the applicable perspectives below.

### 11.1 IHE and IHE-RO domain and workflow review

Confirm that:

- the interoperability problem and boundaries are clear;
- IHE actors are defined by responsibility rather than by product;
- triggers, preconditions, exceptions, state ownership, and expected outcomes are addressed;
- radiotherapy terminology and workflow semantics are correct;
- requirements are implementable across vendors.

### 11.2 FHIR modelling review

Confirm that:

- the selected resources and interaction patterns fit the use case;
- constraints are consistent with the base resource and dependencies;
- cardinalities, Must Support flags, references, extensions, invariants, and bindings are justified;
- existing profiles and terminology are reused where appropriate;
- canonical URLs, identifiers, dependencies, and package metadata are consistent.

### 11.3 IHE narrative and conformance review

Confirm that:

- actor and transaction responsibilities are unambiguous;
- normative requirements use the agreed IHE conformance language;
- narrative obligations are represented computably where appropriate;
- informative guidance is distinguishable from normative requirements;
- Volume 1, transaction narrative, artifacts, and examples do not contradict each other.

### 11.4 FHIR example and validation review

Confirm that:

- examples represent realistic IHE-RO workflows;
- positive examples validate against the intended profiles;
- any intentionally invalid teaching or test examples are clearly separated from published conformant examples and do not break the production build;
- identifiers and references are internally consistent;
- examples demonstrate required elements, terminology, and relevant branches of the workflow.

### 11.5 IHE-RO reviewer expectations and repository approvals

Repository branch-protection and `CODEOWNERS` settings determine the technically required approvals. In addition, substantial semantic changes should receive review from:

- at least one IHE-RO domain or workflow expert; and
- at least one contributor familiar with FHIR profiling and IG publication.

Changes affecting terminology, security, privacy, testing, or IHE governance should include an appropriate subject-matter reviewer. Editorial changes may use a lighter review when permitted by repository policy.

Do not merge your own substantial semantic change without independent review, even if repository permissions technically allow it.

## 12. Reviewing a pull request with GitHub CLI

Check out a pull request locally:

```bash
gh pr checkout <PR-NUMBER>
```

Inspect the pull request:

```bash
gh pr view <PR-NUMBER>
gh pr diff <PR-NUMBER>
gh pr checks <PR-NUMBER>
```

Review both:

1. the source diff; and
2. the rendered CI build linked from the pull request checks or comments.

When reviewing, distinguish blocking findings from suggestions. Explain the affected requirement, artifact, example, or rendered page rather than only identifying a file or line.

## 13. Addressing review comments

Make the requested changes on the same working branch:

```bash
git add .
git commit -m "Address pull request review comments"
git push
```

The existing pull request updates automatically. Prefer meaningful commits for substantive review changes. Minor fixup commits may be squashed according to repository maintainer practice.

Resolve conversations only after the concern has been addressed or an explicit design decision has been recorded.

## 14. Merge and cleanup

Merge only when:

- required reviews are complete;
- required checks pass;
- blocking discussions are resolved;
- the rendered build has been reviewed;
- the change is ready for inclusion in `main`.

After merge:

```bash
git switch main
git pull --ff-only origin main
git branch -d <category>/<short-description>
```

If the remote branch was not deleted automatically:

```bash
git push origin --delete <category>/<short-description>
```

## 15. Special contribution types

### 15.1 Normative changes

Normative changes should be traceable to an issue, Change Proposal, or recorded IHE-RO decision. The pull request should identify affected actors, transactions, conformance statements, artifacts, and compatibility considerations.

### 15.2 Editorial changes

Editorial changes must not unintentionally change requirement strength or meaning. Review changes involving `SHALL`, `SHOULD`, `MAY`, actor names, transaction names, cardinalities, or terminology as potentially semantic rather than merely editorial.

### 15.3 Training and hands-on material

Use `training/` branches for educational contributions. Keep training-only examples and instructions clearly separated from normative IG content. If an exercise intentionally contains invalid FHIR content, label and locate it so it is not treated as a conformant published example and does not cause the production IG build to fail.

### 15.4 Generated or converted content

When converting StructureDefinitions or other artifacts using tools such as GoFSH, review and normalize the generated FSH before committing it. Generated source is not automatically consistent with repository naming, aliases, formatting, or modelling conventions.

Example:

```bash
gofsh ./input-json -o ./fsh-output
```

## 16. Repository hygiene

Do not commit:

- credentials, private keys, tokens, or secrets;
- personal access tokens or authentication files;
- machine-specific absolute paths;
- temporary editor files;
- build caches or generated output not tracked by the project;
- unrelated formatting changes across many files;
- copyrighted or confidential material that the project is not permitted to publish.

Use `git mv` when renaming tracked files so history remains easy to follow:

```bash
git mv old-name.md new-name.md
```

## 17. Compact everyday workflow

```bash
# Update main
git switch main
git fetch origin
git pull --ff-only origin main

# Create a focused branch
git switch -c feature/short-description

# Edit, build, and review
git status
git diff
sushi .
_genonce.bat

# Commit and push
git add .
git commit -m "Describe the change"
git push -u origin HEAD

# Create and inspect the PR
gh pr create --base main --fill
gh pr checks
gh pr view --web
```

## 18. Reference material

Contributors should consult the current versions of:

- IHE guidance for writing FHIR profiles
- the IHE FHIR IG authoring and publishing templates
- the HL7 FHIR specification
- the FHIR Shorthand specification
- SUSHI documentation
- IG Publisher documentation
- applicable IHE-RO Technical Framework content and Change Proposals
- relevant dependency IGs, including IHE ITI and radiotherapy domain IGs such as CodeX RT

Where this guide conflicts with repository automation, branch protection, `CODEOWNERS`, the current IHE publication process, or an approved IHE-RO governance decision, follow the authoritative project configuration or decision and update this guide accordingly.
