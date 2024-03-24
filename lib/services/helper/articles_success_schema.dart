//
//  articles_success_schema.dart
//  Created on 2024 21 March.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

class ArticlesSuccessSchema {
  ArticlesSuccessSchema({
    required this.id,
    required this.date,
    required this.dateGmt,
    required this.guid,
    required this.modified,
    required this.modifiedGmt,
    required this.slug,
    required this.status,
    required this.type,
    required this.link,
    required this.title,
    required this.content,
    required this.excerpt,
    required this.author,
    required this.featuredMedia,
    required this.commentStatus,
    required this.pingStatus,
    required this.sticky,
    required this.template,
    required this.format,
    required this.meta,
    required this.categories,
    required this.tags,
    required this.acf,
    required this.yoastHead,
    required this.yoastHeadJson,
    required this.links,
  });

  final int? id;
  final DateTime? date;
  final DateTime? dateGmt;
  final Guid? guid;
  final DateTime? modified;
  final DateTime? modifiedGmt;
  final String? slug;
  final String? status;
  final String? type;
  final String? link;
  final Guid? title;
  final Content? content;
  final Content? excerpt;
  final int? author;
  final int? featuredMedia;
  final String? commentStatus;
  final String? pingStatus;
  final bool? sticky;
  final String? template;
  final String? format;
  final Meta? meta;
  final List<int> categories;
  final List<int> tags;
  final List<dynamic> acf;
  final String? yoastHead;
  final YoastHeadJson? yoastHeadJson;
  final Links? links;

  factory ArticlesSuccessSchema.fromJson(Map<String, dynamic> json) {
    return ArticlesSuccessSchema(
      id: json["id"],
      date: DateTime.tryParse(json["date"] ?? ""),
      dateGmt: DateTime.tryParse(json["date_gmt"] ?? ""),
      guid: json["guid"] == null ? null : Guid.fromJson(json["guid"]),
      modified: DateTime.tryParse(json["modified"] ?? ""),
      modifiedGmt: DateTime.tryParse(json["modified_gmt"] ?? ""),
      slug: json["slug"],
      status: json["status"],
      type: json["type"],
      link: json["link"],
      title: json["title"] == null ? null : Guid.fromJson(json["title"]),
      content:
          json["content"] == null ? null : Content.fromJson(json["content"]),
      excerpt:
          json["excerpt"] == null ? null : Content.fromJson(json["excerpt"]),
      author: json["author"],
      featuredMedia: json["featured_media"],
      commentStatus: json["comment_status"],
      pingStatus: json["ping_status"],
      sticky: json["sticky"],
      template: json["template"],
      format: json["format"],
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      categories: json["categories"] == null
          ? []
          : List<int>.from(json["categories"]!.map((x) => x)),
      tags: json["tags"] == null
          ? []
          : List<int>.from(json["tags"]!.map((x) => x)),
      acf: json["acf"] == null
          ? []
          : List<dynamic>.from(json["acf"]!.map((x) => x)),
      yoastHead: json["yoast_head"],
      yoastHeadJson: json["yoast_head_json"] == null
          ? null
          : YoastHeadJson.fromJson(json["yoast_head_json"]),
      links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
    );
  }
}

class Content {
  Content({
    required this.rendered,
    required this.protected,
  });

  final String? rendered;
  final bool? protected;

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      rendered: json["rendered"],
      protected: json["protected"],
    );
  }
}

class Guid {
  Guid({
    required this.rendered,
  });

  final String? rendered;

  factory Guid.fromJson(Map<String, dynamic> json) {
    return Guid(
      rendered: json["rendered"],
    );
  }
}

class Links {
  Links({
    required this.self,
    required this.collection,
    required this.about,
    required this.author,
    required this.replies,
    required this.versionHistory,
    required this.predecessorVersion,
    required this.wpFeaturedmedia,
    required this.wpAttachment,
    required this.wpTerm,
    required this.curies,
  });

