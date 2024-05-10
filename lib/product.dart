class Product {
  final String name;
  final int price;
  final int count;
  final int id;
  final String? title;

  Product({
    required this.name,
    required this.price,
    required this.id,
    this.count = 0,
    this.title,
  });
}

final productList = <Product>[
  Product(
    name: 'Говяжий жиз',
    price: 4000,
    id: 0,
  ),
  Product(
    name: 'Куриные котлеты',
    price: 3500,
    id: 1,
  ),
  Product(
    name: 'Шашлык',
    price: 4500,
    id: 2,
  ),
  Product(
    name: 'Плов',
    price: 3000,
    id: 3,
  ),
  Product(
    name: 'Табака',
    price: 3000,
    id: 4,
  ),
  Product(
    name: 'Гриль',
    price: 3000,
    id: 5,
  ),
  Product(
    name: 'Суп',
    price: 2500,
    id: 6,
  ),
  Product(
    name: 'Оливье',
    price: 1000,
    id: 7,
  ),
  Product(
    name: 'Coca-Cola',
    price: 800,
    id: 8,
  ),
  Product(
    name: 'Фанта',
    price: 800,
    id: 9,
  ),
  Product(
    name: 'Сок',
    price: 800,
    id: 10,
  ),
  Product(
    name: 'Кофе',
    price: 500,
    id: 11,
  ),
  Product(
    name: 'Pepsi',
    price: 400,
    id: 12,
  ),
];
