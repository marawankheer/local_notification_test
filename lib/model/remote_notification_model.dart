class RemoteNotificationModel {
  final AndroidNotification? android;
  final AppleNotification? apple;
  final WebNotification? web;
  final String? title;
  final List<String> titleLocArgs;
  final String? titleLocKey;
  final String? body;
  final List<String> bodyLocArgs;
  final String? bodyLocKey;

  const RemoteNotificationModel(
      {this.android,
      this.apple,
      this.web,
      this.title,
      this.titleLocArgs = const <String>[],
      this.titleLocKey,
      this.body,
      this.bodyLocArgs = const <String>[],
      this.bodyLocKey});

  factory RemoteNotificationModel.fromMap(Map<String, dynamic> map) {
    return RemoteNotificationModel(
      title: map['title'],
      titleLocArgs: _toList(map['titleLocArgs']),
      titleLocKey: map['titleLocKey'],
      body: map['body'],
      bodyLocArgs: _toList(map['bodyLocArgs']),
      bodyLocKey: map['bodyLocKey'],
      android: map['android'] != null
          ? AndroidNotification.fromMap(
              Map<String, dynamic>.from(map['android']))
          : null,
      apple: map['apple'] != null
          ? AppleNotification.fromMap(Map<String, dynamic>.from(map['apple']))
          : null,
      web: map['web'] != null
          ? WebNotification.fromMap(Map<String, dynamic>.from(map['web']))
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'titleLocArgs': titleLocArgs,
      'titleLocKey': titleLocKey,
      'body': body,
      'bodyLocArgs': bodyLocArgs,
      'bodyLocKey': bodyLocKey,
      'android': android?.toMap(),
      'apple': apple?.toMap(),
      'web': web?.toMap(),
    };
  }
}

class AndroidNotification {
  final String? channelId;
  final String? clickAction;
  final String? color;
  final int? count;
  final String? imageUrl;
  final String? link;

  // final AndroidNotificationPriority priority;
  final String? smallIcon;
  final String? sound;
  final String? ticker;

  // final AndroidNotificationVisibility visibility;
  final String? tag;

  const AndroidNotification({
    this.channelId,
    this.clickAction,
    this.color,
    this.count,
    this.imageUrl,
    this.link,
    // this.priority = AndroidNotificationPriority.defaultPriority,
    this.smallIcon,
    this.sound,
    this.ticker,
    this.tag,
    // this.visibility = AndroidNotificationVisibility.private
  });

  factory AndroidNotification.fromMap(Map<String, dynamic> map) {
    return AndroidNotification(
      channelId: map['channelId'],
      clickAction: map['clickAction'],
      color: map['color'],
      count: map['count'],
      imageUrl: map['imageUrl'],
      link: map['link'],
      // priority: convertToAndroidNotificationPriority(map['priority']),
      smallIcon: map['smallIcon'],
      sound: map['sound'],
      ticker: map['ticker'],
      tag: map['tag'],
      // visibility: convertToAndroidNotificationVisibility(map['visibility']),
    );
  }

  /// Returns the [AndroidNotification] as a raw Map.
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'channelId': channelId,
      'clickAction': clickAction,
      'color': color,
      'count': count,
      'imageUrl': imageUrl,
      'link': link,
      // 'priority': convertAndroidNotificationPriorityToInt(priority),
      'smallIcon': smallIcon,
      'sound': sound,
      'ticker': ticker,
      'tag': tag,
      // 'visibility': convertAndroidNotificationVisibilityToInt(visibility),
    };
  }
}

class AppleNotification {
  final String? badge;
  final AppleNotificationSound? sound;
  final String? imageUrl;
  final String? subtitle;
  final List<String> subtitleLocArgs;
  final String? subtitleLocKey;

  const AppleNotification(
      {this.badge,
      this.sound,
      this.imageUrl,
      this.subtitle,
      this.subtitleLocArgs = const <String>[],
      this.subtitleLocKey});

  /// Constructs an [AppleNotification] from a raw Map.
  factory AppleNotification.fromMap(Map<String, dynamic> map) {
    return AppleNotification(
      badge: map['badge'],
      subtitle: map['subtitle'],
      subtitleLocArgs: _toList(map['subtitleLocArgs']),
      subtitleLocKey: map['subtitleLocKey'],
      imageUrl: map['imageUrl'],
      sound: map['sound'] == null
          ? null
          : AppleNotificationSound.fromMap(
              Map<String, dynamic>.from(map['sound'])),
    );
  }

  /// Returns the [AppleNotification] as a raw Map.
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'badge': badge,
      'subtitle': subtitle,
      'subtitleLocArgs': subtitleLocArgs,
      'subtitleLocKey': subtitleLocKey,
      'imageUrl': imageUrl,
      'sound': sound?.toMap(),
    };
  }
}

class AppleNotificationSound {
  final bool critical;
  final String? name;
  final num volume;

  const AppleNotificationSound(
      {this.critical = false, this.name, this.volume = 0});

  factory AppleNotificationSound.fromMap(Map<String, dynamic> map) {
    return AppleNotificationSound(
      critical: map['critical'] ?? false,
      name: map['name'],
      volume: map['volume'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'critical': critical,
      'name': name,
      'volume': volume,
    };
  }
}

List<String> _toList(dynamic value) {
  if (value == null) {
    return <String>[];
  }

  return List<String>.from(value);
}

class WebNotification {
  final String? analyticsLabel;
  final String? image;
  final String? link;

  const WebNotification({
    this.analyticsLabel,
    this.image,
    this.link,
  });

  factory WebNotification.fromMap(Map<String, dynamic> map) {
    return WebNotification(
      analyticsLabel: map['analyticsLabel'],
      image: map['image'],
      link: map['link'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'analyticsLabel': analyticsLabel,
      'image': image,
      'link': link,
    };
  }
}
