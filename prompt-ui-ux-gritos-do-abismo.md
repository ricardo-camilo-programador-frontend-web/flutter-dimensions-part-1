# Prompt UI/UX - Gritos do Abismo: Despertador Macabro

## 🎯 BRIEFING GERAL

Crie uma interface de usuário imersiva e experiência de usuário revolucionária para o aplicativo **"Gritos do Abismo"** - um despertador que transforma o momento de acordar em uma experiência de horror psicológico. O design deve ser **responsivo**, **acessível** e **funcional** em todos os dispositivos, mantendo a atmosfera macabra e a eficácia do despertador, com foco principal na **retenção e engajamento contínuo dos usuários**.

## 💡 PRINCÍPIOS DE UX/UI PARA ENGAJAMENTO E RETENÇÃO

### **Princípios Fundamentais**
- **Valor Imediato**: Demonstrar benefícios claros nos primeiros 30 segundos de uso
- **Progressão Visível**: Mostrar evolução constante do usuário no "Abismo"
- **Feedback Constante**: Recompensar cada interação com feedback visual, sonoro ou tátil
- **Personalização Profunda**: Permitir customização de elementos críticos para criar conexão emocional
- **Momentos de Surpresa**: Introduzir elementos inesperados para manter interesse (novos sons, desafios)

### **Gatilhos Comportamentais**
- **Gatilhos Externos**: Notificações contextuais em horários estratégicos (21h: "Prepare-se para o Abismo")
- **Gatilhos Internos**: Criar associações emocionais ("Só consigo acordar com o Abismo")
- **Loops de Engajamento**: Ação → Recompensa → Investimento → Ação
- **Escassez e FOMO**: Sons exclusivos por tempo limitado ou desbloqueáveis apenas em sequências específicas

### **Arquitetura de Escolha**
- **Opções Limitadas**: Oferecer 3-5 escolhas por tela para evitar paralisia de decisão
- **Defaults Inteligentes**: Pré-selecionar opções que maximizem engajamento
- **Micro-compromissos**: Solicitar pequenas ações antes de grandes compromissos
- **Redução de Atrito**: Eliminar passos desnecessários em fluxos críticos (configurar alarme em 3 toques)

---

## 🎨 DESIGN SYSTEM & IDENTIDADE VISUAL

### **Paleta de Cores Principal**
- **Preto Profundo**: `#0A0A0A` - Fundo principal e elementos base
- **Vermelho Sangue**: `#8B0000` - Elementos de destaque e ações críticas
- **Vermelho Escuro**: `#660000` - Elementos secundários e hover states
- **Cinza Morto**: `#2F2F2F` - Elementos de interface e cards
- **Cinza Claro**: `#4A4A4A` - Bordas e separadores
- **Branco Fantasma**: `#F5F5F5` - Texto principal e elementos de foco
- **Verde Tóxico**: `#32CD32` - Indicadores ativos e sucessos
- **Laranja Abismo**: `#FF4500` - Alertas e elementos de urgência

### **Tipografia**
- **Fonte Principal**: "Creepster" ou similar gótica para títulos e elementos de marca
- **Fonte Secundária**: "Courier New" para elementos técnicos e horários
- **Fonte UI**: Sans-serif moderna para interface e legibilidade
- **Hierarquia**: Títulos grandes e impactantes (24px+), texto legível (16px), microtexto (12px)

### **Elementos Visuais**
- **Ícones**: Caveiras estilizadas, relógios quebrados, ampulhetas, símbolos do abismo
- **Animações**: Pulsação vermelha, efeito de "respiração", fade in/out com névoa
- **Transições**: Suaves mas impactantes, duração 300-500ms
- **Feedback**: Vibração intensa + som perturbador + feedback visual

---

## 📱 ESTRUTURA DE TELAS PRINCIPAIS

### **1. TELA DE BLOQUEIO (LOCK SCREEN)**
**Objetivo**: Primeiro contato visual, mostrar hora e status do alarme

**Elementos**:
- **Header**: Logo "GRITOS DO ABISMO" em fonte gótica, posição superior
- **Relógio Digital**: Hora atual em fonte grande e impactante (48px+)
- **Data**: Formato "Quinta-feira, 21 de Março" em fonte secundária
- **Status do Alarme**: "ALARME ATIVO - 07:30" com ícone de caveira
- **Botão Principal**: "DESPERTAR AGORA" circular com efeito de pulsação
- **Indicadores**: Wi-Fi, bateria, notificações em cantos superiores
- **Background**: Gradiente preto com efeitos sutis de névoa vermelha

