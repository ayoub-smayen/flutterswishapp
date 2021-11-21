class Photo {
  final int price;
  final int id;
  final String title;
  final String description;
  final String slug;
  final String photo;
  final String size;
  final String brand;
  bool isliked;
  bool isSelected;

  Photo(
      {this.price,
      this.id,
      this.title,
      this.slug,
      this.photo,
      this.brand,
      this.size,
      this.description,
      this.isSelected = false,
      this.isliked = false});
}
