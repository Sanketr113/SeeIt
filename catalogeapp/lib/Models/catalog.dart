class CatalogModel {
  static List<Items> items = [
    Items(
      id: "Sanket001",
      name: "ROG Zephyrus Dou 16",
      desc:
          "GeForce RTX™ 3060 Windows 11 Home AMD Ryzen™ 7 6800H 40.64cm(16), FHD+ 16:10 (1920 x 1200, WUXGA), Refresh Rate:165Hz Additional Display: 14 1920 x 550 IPS-level Panel 2TB M.2 NVMe™ PCIe® 4.0 SSD Supports slots up to max of: 4TB M.2 NVMe™ PCIe® 4.0 SSD",
      price: "249990",
      color: "Black0",
      images: "https://m.media-amazon.com/images/I/71JFMDI0tOL._SL1500_.jpg",
      details:
          "https://rog.asus.com/in/laptops/rog-zephyrus/rog-zephyrus-duo-16-2022-series/",
    ),
  ];
}

class Items {
  final String id;
  final String name;
  final String desc;
  final String price;
  final String color;
  final String images;
  final String details;

  Items({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.images,
    required this.details,
  });

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      images: map["images"],
      details: map["details"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "images": images,
        "details": details,
      };
}
