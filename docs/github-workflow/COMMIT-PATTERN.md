# Padrao de Commits

## Formato

```
:emoji: tipo(escopo): descricao
```

## Componentes

| Componente | Exemplo |
|------------|---------|
| Emoji | `:bug:`, `:sparkles:` |
| Tipo | `fix`, `feat`, `refactor` |
| Escopo | `PORTFOLIO`, `HEADER`, `I18N` |
| Descricao | `corrigir menu mobile` |

## Emojis Principais

| Emoji | Codigo | Uso |
|-------|--------|-----|
| 🐛 | `:bug:` | Bug fix |
| ✨ | `:sparkles:` | Nova feature |
| ♻️ | `:recycle:` | Refatoracao |
| 🎨 | `:art:` | Estilo/UI |
| 📝 | `:memo:` | Documentacao |
| 🌐 | `:globe_with_meridians:` | i18n |
| ⚡️ | `:zap:` | Performance |
| 🔒️ | `:lock:` | Seguranca |
| 🔥 | `:fire:` | Remover codigo |
| 🚀 | `:rocket:` | Deploy/Release |

## Tipos

| Tipo | Emoji | Uso |
|------|-------|-----|
| `feat` | ✨ | Nova funcionalidade |
| `fix` | 🐛 | Bug fix |
| `refactor` | ♻️ | Refatoracao |
| `style` | 🎨 | Estilo/CSS |
| `docs` | 📝 | Documentacao |
| `i18n` | 🌐 | Internacionalizacao |
| `perf` | ⚡️ | Performance |
| `chore` | 🔧 | Manutencao |

## Exemplos

### Bug Fix
```bash
:bug: fix(PORTFOLIO): corrigir menu mobile nao fechando
```

### Feature
```bash
:sparkles: feat(PORTFOLIO): adicionar secao de contato
```

### Styling
```bash
:art: style(PORTFOLIO): ajustar espacamento do header
```

### i18n
```bash
:globe_with_meridians: i18n(PORTFOLIO): traduzir pagina About para espanhol
```

### Refactor
```bash
:recycle: refactor(PORTFOLIO): extrair componente ProjectCard
```

### Content
```bash
:memo: content(PORTFOLIO): atualizar descricao do perfil
```

## Linkando Issues

```bash
# Fecha issue
:bug: fix(PORTFOLIO): corrigir menu (fixes #10)

# Referencia
:sparkles: feat(PORTFOLIO): adicionar contato (refs #11)
```

## Boas Praticas

- **Titulo**: Max 72 caracteres
- **Verbo**: Infinitivo (corrigir, adicionar, remover)
- **Específico**: Evite "arrumei", "atualizei"
- **Agrupar**: Arquivos relacionados em um commit

## Referencias

- [Gitmoji](https://gitmoji.dev/)
- [Conventional Commits](https://www.conventionalcommits.org/)
