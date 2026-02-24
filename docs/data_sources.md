# Data Sources Reference

This document inventories repository data assets and records verifiable structure, coverage, and provenance signals based on direct file/header inspection.

## data

**Location**
data/Readme.pdf, data/data3.dta, data/reg_aej_revision2.do

**Source**
Office for National Statistics (ONS)

**Description**
1 PDF reference/report file(s) 1 .dta analytical binary file(s) 1 .do file(s)

**Coverage**
- Time: Not explicit in filenames; verify in source metadata/content.
- Geography: Not explicit in inspected headers/keys.
- Unit of observation: Not explicit from inspected headers/keys.

**Caveats**
Binary analytical formats are present; variable labels and full schema should be validated with native tooling before analysis changes. Limited header-level field verification was possible from inspectable text/metadata.


## Cross-Cutting Caveats

- Source attribution can be incomplete when provider/publication metadata is absent from local files; confirm against acquisition logs, scripts, or citations before publication use.
- Coverage summaries rely on inspected headers, sheet names, keys, and filename date patterns; validate against canonical source documentation for final claims.
- Mixed file formats and vintages can introduce schema drift and crosswalk inconsistencies; validate joins and harmonization assumptions before pooled analysis.
- Descriptive and predictive associations in these datasets do not establish causal effects without explicit identification design.