  final List<About> self;
  final List<About> collection;
  final List<About> about;
  final List<AuthorElement> author;
  final List<AuthorElement> replies;
  final List<VersionHistory> versionHistory;
  final List<PredecessorVersion> predecessorVersion;
  final List<AuthorElement> wpFeaturedmedia;
  final List<About> wpAttachment;
  final List<WpTerm> wpTerm;
  final List<Cury> curies;

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: json["self"] == null
          ? []
          : List<About>.from(json["self"]!.map((x) => About.fromJson(x))),
      collection: json["collection"] == null
          ? []
          : List<About>.from(json["collection"]!.map((x) => About.fromJson(x))),
      about: json["about"] == null
          ? []
          : List<About>.from(json["about"]!.map((x) => About.fromJson(x))),
      author: json["author"] == null
          ? []
          : List<AuthorElement>.from(
              json["author"]!.map((x) => AuthorElement.fromJson(x))),
      replies: json["replies"] == null
          ? []
          : List<AuthorElement>.from(
              json["replies"]!.map((x) => AuthorElement.fromJson(x))),
      versionHistory: json["version-history"] == null
          ? []
          : List<VersionHistory>.from(
              json["version-history"]!.map((x) => VersionHistory.fromJson(x))),
      predecessorVersion: json["predecessor-version"] == null
          ? []
          : List<PredecessorVersion>.from(json["predecessor-version"]!
              .map((x) => PredecessorVersion.fromJson(x))),
      wpFeaturedmedia: json["wp:featuredmedia"] == null
          ? []
          : List<AuthorElement>.from(
              json["wp:featuredmedia"]!.map((x) => AuthorElement.fromJson(x))),
      wpAttachment: json["wp:attachment"] == null
          ? []
          : List<About>.from(
              json["wp:attachment"]!.map((x) => About.fromJson(x))),
      wpTerm: json["wp:term"] == null
          ? []
          : List<WpTerm>.from(json["wp:term"]!.map((x) => WpTerm.fromJson(x))),
      curies: json["curies"] == null
          ? []
          : List<Cury>.from(json["curies"]!.map((x) => Cury.fromJson(x))),
    );
  }
}

class About {
  About({
    required this.href,
  });

  final String? href;

  factory About.fromJson(Map<String, dynamic> json) {
    return About(
      href: json["href"],
    );
  }
}

class AuthorElement {
  AuthorElement({
    required this.embeddable,
    required this.href,
  });

  final bool? embeddable;
  final String? href;

  factory AuthorElement.fromJson(Map<String, dynamic> json) {
    return AuthorElement(
      embeddable: json["embeddable"],
      href: json["href"],
    );
  }
}

class Cury {
  Cury({
    required this.name,
    required this.href,
    required this.templated,
  });

  final String? name;
  final String? href;
  final bool? templated;

  factory Cury.fromJson(Map<String, dynamic> json) {
    return Cury(
      name: json["name"],
      href: json["href"],
      templated: json["templated"],
    );
  }
}

class PredecessorVersion {
  PredecessorVersion({
    required this.id,
    required this.href,
  });

  final int? id;
  final String? href;

  factory PredecessorVersion.fromJson(Map<String, dynamic> json) {
    return PredecessorVersion(
      id: json["id"],
      href: json["href"],
    );
  }
}

class VersionHistory {
  VersionHistory({
    required this.count,
    required this.href,
  });

  final int? count;
  final String? href;

  factory VersionHistory.fromJson(Map<String, dynamic> json) {
    return VersionHistory(
      count: json["count"],
      href: json["href"],
    );
  }
}

class WpTerm {
  WpTerm({
    required this.taxonomy,
    required this.embeddable,
    required this.href,
  });

  final String? taxonomy;
  final bool? embeddable;
  final String? href;

  factory WpTerm.fromJson(Map<String, dynamic> json) {
    return WpTerm(
      taxonomy: json["taxonomy"],
      embeddable: json["embeddable"],
      href: json["href"],
    );
  }
}

class Meta {
  Meta({
    required this.acfChanged,
    required this.footnotes,
  });

  final bool? acfChanged;
  final String? footnotes;

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      acfChanged: json["_acf_changed"],
      footnotes: json["footnotes"],
    );
  }
}

