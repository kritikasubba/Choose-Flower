

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
  Flower(imageUrl: 'assets/rose.png', type: FlowerType.land),
  Flower(imageUrl: 'assets/daisy.png', type: FlowerType.land),
  Flower(imageUrl: 'assets/cactus2.png', type: FlowerType.desert),
  Flower(imageUrl: 'assets/cactus3.png', type: FlowerType.desert)


];