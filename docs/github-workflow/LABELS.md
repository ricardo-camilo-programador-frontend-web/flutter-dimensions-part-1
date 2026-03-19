# Padrao de Labels GitHub

Sistema de labels para categorizar issues e pull requests.

## Labels por Categoria

### Tipo de Issue

| Label | Cor | Descricao |
|-------|-----|-----------|
| `bug` | `#d73a4a` | Algo nao funciona |
| `feature` | `#a2eeef` | Nova funcionalidade |
| `improvement` | `#84b6eb` | Melhoria |
| `documentation` | `#0075ca` | Documentacao |
| `refactor` | `#1d76db` | Refatoracao |

### Prioridade

| Label | Cor | Descricao |
|-------|-----|-----------|
| `priority:high` | `#d93f0b` | Alta prioridade |
| `priority:medium` | `#fbca04` | Media prioridade |
| `priority:low` | `#0e8a16` | Baixa prioridade |

### Status

| Label | Cor | Descricao |
|-------|-----|-----------|
| `status:in-progress` | `#5319e7` | Em desenvolvimento |
| `status:review` | `#fbca04` | Aguardando revisao |
| `status:blocked` | `#000000` | Bloqueado |
| `stale` | `#eeeeee` | Sem atividade |

### Escopo

| Label | Cor | Descricao |
|-------|-----|-----------|
| `scope:frontend` | `#7057ff` | Frontend/React |
| `scope:backend` | `#0052cc` | Backend/Express |
| `scope:styling` | `#bfd4f2` | CSS/Tailwind |
| `scope:content` | `#c5def5` | Conteudo/Textos |
| `scope:i18n` | `#d4c5f9` | Internacionalizacao |

## Regras de Aplicacao

### Issue Obrigatorias

1. **Uma label de tipo**: `bug`, `feature`, `improvement`, etc.
2. **Uma label de prioridade**: `priority:high`, `priority:medium`, `priority:low`

### PR Obrigatorias

1. **Uma label de tipo**
2. **Uma label de status PR**: `status:review` ou `status:in-progress`

## Comandos GitHub CLI

```bash
# Criar labels
gh label create "bug" --color "d73a4a" --description "Algo nao funciona"
gh label create "feature" --color "a2eeef" --description "Nova funcionalidade"

# Adicionar labels
gh issue edit <number> --add-label "bug,priority:high"

# Remover label
gh issue edit <number> --remove-label "stale"
```

## Automacao

| Palavras-chave | Label Automatica |
|----------------|------------------|
| bug, erro, falha | `bug` |
| feature, nova, adicionar | `feature` |
| melhorar, otimizar | `improvement` |
| documento, docs | `documentation` |
