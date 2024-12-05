# Pimenta Productivity

Pimenta Productivity é um aplicativo multifuncional criado por Marcelo Pimenta. Ele combina ferramentas úteis para o dia a dia com jogos divertidos, oferecendo uma experiência completa para os usuários.

## Funcionalidades

- **Escolha do Combustível**: Calcule a opção mais econômica entre álcool e gasolina.
- **Frases do Dia**: Receba frases motivacionais diariamente.
- **Jogos**:
  - **Jokenpô**: Jogue pedra, papel e tesoura contra o aplicativo.
  - **Cara ou Coroa**: Teste sua sorte com o tradicional jogo de moeda.
  - **Adivinhação de Número**: Tente adivinhar um número entre 1 e 100.

## Tecnologias Utilizadas

- **Flutter**: Framework principal para desenvolvimento do aplicativo.
- **Dart**: Linguagem de programação utilizada no Flutter.
- **flutter_animate**: Biblioteca utilizada para adicionar animações ao aplicativo.

## Instalação

1. Clone o repositório:

    ```sh
    git clone https://github.com/seu-usuario/pimenta_productivity.git
    ```

2. Navegue até o diretório do projeto:

    ```sh
    cd pimenta_productivity
    ```

3. Instale as dependências:

    ```sh
    flutter pub get
    ```

4. Execute o aplicativo:

    ```sh
    flutter run
    ```

## Configuração do Ícone do Aplicativo

Para configurar o ícone do aplicativo, siga os passos abaixo:

1. Adicione as imagens do ícone no diretório `assets/icons/`.

2. Configure o plugin `flutter_launcher_icons` no arquivo `pubspec.yaml`:

    ```yaml
    flutter_icons:
      android: true
      ios: true
      image_path: "assets/icons/app_icon.png"
    ```

3. Gere os ícones do aplicativo:

    ```sh
    flutter pub run flutter_launcher_icons:main
    ```

## Estrutura do Projeto

- **main.dart**: Arquivo principal do aplicativo.
- **fuel_choice_screen.dart**: Tela de escolha do combustível.
- **daily_quotes_screen.dart**: Tela de frases do dia.
- **games_screen.dart**: Tela principal dos jogos.
- **jokenpo_screen.dart**: Tela do jogo de Jokenpô.
- **coin_flip_screen.dart**: Tela do jogo de Cara ou Coroa.
- **number_guessing_game.dart**: Tela do jogo de adivinhação de número.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou pull requests para melhorias e correções.

---

Feito com ❤️ por Marcelo Pimenta
