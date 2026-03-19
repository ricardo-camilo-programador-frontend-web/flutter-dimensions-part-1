# Workflow de Gerenciamento GitHub

Execute sequencialmente a rotina a seguir ate completar todos os passos.

## Inicializacao

Antes de iniciar, carregue o estado do workflow:

1. Leia o arquivo `dist/workflow/state.json`
2. Se nao existir, crie um estado inicial seguindo o schema em `workflow-state-schema.ts`
3. Consulte `workflow-state.md` para detalhes do formato

## Passo 1: GitHub Issues

### 1.1 Issues sem descricao

- Filtre apenas issues NAO processadas
- Analise o contexto da issue
- Adicione descricao seguindo `ISSUES.md`
- Marque a issue como processada

### 1.2 Issues sem labels

- Filtre apenas issues NAO processadas
- Atualize as labels de acordo com `LABELS.md`
- Marque a issue como processada

### 1.3 Issues obsoletas

- Identifique issues abertas ha mais de 30 dias sem atividade
- Adicione label `stale` se aplicavel
- Comente solicitando atualizacao

## Passo 2: Pull Requests

### 2.1 Pull Requests sem revisao

- Verifique se o PR precisa de revisao
- Realize a revisao seguindo `PULL_REQUEST_REVIEW.md`
- Apos revisar, marque no estado

### 2.2 Pull Requests sem descricao

- Filtre PRs sem descricao adequada
- Adicione template seguindo `PULL_REQUEST_TEMPLATE.md`

### 2.3 Pull Requests com conflitos

- Identifique PRs com conflitos
- Comente alertando o autor

## Passo 3: Tags e Versionamento

### 3.1 Analise de merges

- Analise os ultimos merges para main
- Identifique mudancas que merecem release

### 3.2 Criacao de tags

- Atualize tags seguindo `TAGS.md`
- Registre novas tags no estado
- Gere changelog se aplicavel

## Passo 4: Qualidade de Codigo

### 4.1 Analise de code quality

- Execute analise seguindo `CODE_QUALITY.md`
- Identifique areas que precisam atencao
- Crie issues de melhoria se aplicavel

### 4.2 Dependencias

- Verifique dependencias desatualizadas
- Verifique vulnerabilidades conhecidas

## Finalizacao

Ao terminar, salve o estado:

1. Atualize `state.lastRun` com timestamp atual
2. Incremente `state.stats.totalRuns`
3. Execute `cleanupState(state)`
4. Salve em `dist/workflow/state.json`

## Arquivos de Referencia

| Arquivo | Proposito |
|---------|-----------|
| `workflow-state-schema.ts` | Schema do Estado |
| `workflow-state.md` | Documentacao do Estado |
| `LABELS.md` | Padrao de Labels |
| `ISSUES.md` | Padrao de Issues |
| `TAGS.md` | Versionamento |
| `PULL_REQUEST_TEMPLATE.md` | Template de PR |
| `PULL_REQUEST_REVIEW.md` | Guia de Review |
| `COMMIT-PATTERN.md` | Padrao de Commits |
| `CODE_QUALITY.md` | Padroes de Qualidade |

## Comandos GitHub CLI

```bash
# Listar issues
gh issue list --state open

# Listar PRs
gh pr list --state open

# Adicionar label
gh issue edit <number> --add-label "bug"

# Criar tag
git tag -a v1.0.0 -m "Release v1.0.0"
git push origin v1.0.0

# Criar release
gh release create v1.0.0 --title "v1.0.0" --notes "Release notes"
```
