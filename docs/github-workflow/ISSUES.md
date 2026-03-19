# Padrao de Issues GitHub

## Templates de Issue

### Bug Report

```markdown
## 🐛 Descricao do Bug
Descricao clara do problema.

## 📍 Localizacao
- **Pagina**: [ex: Home, About, Projects]
- **Arquivo(s)**: [ex: src/App.tsx]

## 🔄 Passos para Reproduzir
1. Va para '...'
2. Clique em '...'
3. Veja o erro

## ✅ Comportamento Esperado
O que deveria acontecer.

## ❌ Comportamento Atual
O que esta acontecendo.

## 📸 Screenshots
Se aplicavel.

## 🔍 Logs e Erros
```
Cole logs relevantes
```

## 🌐 Ambiente
- **Navegador**: [ex: Chrome 120]
- **OS**: [ex: Windows 11]
```

### Feature Request

```markdown
## ✨ Descricao da Feature
Descricao da funcionalidade desejada.

## 🎯 Problema que Resolve
Qual problema resolve.

## 💡 Solucao Proposta
Como implementar.

## 📋 Requisitos
- [ ] Requisito 1
- [ ] Requisito 2

## 🎨 Mockups
Se aplicavel.
```

### Content/Translation

```markdown
## 📝 Tipo de Conteudo
- [ ] Texto novo
- [ ] Traducao
- [ ] Correcao de texto
- [ ] Atualizacao de informacoes

## 📍 Localizacao
- **Pagina**: 
- **Secao**: 
- **Idioma**: 

## 📋 Conteudo Atual
```
Texto atual
```

## ✅ Conteudo Proposto
```
Texto novo
```
```

## Regras de Nomeacao

### Titulo

Formato: `[TIPO] Descricao concisa`

| Tipo | Prefixo | Exemplo |
|------|---------|---------|
| Bug | `[BUG]` | `[BUG] Menu nao fecha no mobile` |
| Feature | `[FEAT]` | `[FEAT] Adicionar secao de contato` |
| Content | `[CONTENT]` | `[CONTENT] Atualizar bio do portfolio` |
| Translation | `[I18N]` | `[I18N] Traduzir pagina About para ES` |

## Campos Obrigatorios

1. **Titulo descritivo** com prefixo
2. **Descricao clara**
3. **Labels apropriadas**

## Linkando Issues

### Em Commits

```bash
# Fecha issue
git commit -m ":bug: fix: corrige menu mobile (fixes #10)"

# Referencia
git commit -m ":sparkles: feat: adiciona contato (refs #11)"
```

### Em PRs

```markdown
Fixes #10
Refs #11
```

## Comandos GitHub CLI

```bash
# Criar issue
gh issue create --title "[BUG] Menu mobile" --body-file bug.md

# Listar issues
gh issue list --state open

# Fechar issue
gh issue close 10
```
