# Documentacao de Workflow GitHub

Documentacao para gerenciamento do portfolio Alla Kayan.

## Estrutura

```
docs/github-workflow/
├── README.md                    # Este arquivo
├── GERENCIADOR.MD              # Workflow principal
├── workflow-state.md           # Estado do workflow
├── workflow-state-schema.ts    # Schema TypeScript
├── LABELS.md                   # Sistema de labels
├── ISSUES.md                   # Padroes de issues
├── TAGS.md                     # Versionamento
├── PULL_REQUEST_TEMPLATE.md    # Template de PR
├── PULL_REQUEST_REVIEW.md      # Guia de review
├── PULL_REQUEST_FIX.md         # Guia de correcoes
├── COMMIT-PATTERN.md           # Padrao de commits
└── CODE_QUALITY.md             # Padroes de qualidade
```

## Guia Rapido

### Para Desenvolvedores

1. **Issues**: Use `ISSUES.md` para criar
2. **Labels**: Consulte `LABELS.md`
3. **Commits**: Siga `COMMIT-PATTERN.md`
4. **PRs**: Use `PULL_REQUEST_TEMPLATE.md`

### Para Reviewers

1. **Review**: `PULL_REQUEST_REVIEW.md`
2. **Correcoes**: `PULL_REQUEST_FIX.md`

## Stack do Projeto

- **Frontend**: React 19 + TypeScript + Vite
- **Styling**: TailwindCSS v4
- **Animacoes**: Motion
- **Backend**: Express + SQLite
- **Features**: PWA, i18n

## Comandos

```bash
# Dev
npm run dev

# Build
npm run build

# Lint
npm run lint
```

## GitHub CLI

```bash
# Issues
gh issue list --state open
gh issue create --title "[BUG] Titulo" --body "Descricao"

# PRs
gh pr list --state open
gh pr create --title "Titulo" --body "Descricao"

# Labels
gh issue edit 1 --add-label "bug,priority:high"

# Releases
gh release create v1.0.0 --title "v1.0.0" --notes "Release notes"
```
