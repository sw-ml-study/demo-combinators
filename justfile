set shell := ["sh", "-cu"]

# List available project tasks.
default:
    @just --list

# Run the complete release gate.
check:
    ./scripts/check

# Run native mlplunit tests; extra arguments are forwarded to mlplunit.
test *args:
    ./scripts/run-tests {{args}}

# Run conceptual demonstration applications.
demos:
    ./scripts/run-demos

# Run practical problem applications.
problems:
    ./scripts/run-problems

# Run the ordered teaching sequence.
lessons:
    ./scripts/run-lessons

# Validate machine-readable catalogs without running MLPL programs.
catalogs:
    ./scripts/validate-bird-catalog
    ./scripts/validate-problem-catalog