class YoastHeadJson {
  YoastHeadJson({
    required this.title,
    required this.description,
    required this.robots,
    required this.canonical,
    required this.ogLocale,
    required this.ogType,
    required this.ogTitle,
    required this.ogDescription,
    required this.ogUrl,
    required this.ogSiteName,
    required this.articlePublishedTime,
    required this.articleModifiedTime,
    required this.ogImage,
    required this.author,
    required this.twitterCard,
    required this.twitterMisc,
    required this.schema,
  });

  final String? title;
  final String? description;
  final Robots? robots;
  final String? canonical;
  final String? ogLocale;
  final String? ogType;
  final String? ogTitle;
  final String? ogDescription;
  final String? ogUrl;
  final String? ogSiteName;
  final DateTime? articlePublishedTime;
  final DateTime? articleModifiedTime;
  final List<OgImage> ogImage;
  final String? author;
  final String? twitterCard;
  final TwitterMisc? twitterMisc;
  final Schema? schema;

  factory YoastHeadJson.fromJson(Map<String, dynamic> json) {
    return YoastHeadJson(
      title: json["title"],
      description: json["description"],
      robots: json["robots"] == null ? null : Robots.fromJson(json["robots"]),
      canonical: json["canonical"],
      ogLocale: json["og_locale"],
      ogType: json["og_type"],
      ogTitle: json["og_title"],
      ogDescription: json["og_description"],
      ogUrl: json["og_url"],
      ogSiteName: json["og_site_name"],
      articlePublishedTime:
          DateTime.tryParse(json["article_published_time"] ?? ""),
      articleModifiedTime:
          DateTime.tryParse(json["article_modified_time"] ?? ""),
      ogImage: json["og_image"] == null
          ? []
          : List<OgImage>.from(
              json["og_image"]!.map((x) => OgImage.fromJson(x))),
      author: json["author"],
      twitterCard: json["twitter_card"],
      twitterMisc: json["twitter_misc"] == null
          ? null
          : TwitterMisc.fromJson(json["twitter_misc"]),
      schema: json["schema"] == null ? null : Schema.fromJson(json["schema"]),
    );
  }
}

class OgImage {
  OgImage({
    required this.width,
    required this.height,
    required this.url,
    required this.type,
  });

  final int? width;
  final int? height;
  final String? url;
  final String? type;

  factory OgImage.fromJson(Map<String, dynamic> json) {
    return OgImage(
      width: json["width"],
      height: json["height"],
      url: json["url"],
      type: json["type"],
    );
  }
}

class Robots {
  Robots({
    required this.index,
    required this.follow,
    required this.maxSnippet,
    required this.maxImagePreview,
    required this.maxVideoPreview,
  });

  final String? index;
  final String? follow;
  final String? maxSnippet;
  final String? maxImagePreview;
  final String? maxVideoPreview;

  factory Robots.fromJson(Map<String, dynamic> json) {
    return Robots(
      index: json["index"],
      follow: json["follow"],
      maxSnippet: json["max-snippet"],
      maxImagePreview: json["max-image-preview"],
      maxVideoPreview: json["max-video-preview"],
    );
  }
}

class Schema {
  Schema({
    required this.context,
    required this.graph,
  });

  final String? context;
  final List<Graph> graph;

  factory Schema.fromJson(Map<String, dynamic> json) {
    return Schema(
      context: json["@context"],
      graph: json["@graph"] == null
          ? []
          : List<Graph>.from(json["@graph"]!.map((x) => Graph.fromJson(x))),
    );
  }
}

class Graph {
  Graph({
    required this.type,
    required this.id,
    required this.url,
    required this.name,
    required this.isPartOf,
    required this.primaryImageOfPage,
    required this.image,
    required this.thumbnailUrl,
    required this.datePublished,
    required this.dateModified,
    required this.author,
    required this.description,
    required this.breadcrumb,
    required this.inLanguage,
    required this.potentialAction,
    required this.contentUrl,
    required this.width,
    required this.height,
    required this.caption,
    required this.itemListElement,
  });

