# Versionamento e Tags

## Versionamento Semantico

Formato: `MAJOR.MINOR.PATCH`

| Componente | Quando Incrementar |
|------------|-------------------|
| **MAJOR** | Breaking changes |
| **MINOR** | Novas funcionalidades |
| **PATCH** | Bug fixes |

### Exemplos

```
v1.0.0  → Release inicial
v1.0.1  → Bug fix
v1.1.0  → Nova feature (ex: nova secao)
v2.0.0  → Breaking change (ex: reestruturacao completa)
```

## Tipos de Tags

### Release

```bash
v1.0.0   # Release estavel
v1.1.0   # Minor release
v2.0.0   # Major release
```

### Pre-release

```bash
v1.0.0-beta.1    # Beta
v1.0.0-rc.1      # Release Candidate
```

## Criacao de Tags

```bash
# Criar tag annotada
git tag -a v1.0.0 -m "Release v1.0.0"

# Push da tag
git push origin v1.0.0
```

### GitHub CLI

```bash
# Criar release
gh release create v1.0.0 \
  --title "v1.0.0 - Release Inicial" \
  --notes-file CHANGELOG.md

# Pre-release
gh release create v1.0.0-beta.1 \
  --title "v1.0.0 Beta 1" \
  --prerelease
```

## Changelog

```markdown
# Changelog

## [1.1.0] - 2026-03-19

### Added
- Secao de projetos com filtros
- Suporte a multi-idiomas (PT/EN/ES)

### Fixed
- Menu mobile nao fechava

## [1.0.0] - 2026-03-01

### Added
- Release inicial do portfolio
```

## Comandos Uteis

```bash
# Listar tags
git tag

# Ver detalhes
git show v1.0.0

# Deletar tag local
git tag -d v1.0.0

# Deletar tag remota
git push origin --delete v1.0.0

# Checkout em tag
git checkout v1.0.0
```

## Checklist de Release

- [ ] Todas features testadas
- [ ] Lint sem erros
- [ ] Type-check sem erros
- [ ] Changelog atualizado
- [ ] Versao no package.json atualizada
- [ ] Tag criada e enviada
- [ ] Release criado no GitHub
