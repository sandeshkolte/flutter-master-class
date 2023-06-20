class Items {
  final String id, name, desc, color, image;
  final num price;

  Items({required this.id, required this.name,required this.desc,required this.color,required this.image,required this.price});
}

final products = [
  Items(
      id: "Sandesh01",
      name: "IPhone 12 Pro",
      desc: "Apple IPhone 12th generation",
      price: 999,
      color: "#33505a",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc")
];
