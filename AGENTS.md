# Agent Guidelines for Lolo's War Project

## Project Type
Historical research and documentation repository - primarily Markdown, with future media assets and potential web frontend.

## Build/Test Commands
- **Build**: No build system configured yet; future static site generators (Jekyll, Hugo, MkDocs)
- **Test**: No tests configured; run `npm test` or `pytest` when added
- **Lint**: Run `npm run lint` or `eslint .` for JS/TS; `ruff check .` for Python
- **Single Test**: `npm test -- <test-file>` or `pytest <test-file>` when testing framework added

## Code Style Guidelines
- **Imports**: Group by external libraries first, then internal modules; sort alphabetically
- **Formatting**: Use Prettier for JS/TS; Black for Python; consistent indentation (2 spaces JS, 4 spaces Python)
- **Types**: Use TypeScript for type safety; add JSDoc/Pydoc for complex functions
- **Naming**: camelCase for JS/TS variables/functions; snake_case for Python; PascalCase for classes/components
- **Error Handling**: Use try/catch in JS/TS; explicit exception handling in Python; log errors appropriately
- **Commits**: Use conventional commits; run lint/typecheck before committing

## Content Guidelines
- **File Format**: Markdown (.md) for all written content; follow CommonMark specification
- **Citations**: Use footnotes with `[^1]` format; include full bibliography in `/sources`
- **Tone**: Academic and respectful; avoid sensationalism when discussing atrocities
- **Language**: Primary English; include Tagalog/Filipino terms with translations in italics
- **Naming**: Use kebab-case for files (`bataan-death-march.md`); descriptive, not generic

## Research Standards
- **Sources**: Prioritize primary sources and reputable historians (see README.md)
- **Verification**: Cross-reference claims with multiple sources from different perspectives
- **Attribution**: Always cite sources; never present unverified claims as fact
- **Sensitivity**: Handle veteran testimonials and traumatic events with appropriate gravity

## File Organization
Follow structure in README.md: `/research`, `/drafts`, `/media`, `/video-scripts`, `/sources`, `/family`

## Historical Accuracy
When in doubt, mark claims as "reported" or "according to [source]" rather than stating as definitive fact.
