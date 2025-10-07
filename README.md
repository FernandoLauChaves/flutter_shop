# Flutter Store

Uma aplicação móvel Flutter que simula uma loja virtual especializada em componentes de computador. O app oferece uma experiência completa de compras com funcionalidades de cadastro, login, visualização de produtos, favoritos e muito mais.

## 📱 Funcionalidades

### Autenticação
- **Cadastro de usuário**: Nome, e-mail, senha e confirmação de senha
- **Login**: E-mail e senha com validações
- **Validações**: E-mail válido, senhas iguais, campos obrigatórios
- **Feedback**: Pop-ups informativos para erros de login

### Navegação
- **Drawer lateral**: Acesso rápido a todas as seções
- **AppBar**: Nome do app estilizado em todas as telas
- **Navegação fluida**: Entre todas as telas do aplicativo

### Produtos
- **Catálogo completo**: 53+ produtos de diferentes categorias
- **Categorias**: Processadores, Placas de Vídeo, Memória RAM, Placas Mãe, Gabinetes, Fontes, Coolers, Teclados, Mouses, Headphones
- **Filtros integrados**: Por categoria, nome (A-Z, Z-A), preço (menor/maior)
- **Grid responsivo**: Visualização em grade adaptável com LayoutBuilder
- **Imagens locais**: Todas as imagens carregam da pasta assets/images/

### Favoritos
- **Sistema de favoritos**: Adicionar/remover produtos
- **Lista personalizada**: Visualizar produtos favoritados
- **Filtros especiais**: Incluindo ordenação por data de adição
- **Sincronização**: Atualização automática da lista

### Interface
- **Tema minimalista**: Verde escuro e preto
- **Design moderno**: Bordas arredondadas, sombras, gradientes
- **Responsivo**: Adaptável a diferentes tamanhos de tela
- **Componentes reutilizáveis**: Código limpo e organizado

## 🏗️ Arquitetura

### Estrutura de Pastas
```
lib/
├── components/          # Componentes reutilizáveis
│   ├── custom_button.dart
│   ├── custom_text_field.dart
│   ├── product_card.dart
│   ├── custom_drawer.dart
│   ├── filter_bar.dart
│   └── user_info_dialog.dart
├── data/               # Dados estáticos
│   └── products_data.dart
├── models/             # Modelos de dados
│   ├── product.dart
│   └── user.dart
├── screens/            # Telas da aplicação
│   ├── login_screen.dart
│   ├── register_screen.dart
│   ├── home_screen.dart
│   ├── products_screen.dart
│   ├── product_detail_screen.dart
│   ├── favorites_screen.dart
│   └── about_screen.dart
├── services/           # Serviços e lógica de negócio
│   ├── auth_service.dart
│   └── favorites_service.dart
├── theme/              # Tema da aplicação
│   └── app_theme.dart
└── main.dart           # Arquivo principal
```

### Componentes Principais

#### CustomButton
- Botão personalizado com loading state
- Cores e estilos consistentes
- Suporte a diferentes tamanhos

#### CustomTextField
- Campo de texto com validação
- Ícones prefix/suffix
- Estilo consistente com o tema

#### ProductCard
- Card de produto com imagem, nome, preço
- Botão de favoritar integrado
- Navegação para detalhes

#### CustomDrawer
- Menu lateral com navegação
- Informações do usuário
- Logout integrado
- Prevenção de redirecionamento para mesma página

#### FilterBar
- Barra de filtros integrada
- Filtros por categoria e ordenação
- Modal responsivo com scroll
- Área clicável completa

## 🎨 Design System

