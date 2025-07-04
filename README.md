# 🍅 Pomodoro.commit()

<div align="center">

![Pomodoro Timer](projetodia4do7/image/pomodoro.png)

### _"Menos merge conflict na sua mente"_

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)](https://firebase.google.com/)

_Transforme sua produtividade em commits de sucesso_

---

</div>

## 💡 **Descrição do App**

O **Pomodoro.commit()** é mais que um simples timer de produtividade - é seu companheiro de desenvolvimento pessoal! Inspirado na metodologia Pomodoro e na cultura de versionamento Git, este aplicativo revoluciona a forma como você gerencia seu tempo e produtividade.

### 🎯 **Filosofia do Projeto**

Assim como no Git, onde cada commit representa uma unidade de trabalho concluída, o Pomodoro.commit() trata cada sessão de 25 minutos como um "commit de produtividade". Você não apenas trabalha - você versiona seu progresso!

### 🌟 **Por que escolher o Pomodoro.commit()?**

- **🧠 Mente Organizada**: Elimine o "merge conflict" mental com sessões estruturadas
- **⏰ Timing Perfeito**: 25 minutos de foco + 5 minutos de pausa
- **💻 Para Desenvolvedores**: Interface temática cyber com cores que remetem ao código
- **☁️ Conectado**: Integração com Firebase para ideias inspiradoras
- **📱 Multiplataforma**: Funciona em Android, iOS, Web e Desktop

---

## ⚡ **Funcionalidades Implementadas**

### 🎨 **Interface e Experiência**

- **Splash Screen Personalizada**: Tela de carregamento com tema cyber e mensagem motivacional
- **Design Cyber-Tech**: Paleta de cores inspirada em editores de código
  - 🌊 Cyber Teal (`#00F6FF`) - Elementos interativos
  - 🌌 Deep Space (`#011D3A`) - Background principal
  - 💬 Code Comment (`#D0E1FF`) - Textos secundários
- **Navegação Intuitiva**: Fluxo limpo entre telas com animações suaves

### ⏱️ **Sistema de Timer**

- **Timer Pomodoro Clássico**: 25 minutos de trabalho focado
- **Cronômetro Visual**: Display grande e legível mostrando tempo restante
- **Controle de Sessão**: Botão para iniciar/pausar sessões
- **Feedback Visual**: Indicação clara quando o tempo acabar ("Hora do Café!")

### 🔥 **Integração Firebase**

- **Banco de Ideias**: Conexão com Firestore para buscar ideias inspiradoras
- **Sistema Rotativo**: Diferentes ideias a cada sessão para manter a criatividade
- **Tratamento de Erros**: Mensagens claras em caso de problemas de conexão

### 👤 **Sistema de Perfil**

- **Página de Perfil**: Acesso através do ícone de usuário
- **Histórico Futuro**: Base preparada para implementar histórico de sessões
- **Navegação Consistente**: Acesso fácil de qualquer tela

### 📱 **Recursos Técnicos**

- **Multi-plataforma**: Suporte completo para Android, iOS, Web e Desktop
- **Gerenciamento de Estado**: Estado reativo para atualizações em tempo real
- **Arquitetura Limpa**: Código organizado e bem estruturado
- **Performance Otimizada**: Timer eficiente sem vazamentos de memória

---

## 🚀 **Instruções de Instalação e Execução**

### 📋 **Pré-requisitos**

Antes de começar, certifique-se de ter as seguintes ferramentas instaladas:

```bash
📌 Flutter SDK (versão 3.8.0 ou superior)
📌 Dart SDK (incluído com Flutter)
📌 Android Studio ou VS Code
📌 Git
```

### 🛠️ **Configuração do Ambiente**

#### **1. Verificar Instalação do Flutter**

```powershell
flutter doctor
```

_Este comando verificará se tudo está configurado corretamente_

#### **2. Clonar o Repositório**

```powershell
git clone https://github.com/seu-usuario/PomodoroCommit.git
cd PomodoroCommit/projetodia4do7
```

#### **3. Instalar Dependências**

```powershell
flutter pub get
```

### 🔥 **Firebase Setup (Importante!)**

#### **1. Configurar Projeto Firebase**

1. Acesse [Firebase Console](https://console.firebase.google.com/)
2. Crie um novo projeto ou use um existente
3. Adicione um app Flutter ao projeto
4. Baixe o arquivo `google-services.json` (Android) e `GoogleService-Info.plist` (iOS)

#### **2. Configurar Firestore**

```javascript
// Estrutura da coleção "Ideias" no Firestore
{
  "0": { "ideia": "Que tal implementar um algoritmo de ordenação?" },
  "1": { "ideia": "Hora de refatorar aquele código antigo!" },
  "2": { "ideia": "Que tal estudar um novo framework hoje?" },
  "3": { "ideia": "Bora documentar melhor o seu projeto!" },
  "4": { "ideia": "Tempo de otimizar a performance!" }
}
```

#### **3. Arquivos de Configuração**

Certifique-se de que os seguintes arquivos estão presentes:

- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`
- `lib/firebase_options.dart` (gerado automaticamente)

### 📱 **Executando o Aplicativo**

#### **Para Android:**

```powershell
# Conecte seu dispositivo Android ou inicie um emulador
flutter run
```

#### **Para iOS:**

```powershell
# Certifique-se de estar em um Mac com Xcode instalado
flutter run
```

#### **Para Web:**

```powershell
flutter run -d chrome
```

#### **Para Desktop (Windows):**

```powershell
flutter run -d windows
```

### 🔧 **Build para Produção**

#### **Android (APK):**

```powershell
flutter build apk --release
```

#### **Android (Bundle):**

```powershell
flutter build appbundle --release
```

#### **iOS:**

```powershell
flutter build ios --release
```

#### **Web:**

```powershell
flutter build web --release
```

### ⚠️ **Solução de Problemas Comuns**

#### **Erro de Dependências:**

```powershell
flutter clean
flutter pub get
```

#### **Problema com Firebase:**

```powershell
# Reinstale o CLI do Firebase
npm install -g firebase-tools
flutterfire configure
```

#### **Erro de Build Android:**

```powershell
cd android
./gradlew clean
cd ..
flutter build apk
```

### 📊 **Verificação de Performance**

```powershell
# Análise de performance
flutter analyze

# Teste de widgets
flutter test
```

---

<div align="center">

## 🎯 **Ready to Commit?**

_Inicie sua jornada de produtividade agora!_

### 🔗 **Links Úteis**

[📖 Documentação Flutter](https://docs.flutter.dev/) | [🔥 Firebase Docs](https://firebase.google.com/docs) | [📊 Método Pomodoro](https://francescocirillo.com/pages/pomodoro-technique)

---

**Desenvolvido com** ❤️ **e muito** ☕

_"Cada sessão de trabalho é um commit para o seu sucesso!"_

</div>
