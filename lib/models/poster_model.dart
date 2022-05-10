class PosterModel {
  int id;
  String name;
  int stars;
  String rank;
  String profile_img;

  PosterModel({
    required this.id,
    required this.name,
    required this.stars,
    required this.rank,
    required this.profile_img,
  });
  factory PosterModel.createPoster(Map poster) {
    return PosterModel(
      id: poster["id"],
      name: poster["name"],
      stars: poster["stars"],
      rank: poster["rank"],
      profile_img: poster["profile_img"],
    );
  }
}
