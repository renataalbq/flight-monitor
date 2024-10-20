# FlightMonitor

FlightMonitor é um app desenvolvido em swift para acompanhar o status de voos. Ele permite buscar voos por número e visualizar detalhes como horários de partida e chegada, terminais, portões e informações sobre a aeronave.

<img src="https://github.com/user-attachments/assets/685e0431-3a99-4bb4-94f3-7644816859b4" width="500"/>

## Funcionalidades

- **Buscar voos**: Digite o número do voo na barra de busca para filtrar os voos.
- **Visualização de detalhes do voo**: Informações detalhadas sobre partida, chegada, status do voo, terminal, portão, e detalhes da aeronave.

## Requisitos

- **Xcode 14 ou superior**
- **macOS 12.0 (Monterey) ou superior**
- **Swift 5.5 ou superior**

## Como Rodar o Projeto

1. **Clone o repositório**:

   ```bash
   git clone https://github.com/renataalbq/flight-monito.git


2. **Abra o projeto no Xcode**:
- Abra o arquivo `Flights.xcodeproj` no Xcode.

3. **Selecione o simulador**:
- No Xcode, selecione o simulador ou dispositivo onde deseja rodar o app.

4. **Rodar o projeto**:
- Pressione `Cmd + R` para compilar e rodar o projeto no simulador/dispositivo.

## Estrutura do Projeto
- **`ContentView.swift`**: Tela principal do aplicativo onde os voos são listados e podem ser filtrados por número de voo.
- **`FlightDetail.swift`**: Tela de detalhes do voo, onde são exibidas informações detalhadas sobre o voo selecionado.
- **`FlightDataViewModel.swift`**: ViewModel responsável por buscar os dados dos voos e controlar o estado da aplicação.
- **`Flight.swift`**: Estrutura que define o modelo de voo, incluindo número, status, informações de origem, destino e aeronave.
