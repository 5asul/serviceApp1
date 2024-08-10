class ServiceModel {
  final String name;
  final String imagePath;
  final String description;

  ServiceModel(
      {required this.name, required this.imagePath, required this.description});
}

List<ServiceModel> servicesItem = [
  ServiceModel(
      name: 'كهرباء',
      imagePath: 'assets/Electrical.jpg',
      description: 'خدمات كهربائية منزلية وتجارية'),
  ServiceModel(
      name: 'سباكة',
      imagePath: 'assets/Plumbing.jpeg',
      description: 'خدمات سباكة منزلية وتجارية'),
  // ... المزيد من العناصر
];
