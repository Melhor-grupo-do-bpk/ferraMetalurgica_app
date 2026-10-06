# Testes

- `unit/` — testes de unidade puros (sem Flutter widgets): cálculos, mapeamento JSON, regras de domínio.
- `widget/` — testes de widget (`testWidgets`) para telas e componentes de `presentation/`.
- `mocks/` — implementações `Mock` (mocktail) dos repositórios/contratos de `domain/`, reutilizadas pelos testes acima.

## Convenção

Todo `Repository` novo (contrato em `domain/`) e todo use case/serviço com lógica não trivial precisa de:

1. Um teste de unidade correspondente em `unit/`.
2. Um mock correspondente em `mocks/`, se outras camadas (ex: providers, widgets) dependem dele.

Rode os testes com:

```bash
flutter test
```
