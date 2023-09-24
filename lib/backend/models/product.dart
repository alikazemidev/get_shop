class Product {
	int? id;
	String? title;
	String? image;
	String? price;
	String? realPrice;
	int? discountPercent;

	Product({
		this.id, 
		this.title, 
		this.image, 
		this.price, 
		this.realPrice, 
		this.discountPercent, 
	});

	factory Product.fromJson(Map<String, dynamic> json) {
		return Product(
			id: json['id'] as int?,
			title: json['title'] as String?,
			image: json['image'] as String?,
			price: json['price'] as String?,
			realPrice: json['real_price'] as String?,
			discountPercent: json['discount_percent'] as int?,
		);
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
