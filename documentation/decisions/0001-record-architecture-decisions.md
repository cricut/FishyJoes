# 0001. Record Architecture Decisions

## Status

Proposed

## Context

FishyJoes supports multiple generated language targets. Some implementation
plans depend on architectural choices that should remain visible after the plan
has been implemented or moved out of pending work.

The repository did not have a decision-record tree in this checkout.

## Options Considered

- Keep architectural choices only inside implementation plans.
  This keeps documentation count low, but important decisions become harder to
  find once a plan is implemented or archived.
- Add a custom free-form design document for each major feature.
  This is flexible, but it makes it easy to omit alternatives and tradeoffs.
- Use numbered Markdown decision records.
  This adds a small amount of process, but it gives durable decisions stable
  names and a consistent review shape.

## Decision

Use `documentation/decisions/` for Markdown Architectural Decision Records.
Records are numbered, use lowercase dash-separated filenames, and include
Status, Context, Options Considered, Decision, Tradeoffs, and Consequences
sections.

Implementation plans should link to any decision records that constrain the
work.

## Tradeoffs

Decision records create another documentation surface to maintain.

They also make architectural changes more deliberate: changing a decision should
usually add or update a record, not just alter implementation code.

## Consequences

Architectural constraints can be reviewed separately from large implementation
plans.

When a decision changes, add a new record that supersedes the old one instead of
rewriting history without explanation.
