class ProductData{
  final String name;
  final String detail;
  final String image;
  final int price;
  ProductData({
    required this.name,
    required this.detail,
    required this.price,
    required this.image,
  });
  factory ProductData.fromjson(Map<String,dynamic>jason){
    return ProductData(
      name:jason['title'] ,
      detail: jason['description'],
      price: jason['price'],
image: jason['thumbnail']
    );
  }
}