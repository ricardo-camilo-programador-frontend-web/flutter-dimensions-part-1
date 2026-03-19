# Template de Pull Request

## Template Completo

```markdown
# 🐛 Fix: / ✨ Feature: Titulo da Mudanca

## 📝 Descricao
Descricao clara do que esta PR faz.

## 🎯 Tipo de Mudanca

- [ ] 🐛 Bug fix
- [ ] ✨ Feature
- [ ] ♻️ Refactor
- [ ] 📚 Documentacao
- [ ] 🎨 Styling
- [ ] 🌐 i18n/Content

## 🔗 Issue Relacionada
Fixes #XXX

## 📋 Mudancas Realizadas

### Mudanca 1
```tsx
// ANTES
const exemplo = 'antigo'

// DEPOIS  
const exemplo = 'novo'
```

## 🧪 Como Testar

1. Rode `npm run dev`
2. Navegue para pagina X
3. ✅ **Verifique**: Resultado esperado

## 📸 Screenshots

### Antes
Descricao ou screenshot

### Depois
Descricao ou screenshot

## ✅ Checklist

- [ ] Codigo segue padroes do projeto
- [ ] Lint OK (`npm run lint`)
- [ ] Type-check OK
- [ ] Testado localmente
- [ ] Responsividade verificada (mobile/desktop)

## 📁 Arquivos Modificados

```
src/App.tsx
src/components/Header.tsx
```
```

## Versao Simplificada

```markdown
# 🐛 Fix: Descricao

## Descricao
O que foi corrigido/adicionado.

## Issue
Fixes #XXX

## Mudancas
- Mudanca 1
- Mudanca 2

## Teste
1. Rode `npm run dev`
2. Verifique X

## Checklist
- [ ] Lint OK
- [ ] Type-check OK
- [ ] Testado
```

## Tipos de PR

| Tipo | Prefixo | Descricao |
|------|---------|-----------|
| Bug fix | 🐛 Fix: | Correcao de bug |
| Feature | ✨ Feature: | Nova funcionalidade |
| Refactor | ♻️ Refactor: | Refatoracao |
| Styling | 🎨 Style: | Mudancas visuais |
| Content | 📝 Content: | Textos/Traducoes |
| i18n | 🌐 i18n: | Internacionalizacao |