**Interações**:
- Tap no botão principal → Tela de despertar
- Swipe up → Desbloquear para configurações
- Long press → Modo de emergência

### **2. TELA PRINCIPAL (HOME)**
**Objetivo**: Hub central com acesso rápido a todas as funcionalidades

**Layout**: Grid responsivo 2x2 com cards principais

**Cards Principais**:
1. **"PRÓXIMO ALARME"**
   - Horário grande e destacado
   - Nome do alarme personalizado
   - Ícone de caveira com expressão
   - Botão "EDITAR" sutil

2. **"SONS DO ABISMO"**
   - Preview do som atual
   - Waveform animado em vermelho
   - Botão de play/pause
   - Contador de sons disponíveis

3. **"ESTATÍSTICAS DO ABISMO"**
   - Dias consecutivos acordando
   - Tempo médio para "escapar"
   - Nível atual no abismo
   - Progresso visual

4. **"CONFIGURAÇÕES"**
   - Acesso rápido às principais opções
   - Status de permissões
   - Modo atual (Normal/Abismo/Pânico)

**Navegação Inferior**:
- Ícones circulares com efeito glow
- Labels: "Início", "Alarmes", "Sons", "Perfil", "Config"

### **3. TELA DE ALARMES (CRUD)**
**Objetivo**: Gerenciamento completo de alarmes com personalização

**Header**:
- Título "ALARMES DO ABISMO"
- Botão "+" para novo alarme
- Filtros: Ativos/Inativos/Todos

**Lista de Alarmes**:
- **Card de Alarme**:
  - Horário em destaque (24px)
  - Nome personalizado editável
  - Ícone de caveira com expressão baseada no som
  - Status visual (ativo/inativo)
  - Botões: Editar, Duplicar, Excluir
  - Indicador de repetição (dias da semana)

**Modal de Criação/Edição**:
- **Seção 1**: Horário e Nome
  - Seletor de hora estilo relógio analógico
  - Campo de texto para nome personalizado
  - Preview do nome em tempo real

- **Seção 2**: Som do Abismo
  - Lista de sons com preview
  - Waveform animado para cada opção
  - Botão de teste para cada som
  - Categoria: Gritos/Avisos/Ameaças

- **Seção 3**: Configurações Avançadas
  - Volume gradual (slider)
  - Vibração (padrões: Coração/Abismo/Pânico)
  - Snooze (5/10/15 minutos)
  - Repetição (dias específicos)
  - Modo Abismo (Normal/Avançado/Pânico)

### **4. TELA DE BIBLIOTECA DE SONS**
**Objetivo**: Seleção e preview de sons perturbadores

**Header**:
- Título "BIBLIOTECA DO ABISMO"
- Barra de pesquisa
- Filtros por categoria

**Categorias**:
1. **"GRITOS DE DESESPERO"**
   - Sons mais intensos e perturbadores
   - Ícone: Caveira gritando
   - Cor: Vermelho intenso

2. **"AVISOS MÓRBIDOS"**
   - Mensagens sussurrantes e ameaçadoras
   - Ícone: Caveira sussurrando
   - Cor: Laranja abismo

3. **"AMEAÇAS DO ABISMO"**
   - Vozes múltiplas e cavernosas
   - Ícone: Múltiplas caveiras
   - Cor: Verde tóxico

**Lista de Sons**:
- **Card de Som**:
  - Nome do som em destaque
  - Waveform animado em tempo real
  - Duração e intensidade
  - Botões: Play, Favoritar, Download
  - Indicador de uso atual

**Player de Preview**:
- Controles de play/pause/stop
- Slider de progresso
- Controles de volume
- Botão de loop

### **5. TELA DE DESPERTAR (ALARM TRIGGERED)**
**Objetivo**: Experiência imersiva e eficaz de despertar

**Estados Progresivos**:

**Estado 1 - Pré-Alarme (5 min antes)**:
- Tela escura com sussurros leves
- Texto: "O abismo está se aproximando..."
- Efeito de névoa sutil

**Estado 2 - Alarme Principal**:
- Tela vermelha pulsante
- Som escolhido em volume crescente
- Vibração intensa
- Botão "DESPERTAR" grande e pulsante
- Texto motivacional macabro

**Estado 3 - Modo Pânico (30s sem resposta)**:
- Tela vermelha intensa
- Sons mais perturbadores
- Vibração máxima
- Múltiplos botões para parar
- Texto de urgência extrema

