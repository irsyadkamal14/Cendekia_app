class Tb_belajar {
  // final String name;
  final String image;
  // final String text;
  final String id;

  const Tb_belajar({
    required this.image,
    required this.id,
    // required this.text,
    // required this.name
  });

  factory Tb_belajar.fromJson(Map<String, dynamic> json) {
    return Tb_belajar(
      image: json['image'],
//      name: json['name'],
      id: json['id'],
//      text: json['text'],
    );
  }
}
