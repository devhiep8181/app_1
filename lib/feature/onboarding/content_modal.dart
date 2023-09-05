import '../../assets.dart';

class unboardingContent {
  String image;
  String title;
  String discription;

  unboardingContent({
    required this.image,
    required this.title,
    required this.discription,
  });
}

List<unboardingContent> content = [
  unboardingContent(
      image: Assets.assets_image_i1_png,
      title: "Learn anytime\n"
          "and anywhere",
      discription:
          "Quarantine is the perfect time to spend your day learning something new, from anywhere!"),
  unboardingContent(
      image: Assets.assets_image_i2_png,
      title: "Find a course\n"
          "for you",
      discription:
          "Quarantine is the perfect time to spend your day learning something new, from anywhere!"),
  unboardingContent(
      image: Assets.assets_image_i3_png,
      title: "\nImprove your skills",
      discription:
          "Quarantine is the perfect time to spend your day learning something new, from anywhere!"),
];