**Interações de Parada**:
- **Método 1**: Tap no botão principal
- **Método 2**: Shake do dispositivo
- **Método 3**: Reconhecimento de voz
- **Método 4**: Resolver puzzle simples

### **6. TELA DE CONFIGURAÇÕES**
**Objetivo**: Personalização completa da experiência

**Seções**:

**"CONFIGURAÇÕES GERAIS"**:
- Modo de tema (Normal/Abismo/Extremo)
- Intensidade do terror (1-10)
- Volume padrão
- Vibração padrão

**"MODO ABISMO AVANÇADO"**:
- Detecção de movimento (on/off)
- Reconhecimento de voz (on/off)
- Tempo para modo pânico (15s/30s/60s)
- Confirmação de despertar (simples/complexa)

**"PERSONALIZAÇÃO"**:
- Upload de sons customizados
- Temas visuais alternativos
- Animações (suaves/intensas)
- Notificações (frequência e tipo)

**"ESTATÍSTICAS E GAMIFICAÇÃO"**:
- Exibir conquistas (on/off)
- Compartilhar progresso (on/off)
- Ranking público (on/off)
- Histórico detalhado (on/off)

**"PERMISSÕES"**:
- Notificações
- Vibração
- Microfone
- Sensores de movimento
- Armazenamento

---

## 🎮 EXPERIÊNCIA DO USUÁRIO (UX)

### **Estratégias de Onboarding Eficazes**

**Jornada de Primeira Utilização (First-Time User Experience)**:
- **Micro-onboarding**: Dividir o processo em 3-4 telas com uma única ação por tela
- **Contextual Onboarding**: Ensinar funcionalidades apenas quando o usuário precisa delas
- **Onboarding Progressivo**: Revelar recursos avançados apenas após domínio das funções básicas
- **Personalização Imediata**: Permitir customização de um elemento-chave nos primeiros 60 segundos

**Técnicas de Ativação**:
- **Momento "Aha!"**: Criar experiência de despertar simulada para demonstrar valor imediato
- **Gamificação do Onboarding**: Recompensar cada etapa concluída com desbloqueio de conteúdo
- **Storytelling Imersivo**: Narrativa de "descida ao abismo" que contextualiza funcionalidades
- **Social Proof**: Mostrar estatísticas de usuários que melhoraram rotina matinal com o app

**Redução de Abandono**:
- **Onboarding Skippable**: Permitir pular etapas com defaults inteligentes pré-configurados
- **Recuperação Contextual**: Detectar abandono e oferecer retomada do ponto exato de saída
- **Feedback em Tempo Real**: Validação instantânea de cada configuração feita pelo usuário
- **Suporte Proativo**: Oferecer ajuda contextual antes que o usuário precise solicitar

### **Fluxo Principal de Uso**

**1. Primeiro Acesso**:
- Onboarding com avisos de conteúdo perturbador
- Tutorial interativo das funcionalidades
- Configuração inicial de permissões
- Seleção do primeiro som do abismo

**2. Configuração de Alarme**:
- Interface intuitiva com preview em tempo real
- Validação de horários e configurações
- Confirmação antes de salvar
- Feedback visual de sucesso

**3. Experiência de Despertar**:
- Transição suave do sono para o alerta
- Progressão gradual de intensidade
- Múltiplas opções de parada
- Confirmação de que realmente acordou

**4. Pós-Despertar**:
- Mensagem motivacional macabra
- Registro de estatísticas
- Sugestões de melhorias
- Opção de feedback

### **Técnicas de Gamificação para Fidelização**

**Mecânicas de Engajamento**:
- **Streaks Diários**: Sequências de uso consecutivo com recompensas crescentes
- **Economia Virtual**: "Almas" coletadas ao despertar que desbloqueiam conteúdo premium
- **Progressão Não-Linear**: Múltiplos caminhos de evolução baseados no estilo do usuário
- **Colecionáveis**: Sons raros, temas sazonais e itens de personalização limitados

**Sistema de Conquistas**:
- "Sobreviveu 7 dias seguidos ao abismo"
- "Escapou do abismo em menos de 30 segundos"
- "Completou 30 alarmes sem snooze"
- "Alcançou nível 10 de terror"
- **Conquistas Surpresa**: Desbloqueáveis não anunciados que geram descoberta e compartilhamento
- **Conquistas em Camadas**: Níveis bronze, prata e ouro para cada desafio

