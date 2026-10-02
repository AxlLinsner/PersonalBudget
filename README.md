# Budget OS v4.7.2 — Bills & Calendar Architecture

This build uses the v4.5 source-module financial history architecture as its baseline and rebuilds Bills & Calendar around a clear separation between **obligations** and **actual money movement**.

## v4.7.2 Bug Fixes

- Fixed Dashboard spending chart rendering and current-month expense/bill presentation.
- Fixed Dashboard Next Bills display to read unpaid bill occurrences.
- Fixed modal Save/Close behavior.
- Fixed calendar layout sizing and day-level detail interaction.
- Fixed partial-payment preservation during bill edits and linked-transaction deletion status recalculation.
- Restored the PWA manifest.

## Bills & Calendar

- A **bill** is an obligation definition: name, category, recurring/one-time type, fixed/variable amount type, expected amount, first due date, recurrence, autopay, notes, and active/inactive status.
- A **bill occurrence** is one specific instance of a bill for a specific due date.
- Occurrences have expected amount, due date, payment status, payment date, actual amount, and linked transaction/payment IDs.
- Supported recurrence: weekly, biweekly, monthly, quarterly, semiannual, and annual.
- One-time bills create one occurrence.
- Autopay is informational and never marks a bill paid automatically.
- Future bill changes apply to future unpaid occurrences. Paid history and transactions are preserved.
- Deactivation stops future occurrences without deleting history.

## Payments and Transactions

- Bills do not count as spending merely because they exist.
- **Transactions represent actual money movement.**
- Marking a bill Paid creates one expense transaction and links it to the bill occurrence.
- An existing transaction can be explicitly linked to a bill occurrence without creating another transaction.
- A bill payment therefore appears in Transactions and is counted by Dashboard spending exactly once.
- Payment date and due date remain separate.
- Expected amount and actual payment amount remain separate, supporting variable bills and late/early payments.
- Partial-payment structure is supported through multiple payment transaction IDs on an occurrence.
- Deleting a linked transaction removes that payment from the occurrence and recalculates its unpaid/due/overdue state.

## Dashboard / Forecast / Paycheck Planner / Reports

- Dashboard spending reads actual expense transactions only.
- Upcoming Bills reads unpaid future bill occurrences.
- Dashboard never adds a second bill charge on top of a linked transaction.
- Forecasts use future unpaid bill occurrences as projected obligations and actual transactions for historical cash flow.
- Paycheck Planner consumes upcoming bill obligations rather than creating duplicate bills.
- Reports can distinguish planned bill obligations from actual bill-payment transactions and variable-bill variance.

## Historical Balance Architecture

Balance history remains stored on the source financial modules: assets, liabilities, debts, investments, and savings goals. The Dashboard Financial Snapshot reads those histories for Last Month, Last Quarter, and Last Year. Existing records are not assigned invented historical values.

## Cloud Sync

Supabase remains unchanged in this build. Current sync is still manual upload/download and last-upload-wins. Automatic multi-device conflict-aware synchronization is a separate future project and is not mixed into the Bills & Calendar redesign.

## Data safety

The app uses the existing local Budget OS data key and preserves existing financial records. Existing legacy bill records are migrated into the new bill-definition format without inventing historical payments. Existing transactions are not automatically matched to old bills because amount/name/category matching is intentionally not trusted.

## Versioning

- App version: **4.7.0**
- PWA cache: **budget-os-v4-7-1**
- Normal app updates do not require reinstalling the iPhone Home Screen app.
