import '../models/product.dart';

class ProductsData {
  static final List<Product> products = [
    // Processadores
    Product(
      id: '1',
      name: 'Intel Core i9-13900K',
      imageUrl: 'images/cpu.jpg',
      price: 2499.99,
      description:
          'O Intel Core i9-13900K é o processador topo de linha da 13ª geração, com 24 núcleos (8 Performance + 16 Efficient) e 32 threads. Ideal para gamers, criadores de conteúdo e profissionais que buscam o máximo desempenho em multitarefas, renderização e jogos AAA. Suporte a DDR5, PCIe 5.0 e overclock avançado.',
      category: 'Processadores',
      dateAdded: DateTime(2024, 1, 15),
    ),
    Product(
      id: '2',
      name: 'AMD Ryzen 9 7950X',
      imageUrl: 'images/cpu.jpg',
      price: 2299.99,
      description:
          'O AMD Ryzen 9 7950X traz 16 núcleos e 32 threads com arquitetura Zen 4, clock boost de até 5.7GHz e litografia de 5nm. Perfeito para quem exige performance extrema em aplicações profissionais, streaming, edição de vídeo e jogos de última geração.',
      category: 'Processadores',
      dateAdded: DateTime(2024, 1, 16),
    ),
    Product(
      id: '3',
      name: 'Intel Core i7-13700K',
      imageUrl: 'images/cpu.jpg',
      price: 1899.99,
      description:
          'O Intel Core i7-13700K oferece 16 núcleos (8P+8E) e 24 threads, sendo uma excelente escolha para gamers e profissionais que buscam alto desempenho com ótimo custo-benefício. Suporte a overclock, DDR5 e PCIe 5.0.',
      category: 'Processadores',
      dateAdded: DateTime(2024, 1, 17),
    ),

    // Placas de Vídeo
    Product(
      id: '4',
      name: 'NVIDIA RTX 4090',
      imageUrl: 'images/gpu.jpg',
      price: 8999.99,
      description:
          'A NVIDIA GeForce RTX 4090 é a placa de vídeo mais poderosa do mercado, com 24GB de memória GDDR6X, arquitetura Ada Lovelace e suporte a Ray Tracing e DLSS 3. Ideal para jogos em 4K, criação de conteúdo 3D e IA.',
      category: 'Placas de Vídeo',
      dateAdded: DateTime(2024, 1, 18),
    ),
    Product(
      id: '5',
      name: 'AMD Radeon RX 7900 XTX',
      imageUrl: 'images/gpu.jpg',
      price: 4999.99,
      description:
          'A AMD Radeon RX 7900 XTX conta com 24GB de GDDR6, arquitetura RDNA 3 e desempenho de sobra para jogos em 4K, aplicações profissionais e realidade virtual. Suporte a Ray Tracing, FSR 2.0 e múltiplos monitores.',
      category: 'Placas de Vídeo',
      dateAdded: DateTime(2024, 1, 19),
    ),
    Product(
      id: '6',
      name: 'NVIDIA RTX 4080',
      imageUrl: 'images/gpu.jpg',
      price: 5999.99,
      description: 'Placa de vídeo NVIDIA GeForce RTX 4080 com 16GB GDDR6X.',
      category: 'Placas de Vídeo',
      dateAdded: DateTime(2024, 1, 20),
    ),

    // Memória RAM
    Product(
      id: '7',
      name: 'Corsair Vengeance 32GB DDR5',
      imageUrl: 'images/ram.jpg',
      price: 899.99,
      description:
          'Kit de memória Corsair Vengeance 32GB (2x16GB) DDR5-5600MHz.',
      category: 'Memória RAM',
      dateAdded: DateTime(2024, 1, 21),
    ),
    Product(
      id: '8',
      name: 'G.Skill Trident Z5 64GB DDR5',
      imageUrl: 'images/ram.jpg',
      price: 1599.99,
      description:
          'Kit de memória G.Skill Trident Z5 64GB (2x32GB) DDR5-6000MHz.',
      category: 'Memória RAM',
      dateAdded: DateTime(2024, 1, 22),
    ),

    // Placas Mãe
    Product(
      id: '9',
      name: 'ASUS ROG Strix Z790-E',
      imageUrl: 'images/motherboard.webp',
      price: 1999.99,
      description:
          'Placa-mãe ASUS ROG Strix Z790-E Gaming WiFi para Intel 12ª/13ª geração.',
      category: 'Placas Mãe',
      dateAdded: DateTime(2024, 1, 23),
    ),
    Product(
      id: '10',
      name: 'MSI MPG X670E Carbon',
      imageUrl: 'images/motherboard.webp',
      price: 1899.99,
      description: 'Placa-mãe MSI MPG X670E Carbon WiFi para AMD AM5.',
      category: 'Placas Mãe',
      dateAdded: DateTime(2024, 1, 24),
    ),

    // Gabinetes
    Product(
      id: '11',
      name: 'Corsair 4000D Airflow',
      imageUrl: 'images/case.webp',
      price: 599.99,
      description:
          'Gabinete Corsair 4000D Airflow com excelente ventilação e design moderno.',
      category: 'Gabinetes',
      dateAdded: DateTime(2024, 1, 25),
    ),
    Product(
      id: '12',
      name: 'Fractal Design Define 7',
      imageUrl: 'images/case.webp',
      price: 799.99,
      description:
          'Gabinete Fractal Design Define 7 com foco em silêncio e qualidade.',
      category: 'Gabinetes',
      dateAdded: DateTime(2024, 1, 26),
    ),

    // Fontes de Alimentação
    Product(
      id: '13',
      name: 'Corsair RM850x 850W',
      imageUrl: 'images/psu.webp',
      price: 899.99,
      description: 'Fonte Corsair RM850x 850W 80 Plus Gold modular.',
      category: 'Fontes de Alimentação',
      dateAdded: DateTime(2024, 1, 27),
    ),
    Product(
      id: '14',
      name: 'Seasonic Focus GX-1000',
      imageUrl: 'images/psu.webp',
      price: 1199.99,
      description: 'Fonte Seasonic Focus GX-1000 1000W 80 Plus Gold modular.',
      category: 'Fontes de Alimentação',
      dateAdded: DateTime(2024, 1, 28),
    ),

    // Coolers
    Product(
      id: '15',
      name: 'Noctua NH-D15',
      imageUrl: 'images/cooler.webp',
      price: 499.99,
      description:
          'Cooler Noctua NH-D15 com excelente performance e baixo ruído.',
      category: 'Coolers',
      dateAdded: DateTime(2024, 1, 29),
    ),
    Product(
      id: '16',
      name: 'Corsair H150i Elite Capellix',
      imageUrl: 'images/cooler.webp',
      price: 799.99,
      description: 'Water Cooler Corsair H150i Elite Capellix 360mm RGB.',
      category: 'Coolers',
      dateAdded: DateTime(2024, 1, 30),
    ),

    // Teclados
    Product(
      id: '17',
      name: 'Corsair K95 RGB Platinum',
      imageUrl: 'images/keyboard.webp',
      price: 399.99,
      description:
          'Teclado mecânico Corsair K95 RGB Platinum com switches Cherry MX.',
      category: 'Teclados',
      dateAdded: DateTime(2024, 2, 1),
    ),
    Product(
      id: '18',
      name: 'Razer BlackWidow V4 Pro',
      imageUrl: 'images/keyboard.webp',
      price: 349.99,
      description:
          'Teclado mecânico Razer BlackWidow V4 Pro com switches Razer Green.',
      category: 'Teclados',
      dateAdded: DateTime(2024, 2, 2),
    ),

    // Mouses
    Product(
      id: '19',
      name: 'Logitech G Pro X Superlight',
      imageUrl: 'images/mouse.webp',
      price: 299.99,
      description: 'Mouse Logitech G Pro X Superlight com sensor HERO 25K.',
      category: 'Mouses',
      dateAdded: DateTime(2024, 2, 3),
    ),
    Product(
      id: '20',
      name: 'Razer DeathAdder V3 Pro',
      imageUrl: 'images/mouse.webp',
      price: 279.99,
      description:
          'Mouse Razer DeathAdder V3 Pro wireless com sensor Focus Pro 30K.',
      category: 'Mouses',
      dateAdded: DateTime(2024, 2, 4),
    ),

    // Headphones
    Product(
      id: '21',
      name: 'SteelSeries Arctis Pro Wireless',
      imageUrl: 'images/headphone.jpg',
      price: 599.99,
      description:
          'Headset SteelSeries Arctis Pro Wireless com áudio de alta qualidade.',
      category: 'Headphones',
      dateAdded: DateTime(2024, 2, 5),
    ),
    Product(
      id: '22',
      name: 'HyperX Cloud Alpha S',
      imageUrl: 'images/headphone.jpg',
      price: 199.99,
      description:
          'Headset HyperX Cloud Alpha S com drivers de 50mm e controle de graves.',
      category: 'Headphones',
      dateAdded: DateTime(2024, 2, 6),
    ),

    // Mais Processadores
    Product(
      id: '23',
      name: 'AMD Ryzen 7 7700X',
      imageUrl: 'images/cpu.jpg',
      price: 1599.99,
      description:
          'Processador AMD Ryzen 7 7700X com 8 núcleos e 16 threads. Ideal para gaming.',
      category: 'Processadores',
      dateAdded: DateTime(2024, 2, 7),
    ),
    Product(
      id: '24',
      name: 'Intel Core i5-13600K',
      imageUrl: 'images/cpu.jpg',
      price: 1299.99,
      description:
          'Processador Intel Core i5-13600K de 13ª geração com 14 núcleos e 20 threads.',
      category: 'Processadores',
      dateAdded: DateTime(2024, 2, 8),
    ),
    Product(
      id: '25',
      name: 'AMD Ryzen 5 7600X',
      imageUrl: 'images/cpu.jpg',
      price: 999.99,
      description:
          'Processador AMD Ryzen 5 7600X com 6 núcleos e 12 threads. Excelente custo-benefício.',
      category: 'Processadores',
      dateAdded: DateTime(2024, 2, 9),
    ),

    // Mais Placas de Vídeo
    Product(
      id: '26',
      name: 'NVIDIA RTX 4070',
      imageUrl: 'images/gpu.jpg',
      price: 3999.99,
      description: 'Placa de vídeo NVIDIA GeForce RTX 4070 com 12GB GDDR6X.',
      category: 'Placas de Vídeo',
      dateAdded: DateTime(2024, 2, 10),
    ),
    Product(
      id: '27',
      name: 'AMD Radeon RX 7800 XT',
      imageUrl: 'images/gpu.jpg',
      price: 2999.99,
      description: 'Placa de vídeo AMD Radeon RX 7800 XT com 16GB GDDR6.',
      category: 'Placas de Vídeo',
      dateAdded: DateTime(2024, 2, 11),
    ),
    Product(
      id: '28',
      name: 'NVIDIA RTX 4060 Ti',
      imageUrl: 'images/gpu.jpg',
      price: 2499.99,
      description: 'Placa de vídeo NVIDIA GeForce RTX 4060 Ti com 8GB GDDR6.',
      category: 'Placas de Vídeo',
      dateAdded: DateTime(2024, 2, 12),
    ),
    Product(
      id: '29',
      name: 'AMD Radeon RX 7600',
      imageUrl: 'images/gpu.jpg',
      price: 1999.99,
      description: 'Placa de vídeo AMD Radeon RX 7600 com 8GB GDDR6.',
      category: 'Placas de Vídeo',
      dateAdded: DateTime(2024, 2, 13),
    ),

    // Mais Memória RAM
    Product(
      id: '30',
      name: 'Kingston Fury Beast 16GB DDR4',
      imageUrl: 'images/ram.jpg',
      price: 399.99,
      description:
          'Kit de memória Kingston Fury Beast 16GB (2x8GB) DDR4-3200MHz.',
      category: 'Memória RAM',
      dateAdded: DateTime(2024, 2, 14),
    ),
    Product(
      id: '31',
      name: 'Crucial Ballistix 32GB DDR4',
      imageUrl: 'images/ram.jpg',
      price: 699.99,
      description:
          'Kit de memória Crucial Ballistix 32GB (2x16GB) DDR4-3600MHz.',
      category: 'Memória RAM',
      dateAdded: DateTime(2024, 2, 15),
    ),
    Product(
      id: '32',
      name: 'TeamGroup T-Force Delta 16GB DDR5',
      imageUrl: 'images/ram.jpg',
      price: 499.99,
      description:
          'Kit de memória TeamGroup T-Force Delta 16GB (2x8GB) DDR5-5600MHz RGB.',
      category: 'Memória RAM',
      dateAdded: DateTime(2024, 2, 16),
    ),

    // Mais Placas Mãe
    Product(
      id: '33',
      name: 'Gigabyte B650 Aorus Elite',
      imageUrl: 'images/motherboard.webp',
      price: 1299.99,
      description: 'Placa-mãe Gigabyte B650 Aorus Elite para AMD AM5.',
      category: 'Placas Mãe',
      dateAdded: DateTime(2024, 2, 17),
    ),
    Product(
      id: '34',
      name: 'ASRock B760M Pro RS',
      imageUrl: 'images/motherboard.webp',
      price: 899.99,
      description: 'Placa-mãe ASRock B760M Pro RS para Intel 12ª/13ª geração.',
      category: 'Placas Mãe',
      dateAdded: DateTime(2024, 2, 18),
    ),
    Product(
      id: '35',
      name: 'MSI B550 Tomahawk',
      imageUrl: 'images/motherboard.webp',
      price: 799.99,
      description: 'Placa-mãe MSI B550 Tomahawk para AMD AM4.',
      category: 'Placas Mãe',
      dateAdded: DateTime(2024, 2, 19),
    ),

    // Mais Gabinetes
    Product(
      id: '36',
      name: 'NZXT H7 Flow',
      imageUrl: 'images/case.webp',
      price: 699.99,
      description:
          'Gabinete NZXT H7 Flow com excelente ventilação e design moderno.',
      category: 'Gabinetes',
      dateAdded: DateTime(2024, 2, 20),
    ),
    Product(
      id: '37',
      name: 'Lian Li PC-O11 Dynamic',
      imageUrl: 'images/case.webp',
      price: 899.99,
      description:
          'Gabinete Lian Li PC-O11 Dynamic com design único e espaço para water cooling.',
      category: 'Gabinetes',
      dateAdded: DateTime(2024, 2, 21),
    ),
    Product(
      id: '38',
      name: 'Cooler Master MasterBox TD500',
      imageUrl: 'images/case.webp',
      price: 599.99,
      description:
          'Gabinete Cooler Master MasterBox TD500 com painel frontal em mesh.',
      category: 'Gabinetes',
      dateAdded: DateTime(2024, 2, 22),
    ),

    // Mais Fontes de Alimentação
    Product(
      id: '39',
      name: 'EVGA SuperNOVA 750 G6',
      imageUrl: 'images/psu.webp',
      price: 799.99,
      description: 'Fonte EVGA SuperNOVA 750 G6 750W 80 Plus Gold modular.',
      category: 'Fontes de Alimentação',
      dateAdded: DateTime(2024, 2, 23),
    ),
    Product(
      id: '40',
      name: 'Thermaltake Toughpower GF1 650W',
      imageUrl: 'images/psu.webp',
      price: 599.99,
      description:
          'Fonte Thermaltake Toughpower GF1 650W 80 Plus Gold modular.',
      category: 'Fontes de Alimentação',
      dateAdded: DateTime(2024, 2, 24),
    ),
    Product(
      id: '41',
      name: 'be quiet! Pure Power 11 600W',
      imageUrl: 'images/psu.webp',
      price: 499.99,
      description: 'Fonte be quiet! Pure Power 11 600W 80 Plus Gold.',
      category: 'Fontes de Alimentação',
      dateAdded: DateTime(2024, 2, 25),
    ),

    // Mais Coolers
    Product(
      id: '42',
      name: 'Cooler Master Hyper 212',
      imageUrl: 'images/cooler.webp',
      price: 199.99,
      description:
          'Cooler Cooler Master Hyper 212 com excelente custo-benefício.',
      category: 'Coolers',
      dateAdded: DateTime(2024, 2, 26),
    ),
    Product(
      id: '43',
      name: 'Arctic Freezer 34 eSports',
      imageUrl: 'images/cooler.webp',
      price: 299.99,
      description: 'Cooler Arctic Freezer 34 eSports com design colorido.',
      category: 'Coolers',
      dateAdded: DateTime(2024, 2, 27),
    ),
    Product(
      id: '44',
      name: 'NZXT Kraken X63',
      imageUrl: 'images/cooler.webp',
      price: 599.99,
      description: 'Water Cooler NZXT Kraken X63 280mm RGB.',
      category: 'Coolers',
      dateAdded: DateTime(2024, 2, 28),
    ),

    // Mais Teclados
    Product(
      id: '45',
      name: 'Logitech G915 TKL',
      imageUrl: 'images/keyboard.webp',
      price: 499.99,
      description:
          'Teclado mecânico Logitech G915 TKL wireless com switches GL.',
      category: 'Teclados',
      dateAdded: DateTime(2024, 3, 1),
    ),
    Product(
      id: '46',
      name: 'SteelSeries Apex Pro',
      imageUrl: 'images/keyboard.webp',
      price: 449.99,
      description:
          'Teclado mecânico SteelSeries Apex Pro com switches ajustáveis.',
      category: 'Teclados',
      dateAdded: DateTime(2024, 3, 2),
    ),
    Product(
      id: '47',
      name: 'HyperX Alloy Origins Core',
      imageUrl: 'images/keyboard.webp',
      price: 249.99,
      description:
          'Teclado mecânico HyperX Alloy Origins Core com switches HyperX Red.',
      category: 'Teclados',
      dateAdded: DateTime(2024, 3, 3),
    ),

    // Mais Mouses
    Product(
      id: '48',
      name: 'SteelSeries Rival 650',
      imageUrl: 'images/mouse.webp',
      price: 199.99,
      description:
          'Mouse SteelSeries Rival 650 wireless com sensor TrueMove3+.',
      category: 'Mouses',
      dateAdded: DateTime(2024, 3, 4),
    ),
    Product(
      id: '49',
      name: 'Corsair Dark Core RGB Pro',
      imageUrl: 'images/mouse.webp',
      price: 179.99,
      description:
          'Mouse Corsair Dark Core RGB Pro wireless com sensor PAW3392.',
      category: 'Mouses',
      dateAdded: DateTime(2024, 3, 5),
    ),
    Product(
      id: '50',
      name: 'ASUS ROG Gladius III',
      imageUrl: 'images/mouse.webp',
      price: 159.99,
      description:
          'Mouse ASUS ROG Gladius III com sensor PAW3370 e switches hot-swappable.',
      category: 'Mouses',
      dateAdded: DateTime(2024, 3, 6),
    ),

    // Mais Headphones
    Product(
      id: '51',
      name: 'Corsair Virtuoso RGB Wireless',
      imageUrl: 'images/headphone.jpg',
      price: 399.99,
      description:
          'Headset Corsair Virtuoso RGB Wireless com áudio de alta fidelidade.',
      category: 'Headphones',
      dateAdded: DateTime(2024, 3, 7),
    ),
    Product(
      id: '52',
      name: 'Razer BlackShark V2 Pro',
      imageUrl: 'images/headphone.jpg',
      price: 349.99,
      description:
          'Headset Razer BlackShark V2 Pro wireless com drivers de 50mm.',
      category: 'Headphones',
      dateAdded: DateTime(2024, 3, 8),
    ),
    Product(
      id: '53',
      name: 'Audio-Technica ATH-G1',
      imageUrl: 'images/headphone.jpg',
      price: 299.99,
      description:
          'Headset Audio-Technica ATH-G1 com drivers de 45mm e cabo removível.',
      category: 'Headphones',
      dateAdded: DateTime(2024, 3, 9),
    ),
  ];

  static List<String> get categories {
    return products.map((product) => product.category).toSet().toList();
  }

  static List<Product> getProductsByCategory(String category) {
    return products.where((product) => product.category == category).toList();
  }

  static List<Product> getFeaturedProducts() {
    return products.take(5).toList();
  }

  static List<Product> getSimilarProducts(List<String> favoriteCategories) {
    if (favoriteCategories.isEmpty) {
      return getFeaturedProducts();
    }

    return products
        .where((product) => favoriteCategories.contains(product.category))
        .take(6)
        .toList();
  }
}