**Níveis de Progresso**:
- Visualização de "profundidade no abismo"
- Badges por marcos alcançados
- Ranking com outros usuários
- Histórico de evolução
- **Progressão Adaptativa**: Dificuldade ajustada automaticamente para manter engajamento
- **Feedback de Progresso**: Visualizações comparativas (semana atual vs. anterior)

**Desafios e Competição**:
- **Desafios Diários**: Acordar em horários específicos
- **Desafios Semanais**: Usar sons diferentes do abismo
- **Desafios Sazonais**: Eventos temáticos em datas especiais (Halloween, Sexta 13)
- **Competição Social**: Grupos de "Sobreviventes do Abismo" com rankings compartilhados
- **Colaboração**: Desafios em grupo onde amigos precisam acordar em sequência

### **Acessibilidade e Inclusão**

**Opções de Acessibilidade**:
- Modo de alto contraste
- Tamanhos de fonte ajustáveis
- Animações reduzidas
- Feedback tátil alternativo

**Considerações Éticas**:
- Avisos claros sobre conteúdo perturbador
- Opções para usuários sensíveis
- Modo "suave" para iniciantes
- Recursos de ajuda e suporte

**Idiomas e Localização**:
- Português brasileiro (principal)
- Inglês (secundário)
- Adaptação cultural de elementos macabros

---

## 🔧 ESPECIFICAÇÕES TÉCNICAS

### **Responsividade**
- **Mobile First**: Design otimizado para smartphones
- **Tablet**: Adaptação para telas médias
- **Desktop**: Interface web complementar
- **Breakpoints**: 320px, 768px, 1024px, 1440px

### **Performance**
- **Carregamento**: < 3 segundos
- **Animações**: 60fps suaves
- **Áudio**: Pré-carregamento inteligente
- **Bateria**: Otimização para uso noturno

### **Compatibilidade**
- **iOS**: 14.0+
- **Android**: 8.0+
- **Web**: Chrome, Safari, Firefox, Edge
- **PWA**: Instalação como app nativo

### **Tecnologias Recomendadas**
- **Frontend**: React/Next.js com TypeScript
- **Styling**: Tailwind CSS + CSS customizado
- **Animações**: Framer Motion
- **Áudio**: Web Audio API
- **PWA**: Service Workers
- **Backend**: Node.js/Express (opcional)

---

## 🎭 PADRÕES DE DESIGN PARA INTERFACES PERSUASIVAS

### **Princípios de Design Persuasivo**
- **Escassez**: Conteúdo exclusivo por tempo limitado (sons sazonais disponíveis apenas em datas específicas)
- **Reciprocidade**: Oferecer valor gratuito antes de solicitar compromisso (sons premium gratuitos por 7 dias)
- **Prova Social**: Exibir estatísticas de uso e depoimentos de usuários ("95% dos usuários acordam na primeira tentativa")
- **Autoridade**: Incorporar recomendações de especialistas em sono e produtividade
- **Consistência**: Solicitar pequenos compromissos antes de grandes ações (definir meta antes do alarme)

### **Padrões de Interface Persuasiva**
- **Feedback Instantâneo**: Resposta visual/sonora/tátil para cada interação do usuário
- **Recompensas Variáveis**: Sistema de recompensas imprevisível que mantém interesse (sons surpresa)
- **Efeito Endowed Progress**: Mostrar progresso já iniciado ("Você já completou 20% do seu perfil")
- **Efeito Ikea**: Permitir que usuários criem/personalizem elementos para aumentar valor percebido
- **Efeito Zeigarnik**: Criar loops abertos que incentivam retorno ("Complete sua sequência de 7 dias")

### **Elementos de UI Persuasiva**
- **Call-to-Actions Contextuais**: Botões que mudam baseados no comportamento do usuário
- **Microinterações Significativas**: Pequenas animações que recompensam cada ação
- **Narrativa Visual**: Elementos de UI que contam história do progresso do usuário no "Abismo"
- **Gatilhos de Ação**: Notificações e lembretes contextuais em momentos estratégicos
- **Redução de Fricção**: Simplificação extrema de fluxos críticos (configurar alarme em 3 toques)

## 📊 ANÁLISE DE MÉTRICAS DE RETENÇÃO

### **Métricas-Chave de Retenção**
- **Retenção D1/D7/D30**: Percentual de usuários que retornam após 1, 7 e 30 dias
- **Churn Rate**: Taxa de abandono segmentada por perfil de usuário e tempo de uso
- **Lifetime Value (LTV)**: Valor gerado por usuário ao longo do ciclo de vida
- **Custo de Aquisição (CAC)**: Custo para adquirir novo usuário vs. retenção
- **Frequência de Uso**: Número médio de sessões por semana/mês
- **Duração de Sessão**: Tempo médio gasto no aplicativo por sessão
- **Profundidade de Engajamento**: Número de telas/features acessadas por sessão

