class Product {
  int? id;
  String? title;
  String? image;
  String? price;
  String? realPrice;
  int? discountPercent;
  String? desc;
  String? category;
  List<String>? gallery;
  int? reviewsCount;
  bool? bookmarked;
  int? cartCount;
  int? count;

  Product({
    this.count,
    this.cartCount,
    this.bookmarked,
    this.reviewsCount,
    this.id,
    this.title,
    this.image,
    this.price,
    this.realPrice,
    this.discountPercent,
    this.desc,
    this.category,
    this.gallery,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    title = json['title'] as String?;
    count = json['count'];
    image = json['image'] as String?;
    price = json['price'] as String?;
    realPrice = json['real_price'] as String?;
    discountPercent = json['discount_percent'] as int?;
    desc = json['description'];
    category = json['category'];
    bookmarked = json['bookmarked'];
    cartCount = json['cart_count'];
    if (json['gallery'] != null) {
      gallery = json["gallery"].cast<String>();
    }
    reviewsCount = json["reviews_count"];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'price': price,
        'real_price': realPrice,
        'discount_percent': discountPercent,
      };
}
