---
category: minorAnalysis
---
* Removed some false positives from the `js/file-system-race` query by requiring that the file-check dominates the file-access.