### **Funis de Análise**
- **Funil de Ativação**: Instalação → Onboarding → Primeiro Alarme → Despertar Bem-Sucedido
- **Funil de Engajamento**: Uso Diário → Personalização → Exploração de Recursos → Compartilhamento
- **Funil de Monetização**: Uso Gratuito → Visualização de Premium → Teste → Assinatura
- **Funil de Recuperação**: Inatividade → Notificação → Retorno → Reengajamento

### **Segmentação e Cohortes**
- **Por Comportamento**: Usuários matinais vs. noturnos, heavy users vs. casuais
- **Por Perfil**: Faixa etária, localização, dispositivo
- **Por Fonte**: Origem da instalação (orgânica, paga, indicação)
- **Por Tempo**: Análise de cohortes semanais/mensais para identificar padrões de retenção

### **Engajamento**
- Tempo médio de uso diário
- Taxa de retenção semanal/mensal
- Número de alarmes configurados
- Uso de funcionalidades avançadas
- **Stickiness**: Razão entre DAU (Usuários Ativos Diários) e MAU (Usuários Ativos Mensais)
- **Net Promoter Score (NPS)**: Medição da propensão de recomendação

### **Eficácia**
- Taxa de sucesso de despertar
- Tempo médio para parar o alarme
- Redução no uso de snooze
- Feedback positivo dos usuários
- **Taxa de Conclusão de Tarefas**: Percentual de usuários que completam fluxos críticos
- **Tempo até Valor**: Quanto tempo até o usuário experimentar o benefício principal

### **Experiência**
- NPS (Net Promoter Score)
- Avaliações na App Store
- Tempo de resolução de problemas
- Satisfação com suporte
- **User Effort Score**: Facilidade percebida para realizar tarefas principais
- **Emotional Response**: Medição de reações emocionais durante uso (via feedback)

## 🔍 EXEMPLOS PRÁTICOS E MELHORES PRÁTICAS

### **Casos de Sucesso no Mercado**
- **Calm**: Onboarding com benefício imediato (respiração guiada de 1 minuto)
- **Duolingo**: Streaks e gamificação para criar hábito diário
- **Headspace**: Progressão visual clara e recompensas por consistência
- **Strava**: Competição social e comparação de desempenho
- **Habitica**: Transformação de tarefas em elementos de RPG

### **Aplicação no Gritos do Abismo**
- **Onboarding Otimizado**: Tutorial interativo de 60 segundos com simulação de despertar
- **Notificações Estratégicas**: Lembretes 30 minutos antes do horário de dormir
- **Gamificação Contextual**: "Almas" coletadas proporcionais à rapidez do despertar
- **Personalização Progressiva**: Desbloqueio gradual de opções de customização
- **Compartilhamento Social**: Geração automática de cards com estatísticas de despertar

### **Melhores Práticas de Retenção**
- **Primeira Semana Crítica**: Foco intenso em engajamento nos primeiros 7 dias
- **Comunicação Multicanal**: Push, email e in-app messaging coordenados
- **Reativação Planejada**: Campanhas específicas para usuários inativos
- **Feedback Loop**: Implementação rápida baseada em feedback de usuários
- **Testes A/B Contínuos**: Experimentação constante em elementos críticos de retenção

---

## 🎯 OBJETIVOS FINAIS

1. **Criar uma experiência única** que diferencie o app de outros despertadores
2. **Manter a eficácia** do despertar mesmo com a temática macabra
3. **Garantir usabilidade** para todos os tipos de usuários
4. **Fomentar engajamento** através da gamificação
5. **Estabelecer uma marca forte** memorável e viral
6. **Respeitar limites éticos** e de acessibilidade
7. **Maximizar retenção de usuários** através de design persuasivo e valor contínuo
8. **Criar hábitos de uso** utilizando gatilhos comportamentais e loops de engajamento
9. **Otimizar métricas-chave** de retenção D1, D7 e D30 acima de benchmarks do setor
10. **Implementar sistema de feedback** que permita evolução contínua baseada em dados

O design deve equilibrar perfeitamente a atmosfera de horror com a funcionalidade prática, criando uma experiência que seja tanto eficaz quanto memorável, com foco principal na retenção e engajamento contínuo dos usuários através de princípios de UX/UI baseados em psicologia comportamental e dados de uso.