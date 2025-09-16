# Calculadora Flutter

Aplicativo de calculadora simples desenvolvido em **Flutter**, parte do
repositório *projetos_flutter*.

------------------------------------------------------------------------

## 💡 Visão Geral

Este projeto implementa uma calculadora com operações básicas (adição,
subtração, multiplicação, divisão e módulo).\
Possui interface intuitiva com botões customizados e campo de texto
controlado para exibir as expressões e resultados.

------------------------------------------------------------------------

## 🛠 Tecnologias Utilizadas

-   **Flutter** --- Framework para desenvolvimento multiplataforma.\
-   **Dart** --- Linguagem de programação principal.\
-   **Material Design** --- Widgets e componentes de interface.

------------------------------------------------------------------------

## 📂 Estrutura do Projeto

    calculadora/
    ├── lib/
    │   ├── main.dart                # Ponto de entrada da aplicação
    │   ├── pages/                   # Telas e componentes visuais
    │   │   ├── color/               # Definições de cores
    │   │   ├── components/          # Widgets reutilizáveis (botões, controladores)
    │   │   └── interface/           # Interface da aplicação
    │   ├── service/                 # Lógica e implementação dos cálculos
    │   └── interface/               # Definições de contratos/interfaces
    ├── pubspec.yaml                 # Configuração e dependências do projeto
    └── README.md

------------------------------------------------------------------------

## 🚀 Como Rodar o Projeto

1.  **Pré-requisitos**

    -   Ter o [Flutter](https://docs.flutter.dev/get-started/install)
        instalado.\
    -   Android Studio, VS Code ou outro editor configurado com
        Flutter.\
    -   Emulador ou dispositivo físico para execução.

2.  **Clone o repositório**

    ``` bash
    git clone https://github.com/diegof856/projetos_flutter.git
    ```

3.  **Acesse o diretório da calculadora**

    ``` bash
    cd projetos_flutter/calculadora
    ```

4.  **Instale as dependências**

    ``` bash
    flutter pub get
    ```

5.  **Execute o projeto**

    ``` bash
    flutter run
    ```

------------------------------------------------------------------------

## 🧮 Funcionalidades

-   Entrada de números e operadores básicos.\
-   Suporte ao operador de módulo (`%`).\
-   Exibição de resultados formatados.\
-   Botão de limpar expressão.\
-   Botões customizados com controle de cor.

------------------------------------------------------------------------

## ⚙️ Melhorias Futuras

-   Adicionar histórico de cálculos.\
-   Implementar operações avançadas (potência, raiz, trigonometria).\
-   Modo claro/escuro.\
-   Layout adaptado para tablets e desktop.

------------------------------------------------------------------------

## 📄 Licença

Este projeto é de uso livre para estudo e prática.
