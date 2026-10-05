# FERA — regras para agentes de IA (Claude Code, Cursor, Copilot, etc.)

Este arquivo é a fonte única de regras estruturais do projeto. Todo assistente
de IA que editar este repositório deve segui-lo. O mesmo conteúdo está
espelhado em `.cursorrules`; mantenha os dois em sincronia se um for editado.

Baseado nas diretrizes oficiais de estilo Dart/Flutter (Effective Dart,
`docs.flutter.dev/ai`) somadas às regras específicas deste projeto abaixo, que
têm prioridade em caso de conflito.

## Sobre o app

FERA é um app de gestão de orçamentos para uma empresa de estruturas
metálicas (portões basculantes, estruturas treliçadas, grades de proteção).
Permite montar, calcular e enviar orçamentos B2B, com catálogo de produtos e
cronograma de tarefas. Android e iOS. Sem backend: persistência local em
arquivos JSON (`LocalJsonStorage`, em `lib/core/utils/`).

## Estrutura de pastas (feature-first)

```
lib/
  core/
    di/         # providers riverpod compartilhados entre features
    router/      # AppRouter (go_router) — única fonte de rotas do app
    theme/       # AppTheme + tokens (AppColors, AppTextStyles, AppSpacing)
    widgets/     # componentes visuais compartilhados (AppTopBar, StatCard...)
    utils/       # utilitários genéricos (ex: LocalJsonStorage)
    constants/   # constantes globais (ex: AppConstants)
  features/
    dashboard/
    orcamentos/
    catalogo/
    cronograma/
```

Cada feature em `features/<nome>/` tem exatamente:

- `domain/` — modelos (freezed) e contratos de repositório (`abstract class
  XRepository`). Sem I/O, sem Flutter widgets.
- `data/` — implementações de repositório (ex: `LocalXRepository`) e os
  providers riverpod que as expõem. Aqui, e só aqui, entra I/O
  (`LocalJsonStorage`, `path_provider`, etc).
- `presentation/` — widgets, telas, controllers/notifiers riverpod da UI.
- `<nome>.dart` — barrel: único ponto de import público da feature. Código
  fora da feature importa `features/<nome>/<nome>.dart`, nunca arquivos
  internos de `data/`/`domain/`/`presentation/` diretamente.

Não crie pastas globais por tipo na raiz de `lib/` (`models/`, `widgets/`,
`services/`, `screens/`, etc.). Se um arquivo não se encaixa em `core/` nem em
uma feature existente, pare e pergunte antes de criar uma categoria nova.

## Regras específicas (não negociáveis)

1. **Não crie uma segunda versão de um utilitário/repositório que já existe
   em outro lugar.** Antes de escrever um novo helper, storage, ou
   repository, procure por algo equivalente em `core/` ou na feature
   relevante e reutilize/estenda.
2. **Todo modelo de dado usa `freezed` + `json_serializable`.** Nunca crie uma
   classe de modelo manual (com `copyWith`/`==`/`toJson` escritos à mão).
   Padrão usado neste projeto: `@freezed abstract class X with _$X { const
   factory X({...}) = _X; const X._(); factory X.fromJson(...) => ...; }`
   (o construtor nomeado `._()` — quando existir, para getters computados —
   vem depois do `factory` no código, mas veja a ordem exigida pelo lint
   `sort_unnamed_constructors_first`: o construtor default/factory sem nome
   vem primeiro no arquivo gerado; siga o padrão dos arquivos existentes em
   `lib/features/orcamentos/domain/`).
3. **Toda tela nova registra sua rota em `lib/core/router/app_router.dart`.**
   Nunca use `Navigator.push`/`Navigator.of(context).push` diretamente nas
   features — isso quebra deep linking e a navegação centralizada do
   `go_router`.
4. **Gerência de estado é riverpod (`@riverpod`/`riverpod_annotation`) com
   `build_runner`.** Não introduza outro gerenciador de estado (Bloc,
   Provider clássico, GetX, `setState` para estado compartilhado entre
   widgets, etc).
