# Guia de Correcoes de PR

## Regras

1. Cada erro = **um commit separado**
2. **Nao agrupar** correcoes
3. Validar apos cada correcao

## Fluxo

```
1. Identificar erro
       │
       ▼
2. Aplicar correcao minima
       │
       ▼
3. Validar localmente
   ├── npm run lint
   └── npm run build
       │
       ▼
4. Commit individual
       │
       ▼
5. Push
```

## Formato de Registro

```
Correcao aplicada:
<explicacao>

Commit gerado:
:emoji: tipo(BRANCH_REF): descricao
```

## Exemplos

### Exemplo 1: Hook Dependency

**Problema:**
```markdown
- [ ] useEffect sem dependencias
Arquivo: src/App.tsx, Linha: 25
```

**Correcao:**
```tsx
// ANTES
useEffect(() => {
  fetchData(id)
}, [])  // id nao esta nas dependencias

// DEPOIS
useEffect(() => {
  fetchData(id)
}, [id])  // Adicionado id
```

**Commit:**
```bash
:bug: fix(PORTFOLIO): adicionar dependencia id ao useEffect
```

### Exemplo 2: Key em Lista

**Problema:**
```markdown
- [ ] Lista sem key unica
Arquivo: src/components/Projects.tsx, Linha: 42
```

**Correcao:**
```tsx
// ANTES
{projects.map((project, index) => (
  <ProjectCard key={index} />
))}

// DEPOIS
{projects.map((project) => (
  <ProjectCard key={project.id} />
))}
```

**Commit:**
```bash
:bug: fix(PORTFOLIO): usar id como key em lista de projetos
```

### Exemplo 3: Tipo Any

**Problema:**
```markdown
- [ ] Uso de any
Arquivo: src/utils/api.ts, Linha: 10
```

**Correcao:**
```tsx
// ANTES
const response: any = await fetch(url)

// DEPOIS
interface ApiResponse {
  data: Project[]
}
const response: ApiResponse = await fetch(url)
```

**Commit:**
```bash
:label: fix(PORTFOLIO): tipar resposta da API de projetos
```

## Comandos

```bash
# Verificar lint
npm run lint

# Build
npm run build

# Commit
git add .
git commit -m ":bug: fix(PORTFOLIO): descricao"

# Push
git push origin nome-da-branch
```

## Checklist Final

- [ ] Todos problemas enderecados
- [ ] Lint OK
- [ ] Build OK
- [ ] Commits seguem padrao
- [ ] CI passa
