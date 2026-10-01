# Budget OS v4.4 — Dashboard & Update Fixes

This build is based on the v4.4 Dashboard package and includes the requested refinements:

- Removes the duplicate expense labels that were being drawn beside the spending pie chart.
- Keeps the pie chart clean and uses the expandable **Expenses & Bills Paid** section for the detailed list, while allowing hover/click/tap on each pie slice for details.
- Adds listed recurring bills from **Bills & Calendar** to the current-month spending total, pie chart, and expandable detail list. If a bill is already represented by a matching expense transaction (amount plus bill/category/name match), it is displayed as paid via that transaction but is not counted twice.
- Current-month **Spending** now equals actual expense transactions plus listed recurring bills; **Available** is calculated from Income minus that total. Debt Payoff is not separately deducted.
- The 12-month cash-position graph uses the same spending logic, so its monthly saved/shortfall figures stay consistent with the Dashboard.
- Financial Snapshot comparisons now use directional arrows and clear wording such as **↑ 10.0% more** or **↓ 77.3% less**, with explicit Month / Quarter / Year labels. Unavailable or mathematically undefined comparisons display **-**.
- Income, Spending, and Available now have month, quarter, and year comparisons where applicable.
- Forecast calculations continue to include projected debt payments; Dashboard Available does not double-count debt.
- App Updates wording is simplified and the PWA cache is versioned as v4.4.

No Supabase SQL or database structure changes are required.


## v4.4 Dashboard refinements

- Renamed the Dashboard transaction section to **Expenses** for user-facing clarity.
- The spending pie chart is interactive: hover or click/tap a slice to see its category, dollar total, and percentage of spending.
- The Financial Snapshot is divided into **Balance Metrics** and **Flow Metrics**.
- Comparisons use clear directional arrows and wording such as `↑ 10.0% more` or `↓ 77.3% less`.
- Missing or mathematically unavailable comparisons display `-`.
- Bills and expenses are consolidated so a listed bill matched to an expense transaction is not counted twice.


## v4.5 historical balance architecture
Balance history is now stored on the source modules (assets, liabilities, debts, investments, and savings goals). The Dashboard Financial Snapshot reads Last Month, Last Quarter, and Last Year balance changes from those histories. Existing records are not assigned fake historical dates; use each record’s History control to enter a known historical balance/value.
