# Estrutura do Projeto - Alla Kayan Portfolio

## Visao Geral

Portfolio profissional com sistema de traducao de conteudo e backend Express.

## Diretorios

```
alla-kayan-portfolio2.0/
├── src/
│   ├── components/         # Componentes React
│   │   ├── ui/             # Componentes UI
│   │   └── sections/       # Secoes da pagina
│   ├── pages/              # Paginas
│   ├── hooks/              # Custom Hooks
│   ├── utils/              # Funcoes utilitarias
│   └── types/              # Tipos TypeScript
├── server/                 # Backend Express
│   ├── routes/             # Rotas API
│   ├── db/                 # SQLite database
│   └── middleware/         # Middlewares
├── public/                 # Arquivos estaticos
├── docs/                   # Documentacao
│   └── github-workflow/    # Padroes GitHub
└── .github/                # Templates e CI/CD
```

## Convencoes

### Nomenclatura
- Componentes: PascalCase (HeroSection.tsx)
- Hooks: camelCase com prefixo use (useTranslation.ts)
- APIs: kebab-case (content-routes.ts)

## Stack

| Camada | Tecnologia |
|--------|------------|
| Frontend | React 19 + Vite |
| Backend | Express |
| Database | SQLite |
| Estilos | TailwindCSS v4 |
| Linguagem | TypeScript |