  final String? type;
  final String? id;
  final String? url;
  final String? name;
  final BreadcrumbClass? isPartOf;
  final BreadcrumbClass? primaryImageOfPage;
  final Image? image;
  final String? thumbnailUrl;
  final DateTime? datePublished;
  final DateTime? dateModified;
  final BreadcrumbClass? author;
  final String? description;
  final BreadcrumbClass? breadcrumb;
  final String? inLanguage;
  final List<PotentialAction> potentialAction;
  final String? contentUrl;
  final int? width;
  final int? height;
  final String? caption;
  final List<ItemListElement> itemListElement;

  factory Graph.fromJson(Map<String, dynamic> json) {
    return Graph(
      type: json["@type"],
      id: json["@id"],
      url: json["url"],
      name: json["name"],
      isPartOf: json["isPartOf"] == null
          ? null
          : BreadcrumbClass.fromJson(json["isPartOf"]),
      primaryImageOfPage: json["primaryImageOfPage"] == null
          ? null
          : BreadcrumbClass.fromJson(json["primaryImageOfPage"]),
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      thumbnailUrl: json["thumbnailUrl"],
      datePublished: DateTime.tryParse(json["datePublished"] ?? ""),
      dateModified: DateTime.tryParse(json["dateModified"] ?? ""),
      author: json["author"] == null
          ? null
          : BreadcrumbClass.fromJson(json["author"]),
      description: json["description"],
      breadcrumb: json["breadcrumb"] == null
          ? null
          : BreadcrumbClass.fromJson(json["breadcrumb"]),
      inLanguage: json["inLanguage"],
      potentialAction: json["potentialAction"] == null
          ? []
          : List<PotentialAction>.from(
              json["potentialAction"]!.map((x) => PotentialAction.fromJson(x))),
      contentUrl: json["contentUrl"],
      width: json["width"],
      height: json["height"],
      caption: json["caption"],
      itemListElement: json["itemListElement"] == null
          ? []
          : List<ItemListElement>.from(
              json["itemListElement"]!.map((x) => ItemListElement.fromJson(x))),
    );
  }
}

class BreadcrumbClass {
  BreadcrumbClass({
    required this.id,
  });

  final String? id;

  factory BreadcrumbClass.fromJson(Map<String, dynamic> json) {
    return BreadcrumbClass(
      id: json["@id"],
    );
  }
}

class Image {
  Image({
    required this.id,
    required this.type,
    required this.inLanguage,
    required this.url,
    required this.contentUrl,
    required this.caption,
  });

  final String? id;
  final String? type;
  final String? inLanguage;
  final String? url;
  final String? contentUrl;
  final String? caption;

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json["@id"],
      type: json["@type"],
      inLanguage: json["inLanguage"],
      url: json["url"],
      contentUrl: json["contentUrl"],
      caption: json["caption"],
    );
  }
}

class ItemListElement {
  ItemListElement({
    required this.type,
    required this.position,
    required this.name,
    required this.item,
  });

  final String? type;
  final int? position;
  final String? name;
  final String? item;

  factory ItemListElement.fromJson(Map<String, dynamic> json) {
    return ItemListElement(
      type: json["@type"],
      position: json["position"],
      name: json["name"],
      item: json["item"],
    );
  }
}

class PotentialAction {
  PotentialAction({
    required this.type,
    required this.target,
    required this.queryInput,
  });

  final String? type;
  final dynamic target;
  final String? queryInput;

  factory PotentialAction.fromJson(Map<String, dynamic> json) {
    return PotentialAction(
      type: json["@type"],
      target: json["target"],
      queryInput: json["query-input"],
    );
  }
}

class TargetClass {
  TargetClass({
    required this.type,
    required this.urlTemplate,
  });

  final String? type;
  final String? urlTemplate;

  factory TargetClass.fromJson(Map<String, dynamic> json) {
    return TargetClass(
      type: json["@type"],
      urlTemplate: json["urlTemplate"],
    );
  }
}

class TwitterMisc {
  TwitterMisc({
    required this.empty,
  });

  final String? empty;

  factory TwitterMisc.fromJson(Map<String, dynamic> json) {
    return TwitterMisc(
      empty: json["نوشته\u200cشده بدست"],
    );
  }
}
