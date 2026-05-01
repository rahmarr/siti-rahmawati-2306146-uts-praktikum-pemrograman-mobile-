class Quest {
  String title;
  String rank;
  String reward;
  String desc;
  String image;
  bool isTaken;

  Quest({
    required this.title,
    required this.rank,
    required this.reward,
    required this.desc,
    required this.image,
    this.isTaken = false,
  });
}