### Cores
- **Primária**: Verde escuro (#2E7D32)
- **Secundária**: Verde médio (#4CAF50)
- **Fundo**: Preto (#121212)
- **Superfície**: Cinza escuro (#1E1E1E)
- **Cards**: Cinza médio (#2C2C2C)

### Tipografia
- **Títulos**: FontWeight.bold
- **Corpo**: FontWeight.normal
- **Destaque**: Cor primária

### Componentes
- **Bordas**: BorderRadius.circular(12-16)
- **Sombras**: Elevation 2-4
- **Espaçamentos**: Múltiplos de 8

## 📦 Dependências

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  carousel_slider: ^5.0.0
  shared_preferences: ^2.2.2
```

### Dependências Externas
- **carousel_slider**: Para o carrossel de produtos em destaque
- **shared_preferences**: Para persistência de dados do usuário

## 🚀 Como Executar

### Pré-requisitos
- Flutter SDK (versão 3.9.0 ou superior)
- Dart SDK
- Android Studio / VS Code
- Emulador Android ou dispositivo físico

### Passos para Execução

1. **Clone o repositório**
   ```bash
   git clone <url-do-repositorio>
   cd flutter_store
   ```

2. **Instale as dependências**
   ```bash
   flutter pub get
   ```

3. **Verifique se as imagens estão na pasta correta**
   ```
   images/
   ├── cpu.jpg
   ├── gpu.jpg
   ├── ram.jpg
   ├── motherboard.webp
   ├── case.webp
   ├── psu.webp
   ├── cooler.webp
   ├── keyboard.webp
   ├── mouse.webp
   └── headphone.jpg
   ```

4. **Execute o aplicativo**
   ```bash
   flutter run
   ```

### Comandos Úteis
```bash
# Limpar cache
flutter clean

# Atualizar dependências
flutter pub upgrade

# Verificar problemas
flutter analyze

# Executar testes
flutter test
```

## 📱 Telas Implementadas

### 1. Tela de Cadastro
- ✅ Campos: Nome, e-mail, senha, confirmação
- ✅ Validações: E-mail válido, senhas iguais
- ✅ Feedback visual para erros
- ✅ Redirecionamento para login após cadastro

### 2. Tela de Login
- ✅ Campos: E-mail e senha
- ✅ Validações: E-mail válido, campos obrigatórios
- ✅ Pop-ups para erros específicos
- ✅ Botão "Registre-se" para cadastro

### 3. Tela Inicial (Home)
- ✅ Carrossel de produtos em destaque (5 produtos)
- ✅ Produtos similares baseados em favoritos
- ✅ Ícone de usuário com informações
- ✅ Navegação para outras telas
- ✅ Imagens locais no carrossel

### 4. Tela de Produtos
- ✅ GridView responsivo com LayoutBuilder
- ✅ Filtros integrados (FilterBar)
- ✅ Ordenação por nome e preço
- ✅ Navegação para detalhes
- ✅ 53 produtos com imagens locais

### 5. Tela de Detalhes
- ✅ Informações completas do produto
- ✅ Botão de favoritar flutuante
- ✅ Navegação de volta
- ✅ Feedback visual para ações
- ✅ Imagens locais em alta qualidade

### 6. Tela de Favoritos
- ✅ Lista de produtos favoritados
- ✅ Filtros integrados (mesmo padrão da tela de produtos)
- ✅ Ordenação por data de adição
- ✅ Atualização automática
- ✅ Grid responsivo

### 7. Tela de Sobre
- ✅ Descrição do aplicativo
- ✅ Informações sobre o mercado
- ✅ Saudação da equipe
- ✅ Informações técnicas

## 🔧 Funcionalidades Técnicas

### Persistência de Dados
- **SharedPreferences**: Armazenamento local de usuários e favoritos
- **Modelos JSON**: Serialização/deserialização de dados
- **Estado persistente**: Login mantido entre sessões

### Gerenciamento de Estado
- **StatefulWidget**: Gerenciamento local de estado
- **setState()**: Atualizações de interface
- **Future/async**: Operações assíncronas

### Navegação
- **MaterialPageRoute**: Navegação entre telas
- **Navigator.push/pop**: Controle de stack
- **Drawer**: Menu lateral global

## 🎯 Observações e Limitações

### Observações
- ✅ **Responsivo**: Adaptável a diferentes tamanhos de tela
- ✅ **Componentizado**: Código reutilizável e organizado
- ✅ **Tema consistente**: Design system aplicado
- ✅ **Validações**: Feedback adequado para o usuário
- ✅ **Performance**: Imagens locais carregam instantaneamente
- ✅ **Menu inteligente**: Não redireciona para a mesma página
- ✅ **Filtros otimizados**: Interface responsiva e intuitiva

### Limitações
- ⚠️ **Dados**: Produtos são estáticos (não há API real)
- ⚠️ **Offline**: Funciona offline, mas sem sincronização
- ⚠️ **Escalabilidade**: Dados em memória (não adequado para produção)
- ⚠️ **Imagens**: Limitadas às 10 imagens por categoria

### Melhorias Futuras
- 🔄 **API Integration**: Conectar com backend real
- 🔄 **Cache de Imagens**: Implementar cache local
- 🔄 **Notificações**: Push notifications para ofertas
- 🔄 **Carrinho**: Sistema de carrinho de compras
- 🔄 **Pagamento**: Integração com gateways de pagamento

## 👥 Equipe de Desenvolvimento

Este projeto foi desenvolvido como uma demonstração das capacidades do Flutter para criação de aplicações móveis modernas e funcionais.

---

**Desenvolvido com ❤️ usando Flutter**

Para mais informações sobre o Flutter, visite: [flutter.dev](https://flutter.dev)