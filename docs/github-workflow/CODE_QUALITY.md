# Padroes de Qualidade de Codigo

## Stack do Projeto

| Tecnologia | Versao | Uso |
|------------|--------|-----|
| React | 19.x | Framework |
| TypeScript | 5.8.x | Linguagem |
| Vite | 6.x | Build |
| TailwindCSS | 4.x | Estilos |
| Express | 4.x | Backend |
| Motion | 12.x | Animacoes |

## TypeScript

### Tipos Explicitos

```tsx
// RUIM
const projects = []
function getData(id) { }

// BOM
interface Project {
  id: string
  title: string
  description: string
}

const projects: Project[] = []
function getProject(id: string): Promise<Project> { }
```

### Evite Any

```tsx
// RUIM
const response: any = await fetch(url)

// BOM
interface ApiResponse<T> {
  data: T
}
const response: ApiResponse<Project> = await fetch(url)
```

## React

### Componentes

```tsx
// BOM: Componente tipado
interface HeaderProps {
  title: string
  isMenuOpen?: boolean
}

export function Header({ title, isMenuOpen = false }: HeaderProps) {
  return (
    <header className="...">
      <h1>{title}</h1>
    </header>
  )
}
```

### Hooks

```tsx
// BOM: Hook com dependencias corretas
useEffect(() => {
  fetchProjects(category)
}, [category])  // Dependencia explicita

// RUIM: Dependencia faltando
useEffect(() => {
  fetchProjects(category)
}, [])  // category mudando nao re-executa
```

### Listas

```tsx
// BOM: Key unica
{projects.map((project) => (
  <ProjectCard key={project.id} project={project} />
))}

// RUIM: Index como key
{projects.map((project, index) => (
  <ProjectCard key={index} project={project} />
))}
```

### Estado

```tsx
// BOM: Estado imutavel
setProjects([...projects, newProject])

// RUIM: Mutacao direta
projects.push(newProject)
setProjects(projects)
```

## Estrutura de Arquivos

```
src/
├── App.tsx           # Componente principal
├── main.tsx          # Entry point
├── i18n.ts           # Configuracao i18n
├── index.css         # Estilos globais
├── components/       # Componentes (se houver)
├── hooks/            # Custom hooks (se houver)
├── utils/            # Funcoes utilitarias (se houver)
└── types/            # Tipos (se houver)
```

## TailwindCSS

### Organizacao

```tsx
// BOM: Classes organizadas
<button className="
  px-4 py-2
  bg-blue-500 hover:bg-blue-600
  text-white font-medium
  rounded-lg
  transition-colors
">
  Click me
</button>

// OU: Usando clsx/cn utility
<button className={cn(
  "px-4 py-2 rounded-lg font-medium",
  "bg-blue-500 hover:bg-blue-600",
  "text-white transition-colors"
)}>
```

### Responsividade

```tsx
// BOM: Mobile-first
<div className="
  flex flex-col
  md:flex-row
  lg:gap-8
">
```

## Comandos

```bash
# Desenvolvimento
npm run dev

# Build
npm run build

# Lint (type check)
npm run lint

# Preview
npm run preview
```

## Checklist de Qualidade

### Antes de Commit

- [ ] Codigo compila
- [ ] Lint passa (`npm run lint`)
- [ ] Build passa (`npm run build`)
- [ ] Sem console.log
- [ ] Responsividade ok

### Antes de PR

- [ ] Todos os checks acima
- [ ] Testado localmente
- [ ] Documentacao (se necessario)

## Metricas

### Complexidade

- **Target**: < 10 por funcao
- **Max**: 15

### Linhas por Funcao

- **Target**: < 30
- **Max**: 50

### Parametros

- **Target**: < 4
- **Max**: 5
