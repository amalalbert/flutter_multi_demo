class ProductResponse {
  final List<Product> products;

  ProductResponse({required this.products});

  factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
      );
}

class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final String thumbnail;
  final List<String> images;
  final List<Review> reviews;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.thumbnail,
    required this.images,
    required this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        price: json["price"].toDouble(),
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
        reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
      );
}

class Review {
  final int rating;
  final String comment;
  final String reviewerName;

  Review({required this.rating, required this.comment, required this.reviewerName});

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json["rating"],
        comment: json["comment"],
        reviewerName: json["reviewerName"],
      );
}