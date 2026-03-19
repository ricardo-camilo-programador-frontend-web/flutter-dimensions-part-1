# Guia de Code Review

## Objetivo

Identificar **erros, problemas e riscos tecnicos**.

## O que Revisar

### Codigo

- Bugs potenciais
- Logica incorreta
- Problemas de tipagem
- Performance
- Seguranca
- Codigo duplicado
- Imports nao utilizados
- Nomes pouco claros

### React Especifico

- Hooks usados corretamente
- Dependencias do useEffect
- Keys em listas
- Estado imutavel
- Props desnecessarias

### Styling

- Responsividade
- Acessibilidade
- Consistencia visual
- Performance CSS

## Formato de Comentarios

```markdown
- [ ] Problema: descricao clara

Arquivo: src/App.tsx
Linha: 42

Sugestao:
Como corrigir.
```

### Exemplo

```markdown
- [ ] Problema: useEffect sem dependencias

Arquivo: src/components/Header.tsx
Linha: 25

Sugestao:
Adicione `isMenuOpen` ao array de dependencias:

```tsx
useEffect(() => {
  document.body.style.overflow = isMenuOpen ? 'hidden' : ''
}, [isMenuOpen])  // Adicionar dependencia
```
```

## Severidade

| Prefixo | Significado |
|---------|-------------|
| `[CRITICO]` | Bloqueia merge |
| `[IMPORTANTE]` | Deve corrigir |
| `[SUGESTAO]` | Opcional |
| `[PERGUNTA]` | Clarificacao |

## Estados de Review

### Approve

```markdown
## ✅ Aprovado
PR pronta para merge.
```

### Request Changes

```markdown
## ❌ Alteracoes Necessarias

### Criticos
- [ ] Problema 1

### Importantes
- [ ] Problema 2
```

### Comment

```markdown
## 💬 Comentarios
Sugestoes e duvidas.
```

## Boas Praticas

1. **Um comentario por problema**
2. **Seja construtivo e especifico**
3. **Explique o por que**
4. **Ofereca solucoes**
5. **Nao faca o merge - deixe para revisao humana**