5. **Rode `flutter analyze` mentalmente antes de considerar a tarefa
   concluída.** O projeto usa `very_good_analysis` com `--fatal-infos` no CI
   — nenhuma regra de lint pode ficar violada, e nenhuma regra pode ser
   desativada em `analysis_options.yaml` sem pedido explícito do usuário.
   Lembre de rodar `dart run build_runner build --delete-conflicting-outputs`
   depois de mexer em qualquer modelo freezed/provider riverpod, já que
   `*.g.dart`/`*.freezed.dart` não são versionados.
6. **Cores só em `lib/core/theme/app_colors.dart`.** Nenhum `Color(0x...)`
   fora desse arquivo; widgets leem `context.colors` (claro/escuro), textos
   usam `AppTextStyles` e espaçamentos `AppSpacing`. Antes de criar um widget
   visual, veja se já existe um equivalente em `lib/core/widgets/`.
7. **Todo repository novo precisa de teste correspondente** em `test/unit/`
   (e um mock em `test/mocks/` se outras camadas dependem dele). Veja
   `test/README.md`.

## Domínio do negócio — não invente campos fora disso

Um **Orçamento** (`lib/features/orcamentos/domain/orcamento.dart`) é sempre a
composição de exatamente estas quatro partes (que também são as 4 etapas do
wizard de criação):

1. **Cliente** (`Cliente`) — dados do cliente (nome, telefone, email,
   endereço).
2. **Itens** (`List<ItemOrcamento>`) — serviços/materiais/medidas, cada um
   com descrição e quantidade (descritivos: não entram no valor final). Pode
   referenciar um `ProdutoCatalogo`.
3. **Custos operacionais** (`CustosOperacionais`) — matéria-prima, mão de
   obra, insumos, combustível, impostos.
4. **Valor final** — **não é um campo digitado**. É sempre calculado
   (getter `Orcamento.valorFinal`) como
   `calcularValorFinal(calcularTotalCustos(custos), margem)`, funções puras
   em `orcamentos/domain/calculo_orcamento.dart`, com a margem padrão em
   `AppConstants.margemPadraoPercentual` (provisória: 62,5%). Se a lógica de
   cálculo mudar, mude essas funções — não adicione um campo `valorFinal`
   gravável no freezed.

Um orçamento também tem `status` (`StatusOrcamento`: `emAnalise`, `enviado`,
`aprovado`, `recusado` — não adicione outros status sem alinhar com o time).

Um **ProdutoCatalogo** tem `nome`, `categoria`, `descricaoTecnica` e
opcionalmente uma foto (`fotoPath`).

Uma **Tarefa** do cronograma tem `titulo`, `data`, `tipo` (`TipoTarefa`:
`orcamento`, `producao` ou `visita`) e `concluida`.

Não invente campos, entidades ou relações fora do que está descrito aqui sem
perguntar antes.

## Geração de código

```bash
dart run build_runner build --delete-conflicting-outputs   # gera uma vez
dart run build_runner watch --delete-conflicting-outputs   # gera continuamente
```

Necessário sempre que você criar/editar uma classe `@freezed` ou um provider
`@riverpod`.

## Hot reload (assistentes com MCP do Dart/Flutter configurado)

Regra oficial do Flutter (`flutter/agent-plugins`): ao editar qualquer
arquivo `.dart` em `lib/`, se você tiver acesso às ferramentas MCP do Dart
(`hot_reload`/`hot_restart`/`dtd`) e houver um app rodando, dispare
`hot_reload` após mudanças em widgets/`build()`, ou `hot_restart` após
mudanças em `initState`, estado global/estático ou `main()`. Não dispare para
mudanças em `test/**` ou apenas em comentários/whitespace. Se você não tem
essas ferramentas MCP disponíveis, ignore esta seção.
