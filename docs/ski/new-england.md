# New England ski corpus — destination tree

## Known inconsistency: Boston sits beside its counties, not inside one

Massachusetts has one region node (`united-states/massachusetts`) and, before
this task, exactly one child: `united-states/massachusetts/boston`, a `city`
sitting directly under the region with no county tier above it.

Task 3 adds Massachusetts county nodes (Berkshire, Essex, Franklin, Middlesex,
Norfolk, Worcester) as children of the region, for the ski areas that need
them. Boston is not re-parented under Suffolk County — it stays exactly where
it was, a `city` node sitting beside the counties rather than inside one.

This is deliberate, not an oversight:

- The inconsistency predates this project.
- The destination tree is variable-depth by design; not every branch needs
  the same number of tiers.
- Re-parenting Boston would move a live URL for no benefit to this corpus.

Leave it as-is. Verification tables for the New England ski content waves
belong in later tasks, not here.
