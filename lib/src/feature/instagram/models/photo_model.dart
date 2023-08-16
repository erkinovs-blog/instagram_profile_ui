import 'user_model.dart';

class PhotoModel {
  String? id;
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? description;
  String? altDescription;
  List<Breadcrumbs>? breadcrumbs;
  Urls? urls;
  PhotoLinks? links;
  int? likes;
  bool? likedByUser;
  List<String>? currentUserCollections;
  Sponsorship? sponsorship;
  String? topicSubmissions;
  UserModel? user;

  PhotoModel({
    this.id,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.breadcrumbs,
    this.urls,
    this.links,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.topicSubmissions,
    this.user,
  });

  factory PhotoModel.fromJson(Map<String, Object?> json) => PhotoModel(
        id: json["id"] as String?,
        slug: json["slug"] as String?,
        createdAt: json["created_at"] != null
            ? DateTime.tryParse(json["created_at"] as String)
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.tryParse(json["updated_at"] as String)
            : null,
        promotedAt: json["promoted_at"] != null
            ? DateTime.tryParse(json["promoted_at"] as String)
            : null,
        width: json["width"] as int?,
        height: json["height"] as int?,
        color: json["color"] as String?,
        blurHash: json["blur_hash"] as String?,
        description: json["description"] as String?,
        altDescription: json["alt_description"] as String?,
        breadcrumbs: json["breadcrumbs"] != null
            ? List<Map<String, Object?>>.from(
                json["breadcrumbs"] as List,
              ).map(Breadcrumbs.fromJson).toList()
            : null,
        urls: json["urls"] != null
            ? Urls.fromJson(json["urls"] as Map<String, Object?>)
            : null,
        links: json["links"] != null
            ? PhotoLinks.fromJson(json["links"] as Map<String, Object?>)
            : null,
        likes: json["likes"] as int?,
        likedByUser: json["liked_by_user"] as bool?,
        currentUserCollections:
            List<String>.from(json["current_user_collections"] as List),
        sponsorship: json["sponsorship"] != null
            ? Sponsorship.fromJson(json["sponsorship"] as Map<String, Object?>)
            : null,
        user: json["user"] != null
            ? UserModel.fromJson(json["user"] as Map<String, Object?>)
            : null,
      );
}

class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;
  String? smallS3;

  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
    this.smallS3,
  });

  factory Urls.fromJson(Map<String, Object?> json) => Urls(
        raw: json["raw"] as String?,
        full: json["full"] as String?,
        regular: json["regular"] as String?,
        small: json["small"] as String?,
        thumb: json["thumb"] as String?,
        smallS3: json["small_s3"] as String?,
      );
}

class PhotoLinks {
  String? self;
  String? html;
  String? download;
  String? downloadLocation;

  PhotoLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  factory PhotoLinks.fromJson(Map<String, Object?> json) => PhotoLinks(
        self: json["self"] as String?,
        html: json["html"] as String?,
        download: json["download"] as String?,
        downloadLocation: json["download_location"] as String?,
      );
}

class Sponsorship {
  List<String>? impressionUrls;
  String? tagline;
  String? taglineUrl;
  UserModel? sponsor;

  Sponsorship({
    this.impressionUrls,
    this.tagline,
    this.taglineUrl,
    this.sponsor,
  });

  factory Sponsorship.fromJson(Map<String, Object?> json) => Sponsorship(
        impressionUrls: List<String>.from(json["impression_urls"] as List),
        tagline: json["tagline"] as String?,
        taglineUrl: json["tagline_url"] as String?,
        sponsor: json["sponsor"] != null
            ? UserModel.fromJson(json["sponsor"] as Map<String, Object?>)
            : null,
      );
}

class Breadcrumbs {
  String? slug;
  String? title;
  int? index;
  String? type;

  Breadcrumbs({
    this.slug,
    this.title,
    this.index,
    this.type,
  });

  factory Breadcrumbs.fromJson(Map<String, Object?> json) => Breadcrumbs(
        slug: json["slug"] as String?,
        title: json["title"] as String?,
        index: json["index"] as int?,
        type: json["type"] as String?,
      );
}
