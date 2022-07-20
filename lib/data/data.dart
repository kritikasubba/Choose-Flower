

enum FlowerType{ desert, land }

class Flower{
  final String imageUrl;
  final FlowerType type;

  Flower({
    required this.imageUrl,
    required this.type
  });

}

final allflowers = [
  Flower(imageUrl: 'assets/flower1.jpg', type: FlowerType.land),
  Flower(imageUrl: 'assets/flower2.jpg', type: FlowerType.land),
  Flower(imageUrl: 'assets/cactus.jpg', type: FlowerType.desert),
  Flower(imageUrl: 'assets/catus2.jpg', type: FlowerType.desert)


];