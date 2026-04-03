# New Language Target Checklist

Use this before adding any new FishyJoes language target.

## Decisions To Lock

- Runtime model
- Packaging format
- Supported host versions
- Type mapping rules
- Error propagation rules
- Async/callback model
- Ownership and lifetime rules
- Protocol / witness support
- Release and publish policy
- Test and CI coverage

## Minimum Questions

- Is this a first-class target or a thin wrapper over an existing runtime?
- Is the target CPython/CLR/JVM-only, or does it need multiple implementations?
- What is the minimum supported version, and what is the upgrade path?
- What binary artifact shape is expected: source-only, shared library, wheel, package, or all of them?
- Which exported Swift features are in scope for v1, and which are explicitly deferred?
- How will generated code load native libraries without relying on global linker paths?
- What are the failure modes for exceptions, async work, and dropped callbacks?
- What regression tests prove the target is ready for real users?

## Default Bar

- Prefer reusing an existing foreign-runtime pattern before inventing a new one.
- Prefer one clearly supported implementation family before broad compatibility claims.
- Prefer a narrow but documented v1 over a vague feature set.
- Prefer a packaging story that matches the host ecosystem’s standard tooling.
- Prefer CI that exercises generated consumer code, not only the generator internals.
