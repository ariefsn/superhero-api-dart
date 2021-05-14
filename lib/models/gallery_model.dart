class GalleryModel {
  final String sm, md, lg;

  GalleryModel({
    this.sm, this.md, this.lg
  });

  GalleryModel.fromJson(Map<String, dynamic> json)
    : sm = json["sm"],
      md = json["md"],
      lg = json["lg"];

  Map<String, dynamic> toJson() => {
    "sm": sm,
    "md": md,
    "lg": lg,
  };
}
