# Lista de Treinos

Aplicativo Flutter desenvolvido para a **Avaliação 2** da disciplina *Desenvolvimento Multiplataforma 3* (IFSP Câmpus São Carlos).

É o app da [Avaliação 1](https://github.com/LucasHenriqueMateo/dm3-avaliacao1-lista-treinos) adaptado para armazenar os dados **na nuvem**, no **Firebase Realtime Database** (antes: SQLite local).

O app permite cadastrar, visualizar e excluir treinos de academia.

## Requisitos atendidos

| Requisito do enunciado | Onde está implementado |
|---|---|
| **Av2:** armazenar os dados na nuvem (Realtime Database ou Firestore) | [`lib/util/dbhelper.dart`](lib/util/dbhelper.dart) — Firebase Realtime Database (pacote `firebase_database`), nó `treinos` |
| Lista principal exibindo os dados dos itens | [`lib/screens/lista_treinos.dart`](lib/screens/lista_treinos.dart) — `ListView.builder` |
| Cada item com pelo menos 3 informações | [`lib/model/treino.dart`](lib/model/treino.dart) — exercício, séries, repetições e data (4 campos) |
| Tela principal com a lista | [`lib/screens/lista_treinos.dart`](lib/screens/lista_treinos.dart) |
| Tela para digitar os dados de um novo elemento | [`lib/screens/tela_cadastro.dart`](lib/screens/tela_cadastro.dart) |
| Tela para exibir dados do elemento clicado + confirmação de exclusão | [`lib/screens/tela_detalhe.dart`](lib/screens/tela_detalhe.dart) |

## Funcionamento

1. A tela inicial (**Lista de Treinos**) carrega e exibe todos os treinos salvos no Realtime Database (mais recente primeiro).
2. Tocar no botão flutuante (**+**) abre a tela de **cadastro**, onde é possível informar exercício, séries e repetições (a data é preenchida automaticamente). Ao salvar, o treino é gravado na nuvem e a lista é atualizada.
3. Tocar em um item da lista abre a tela de **detalhes**, exibindo todas as informações do treino e um botão **EXCLUIR**, que pede confirmação antes de remover o registro da nuvem.

## Estrutura do projeto

```
lib/
├── main.dart               # Inicializa o Firebase e abre a lista
├── firebase_options.dart   # Configuração do projeto Firebase (gerado pelo FlutterFire CLI)
├── model/
│   └── treino.dart         # Classe Treino (id, exercício, séries, repetições, data)
├── util/
│   └── dbhelper.dart       # Acesso ao Firebase Realtime Database (inserir, listar, excluir)
└── screens/
    ├── lista_treinos.dart  # Tela 1: lista principal
    ├── tela_cadastro.dart  # Tela 2: cadastro de novo treino
    └── tela_detalhe.dart   # Tela 3: detalhes + exclusão
```

## Tecnologias

- [Flutter](https://flutter.dev) / Dart
- [firebase_core](https://pub.dev/packages/firebase_core) e [firebase_database](https://pub.dev/packages/firebase_database) — Firebase Realtime Database
- [intl](https://pub.dev/packages/intl) — formatação de data

## Como executar

Pré-requisitos: [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado e configurado (Android Studio + emulador ou dispositivo físico).

```bash
flutter pub get
flutter run
```

O projeto já aponta para o banco na nuvem (`lib/firebase_options.dart` e `android/app/google-services.json`). As regras do banco liberam leitura e escrita apenas no nó `treinos`, até 31/12/2026.

## Autor

Trabalho individual — DM3 2026.2
