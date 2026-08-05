# Lista de Treinos

Aplicativo Flutter desenvolvido para a **Avaliação 1** da disciplina *Desenvolvimento Multiplataforma 3* (IFSP Câmpus São Carlos).

O app permite cadastrar, visualizar e excluir treinos de academia, com persistência local em banco de dados **SQLite**.

## Requisitos atendidos

| Requisito do enunciado | Onde está implementado |
|---|---|
| Lista principal exibindo os dados dos itens | [`lib/screens/lista_treinos.dart`](lib/screens/lista_treinos.dart) — `ListView.builder` |
| Cada item com pelo menos 3 informações | [`lib/model/treino.dart`](lib/model/treino.dart) — exercício, séries, repetições e data (4 campos) |
| Tela principal com a lista | [`lib/screens/lista_treinos.dart`](lib/screens/lista_treinos.dart) |
| Tela para digitar os dados de um novo elemento | [`lib/screens/tela_cadastro.dart`](lib/screens/tela_cadastro.dart) |
| Tela para exibir dados do elemento clicado + confirmação de exclusão | [`lib/screens/tela_detalhe.dart`](lib/screens/tela_detalhe.dart) |
| Armazenamento em banco local SQLite | [`lib/util/dbhelper.dart`](lib/util/dbhelper.dart) (pacote `sqflite`) |

## Funcionamento

1. A tela inicial (**Lista de Treinos**) carrega e exibe todos os treinos salvos no banco SQLite.
2. Tocar no botão flutuante (**+**) abre a tela de **cadastro**, onde é possível informar exercício, séries e repetições (a data é preenchida automaticamente). Ao salvar, o treino é gravado no banco e a lista é atualizada.
3. Tocar em um item da lista abre a tela de **detalhes**, exibindo todas as informações do treino e um botão **EXCLUIR**, que pede confirmação antes de remover o registro do banco.

## Estrutura do projeto

```
lib/
├── main.dart
├── model/
│   └── treino.dart        # Classe Treino (id, exercício, séries, repetições, data)
├── util/
│   └── dbhelper.dart       # Acesso ao banco SQLite (CRUD)
└── screens/
    ├── lista_treinos.dart  # Tela 1: lista principal
    ├── tela_cadastro.dart  # Tela 2: cadastro de novo treino
    └── tela_detalhe.dart   # Tela 3: detalhes + exclusão
```

## Tecnologias

- [Flutter](https://flutter.dev) / Dart
- [sqflite](https://pub.dev/packages/sqflite) — persistência local SQLite
- [path_provider](https://pub.dev/packages/path_provider) — localização do arquivo do banco
- [intl](https://pub.dev/packages/intl) — formatação de data

## Como executar

Pré-requisitos: [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado e configurado (Android Studio + emulador ou dispositivo físico).

```bash
flutter pub get
flutter run
```

## Autor

Trabalho individual — DM3 2026.2
