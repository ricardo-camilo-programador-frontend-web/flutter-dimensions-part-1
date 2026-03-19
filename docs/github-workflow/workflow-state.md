# Formato do Arquivo de Estado do Workflow

## Localizacao

```
dist/workflow/state.json
```

## Schema

```typescript
interface WorkflowState {
  version: string
  lastRun: string
  nextRun: string
  stats: WorkflowStats
  github: GitHubState
  codeQuality: CodeQualityState
  recentErrors: WorkflowError[]
  lock: WorkflowLock | null
}
```

### WorkflowStats

```typescript
interface WorkflowStats {
  totalRuns: number
  issuesCreated: number
  issuesClosed: number
  prsReviewed: number
  prsMerged: number
  labelsAdded: number
  tagsCreated: number
  errors: number
}
```

### GitHubState

```typescript
interface GitHubState {
  processedIssues: string[]
  reviewedPRs: Record<string, PRReviewInfo>
  tags: string[]
  staleIssues: string[]
}

interface PRReviewInfo {
  lastReview: string
  reviewer: string
  status: 'approved' | 'changes_requested' | 'pending'
}
```

### CodeQualityState

```typescript
interface CodeQualityState {
  lastAnalysis: string
  score: number
  issues: CodeQualityIssue[]
  dependencies: DependencyStatus
}

interface DependencyStatus {
  outdated: number
  vulnerable: number
  lastCheck: string
}
```

## Exemplo

```json
{
  "version": "1.0.0",
  "lastRun": "2026-03-19T10:00:00Z",
  "nextRun": "2026-03-19T12:00:00Z",
  "stats": {
    "totalRuns": 1,
    "issuesCreated": 0,
    "issuesClosed": 0,
    "prsReviewed": 0,
    "prsMerged": 0,
    "labelsAdded": 0,
    "tagsCreated": 0,
    "errors": 0
  },
  "github": {
    "processedIssues": [],
    "reviewedPRs": {},
    "tags": [],
    "staleIssues": []
  },
  "codeQuality": {
    "lastAnalysis": "2026-03-19T10:00:00Z",
    "score": 100,
    "issues": [],
    "dependencies": {
      "outdated": 0,
      "vulnerable": 0,
      "lastCheck": "2026-03-19T10:00:00Z"
    }
  },
  "recentErrors": [],
  "lock": null
}
```

## Funcoes Helper

| Funcao | Uso |
|--------|-----|
| `isIssueProcessed(state, issueNumber)` | Verifica se issue foi processada |
| `markIssueProcessed(state, issueNumber)` | Marca issue como processada |
| `isPRReviewed(state, prNumber)` | Verifica se PR foi revisado |
| `markPRReviewed(state, prNumber, status)` | Marca PR como revisado |
| `addError(state, step, errorMessage)` | Registra erro |

## Cleanup

A funcao `cleanupState()` limita:
- `processedIssues` a 100 itens
- `recentErrors` a 10 itens
