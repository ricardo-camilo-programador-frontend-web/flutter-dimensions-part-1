export interface WorkflowStats {
  totalRuns: number
  issuesCreated: number
  issuesClosed: number
  prsReviewed: number
  prsMerged: number
  labelsAdded: number
  tagsCreated: number
  errors: number
}

export interface PRReviewInfo {
  lastReview: string
  reviewer: string
  status: 'approved' | 'changes_requested' | 'pending'
}

export interface GitHubState {
  processedIssues: Array<string>
  reviewedPRs: Record<string, PRReviewInfo>
  tags: Array<string>
  staleIssues: Array<string>
}

export interface CodeQualityIssue {
  file: string
  line: number
  rule: string
  severity: 'error' | 'warning' | 'info'
  message: string
}

export interface DependencyStatus {
  outdated: number
  vulnerable: number
  lastCheck: string
}

export interface CodeQualityState {
  lastAnalysis: string
  score: number
  issues: Array<CodeQualityIssue>
  dependencies: DependencyStatus
}

export interface WorkflowError {
  timestamp: string
  step: string
  error: string
  resolved: boolean
}

export interface WorkflowLock {
  acquired: string
  by: string
  expires: string
}

export interface WorkflowState {
  version: string
  lastRun: string
  nextRun: string
  stats: WorkflowStats
  github: GitHubState
  codeQuality: CodeQualityState
  recentErrors: Array<WorkflowError>
  lock: WorkflowLock | null
}

export function createInitialState(): WorkflowState {
  const now = new Date().toISOString()

  return {
    version: '1.0.0',
    lastRun: new Date(0).toISOString(),
    nextRun: now,
    stats: {
      totalRuns: 0,
      issuesCreated: 0,
      issuesClosed: 0,
      prsReviewed: 0,
      prsMerged: 0,
      labelsAdded: 0,
      tagsCreated: 0,
      errors: 0,
    },
    github: {
      processedIssues: [],
      reviewedPRs: {},
      tags: [],
      staleIssues: [],
    },
    codeQuality: {
      lastAnalysis: new Date(0).toISOString(),
      score: 100,
      issues: [],
      dependencies: {
        outdated: 0,
        vulnerable: 0,
        lastCheck: new Date(0).toISOString(),
      },
    },
    recentErrors: [],
    lock: null,
  }
}

export function isIssueProcessed(state: WorkflowState, issueNumber: string): boolean {
  return state.github.processedIssues.includes(`#${issueNumber}`)
}

export function markIssueProcessed(state: WorkflowState, issueNumber: string): void {
  const key = `#${issueNumber}`
  if (!state.github.processedIssues.includes(key)) {
    state.github.processedIssues.push(key)
  }
}

export function isPRReviewed(state: WorkflowState, prNumber: string): boolean {
  return prNumber in state.github.reviewedPRs
}

export function markPRReviewed(
  state: WorkflowState,
  prNumber: string,
  status: PRReviewInfo['status'],
): void {
  state.github.reviewedPRs[prNumber] = {
    lastReview: new Date().toISOString(),
    reviewer: 'agent',
    status,
  }
}

export function addError(state: WorkflowState, step: string, errorMessage: string): void {
  state.recentErrors.push({
    timestamp: new Date().toISOString(),
    step,
    error: errorMessage,
    resolved: false,
  })
  state.stats.errors += 1
}

export function cleanupState(state: WorkflowState): void {
  const maxProcessedItems = 100
  const maxErrors = 10

  state.github.processedIssues = state.github.processedIssues.slice(-maxProcessedItems)
  state.recentErrors = state.recentErrors.slice(-maxErrors)
}

export function incrementStat(
  state: WorkflowState,
  stat: keyof WorkflowStats,
  amount: number = 1,
): void {
  state.stats[stat] += amount
}
