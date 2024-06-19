class CardModel {
  final String title;
  final String imagePath;
  bool isSelected;

  CardModel(this.title, this.imagePath, {this.isSelected = false});
}
