// To parse this JSON data, do
//
//     final appData = appDataFromMap(jsonString);

import 'package:hive/hive.dart';
import 'dart:convert';

part 'hive_model.g.dart';

AppData appDataFromMap(String str) => AppData.fromMap(json.decode(str));

String appDataToMap(AppData data) => json.encode(data.toMap());

@HiveType(typeId: 1)
class AppData {
  @HiveField(1)
  int? totalCount;
  @HiveField(2)
  bool? incompleteResults;
  @HiveField(3)
  List<Item>? items;

  AppData({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  factory AppData.fromMap(Map<String, dynamic> json) => AppData(
    totalCount: json["total_count"],
    incompleteResults: json["incomplete_results"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "total_count": totalCount,
    "incomplete_results": incompleteResults,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toMap())),
  };
}

@HiveType(typeId: 2)
class Item {
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? nodeId;
  @HiveField(3)
  String? name;
  @HiveField(4)
  String? fullName;
  @HiveField(5)
  bool? private;
  @HiveField(6)
  Owner? owner;
  @HiveField(7)
  String? htmlUrl;
  @HiveField(8)
  String? description;
  @HiveField(9)
  bool? fork;
  @HiveField(10)
  String? url;
  @HiveField(11)
  String? forksUrl;
  @HiveField(12)
  String? keysUrl;
  @HiveField(13)
  String? collaboratorsUrl;
  @HiveField(14)
  String? teamsUrl;
  @HiveField(15)
  String? hooksUrl;
  @HiveField(16)
  String? issueEventsUrl;
  @HiveField(17)
  String? eventsUrl;
  @HiveField(18)
  String? assigneesUrl;
  @HiveField(19)
  String? branchesUrl;
  @HiveField(20)
  String? tagsUrl;
  @HiveField(21)
  String? blobsUrl;
  @HiveField(22)
  String? gitTagsUrl;
  @HiveField(23)
  String? gitRefsUrl;
  @HiveField(24)
  String? treesUrl;
  @HiveField(25)
  String? statusesUrl;
  @HiveField(26)
  String? languagesUrl;
  @HiveField(27)
  String? stargazersUrl;
  @HiveField(28)
  String? contributorsUrl;
  @HiveField(29)
  String? subscribersUrl;
  @HiveField(30)
  String? subscriptionUrl;
  @HiveField(31)
  String? commitsUrl;
  @HiveField(32)
  String? gitCommitsUrl;
  @HiveField(33)
  String? commentsUrl;
  @HiveField(34)
  String? issueCommentUrl;
  @HiveField(35)
  String? contentsUrl;
  @HiveField(36)
  String? compareUrl;
  @HiveField(37)
  String? mergesUrl;
  @HiveField(38)
  String? archiveUrl;
  @HiveField(39)
  String? downloadsUrl;
  @HiveField(40)
  String? issuesUrl;
  @HiveField(41)
  String? pullsUrl;
  @HiveField(42)
  String? milestonesUrl;
  @HiveField(43)
  String? notificationsUrl;
  @HiveField(44)
  String? labelsUrl;
  @HiveField(45)
  String? releasesUrl;
  @HiveField(46)
  String? deploymentsUrl;
  @HiveField(47)
  String? createdAt;
  @HiveField(48)
  String? updatedAt;
  @HiveField(49)
  String? pushedAt;
  @HiveField(50)
  String? gitUrl;
  @HiveField(51)
  String? sshUrl;
  @HiveField(52)
  String? cloneUrl;
  @HiveField(53)
  String? svnUrl;
  @HiveField(54)
  String? homepage;
  @HiveField(55)
  int? size;
  @HiveField(56)
  int? stargazersCount;
  @HiveField(57)
  int? watchersCount;
  @HiveField(58)
  String? language;
  @HiveField(59)
  bool? hasIssues;
  @HiveField(60)
  bool? hasProjects;
  @HiveField(61)
  bool? hasDownloads;
  @HiveField(62)
  bool? hasWiki;
  @HiveField(63)
  bool? hasPages;
  @HiveField(64)
  bool? hasDiscussions;
  @HiveField(65)
  int? forksCount;
  @HiveField(66)
  dynamic mirrorUrl;
  @HiveField(67)
  bool? archived;
  @HiveField(68)
  bool? disabled;
  @HiveField(69)
  int? openIssuesCount;
  @HiveField(70)
  License? license;
  @HiveField(71)
  bool? allowForking;
  @HiveField(72)
  bool? isTemplate;
  @HiveField(73)
  bool? webCommitSignoffRequired;
  @HiveField(74)
  List<String>? topics;
  @HiveField(75)
  String? visibility;
  @HiveField(76)
  int? forks;
  @HiveField(77)
  int? openIssues;
  @HiveField(78)
  int? watchers;
  @HiveField(79)
  String? defaultBranch;
  @HiveField(80)
  double? score;

  Item({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.teamsUrl,
    this.hooksUrl,
    this.issueEventsUrl,
    this.eventsUrl,
    this.assigneesUrl,
    this.branchesUrl,
    this.tagsUrl,
    this.blobsUrl,
    this.gitTagsUrl,
    this.gitRefsUrl,
    this.treesUrl,
    this.statusesUrl,
    this.languagesUrl,
    this.stargazersUrl,
    this.contributorsUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.commitsUrl,
    this.gitCommitsUrl,
    this.commentsUrl,
    this.issueCommentUrl,
    this.contentsUrl,
    this.compareUrl,
    this.mergesUrl,
    this.archiveUrl,
    this.downloadsUrl,
    this.issuesUrl,
    this.pullsUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.labelsUrl,
    this.releasesUrl,
    this.deploymentsUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.homepage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.hasIssues,
    this.hasProjects,
    this.hasDownloads,
    this.hasWiki,
    this.hasPages,
    this.hasDiscussions,
    this.forksCount,
    this.mirrorUrl,
    this.archived,
    this.disabled,
    this.openIssuesCount,
    this.license,
    this.allowForking,
    this.isTemplate,
    this.webCommitSignoffRequired,
    this.topics,
    this.visibility,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
    this.score,
  });

  factory Item.fromMap(Map<String, dynamic> json) => Item(
    id: json["id"],
    nodeId: json["node_id"],
    name: json["name"],
    fullName: json["full_name"],
    private: json["private"],
    owner: json["owner"] == null ? null : Owner.fromMap(json["owner"]),
    htmlUrl: json["html_url"],
    description: json["description"],
    fork: json["fork"],
    url: json["url"],
    forksUrl: json["forks_url"],
    keysUrl: json["keys_url"],
    collaboratorsUrl: json["collaborators_url"],
    teamsUrl: json["teams_url"],
    hooksUrl: json["hooks_url"],
    issueEventsUrl: json["issue_events_url"],
    eventsUrl: json["events_url"],
    assigneesUrl: json["assignees_url"],
    branchesUrl: json["branches_url"],
    tagsUrl: json["tags_url"],
    blobsUrl: json["blobs_url"],
    gitTagsUrl: json["git_tags_url"],
    gitRefsUrl: json["git_refs_url"],
    treesUrl: json["trees_url"],
    statusesUrl: json["statuses_url"],
    languagesUrl: json["languages_url"],
    stargazersUrl: json["stargazers_url"],
    contributorsUrl: json["contributors_url"],
    subscribersUrl: json["subscribers_url"],
    subscriptionUrl: json["subscription_url"],
    commitsUrl: json["commits_url"],
    gitCommitsUrl: json["git_commits_url"],
    commentsUrl: json["comments_url"],
    issueCommentUrl: json["issue_comment_url"],
    contentsUrl: json["contents_url"],
    compareUrl: json["compare_url"],
    mergesUrl: json["merges_url"],
    archiveUrl: json["archive_url"],
    downloadsUrl: json["downloads_url"],
    issuesUrl: json["issues_url"],
    pullsUrl: json["pulls_url"],
    milestonesUrl: json["milestones_url"],
    notificationsUrl: json["notifications_url"],
    labelsUrl: json["labels_url"],
    releasesUrl: json["releases_url"],
    deploymentsUrl: json["deployments_url"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    pushedAt: json["pushed_at"],
    gitUrl: json["git_url"],
    sshUrl: json["ssh_url"],
    cloneUrl: json["clone_url"],
    svnUrl: json["svn_url"],
    homepage: json["homepage"],
    size: json["size"],
    stargazersCount: json["stargazers_count"],
    watchersCount: json["watchers_count"],
    language: json["language"],
    hasIssues: json["has_issues"],
    hasProjects: json["has_projects"],
    hasDownloads: json["has_downloads"],
    hasWiki: json["has_wiki"],
    hasPages: json["has_pages"],
    hasDiscussions: json["has_discussions"],
    forksCount: json["forks_count"],
    mirrorUrl: json["mirror_url"],
    archived: json["archived"],
    disabled: json["disabled"],
    openIssuesCount: json["open_issues_count"],
    license: json["license"] == null ? null : License.fromMap(json["license"]),
    allowForking: json["allow_forking"],
    isTemplate: json["is_template"],
    webCommitSignoffRequired: json["web_commit_signoff_required"],
    topics: json["topics"] == null ? [] : List<String>.from(json["topics"]!.map((x) => x)),
    visibility: json["visibility"],
    forks: json["forks"],
    openIssues: json["open_issues"],
    watchers: json["watchers"],
    defaultBranch: json["default_branch"],
    score: json["score"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "node_id": nodeId,
    "name": name,
    "full_name": fullName,
    "private": private,
    "owner": owner?.toMap(),
    "html_url": htmlUrl,
    "description": description,
    "fork": fork,
    "url": url,
    "forks_url": forksUrl,
    "keys_url": keysUrl,
    "collaborators_url": collaboratorsUrl,
    "teams_url": teamsUrl,
    "hooks_url": hooksUrl,
    "issue_events_url": issueEventsUrl,
    "events_url": eventsUrl,
    "assignees_url": assigneesUrl,
    "branches_url": branchesUrl,
    "tags_url": tagsUrl,
    "blobs_url": blobsUrl,
    "git_tags_url": gitTagsUrl,
    "git_refs_url": gitRefsUrl,
    "trees_url": treesUrl,
    "statuses_url": statusesUrl,
    "languages_url": languagesUrl,
    "stargazers_url": stargazersUrl,
    "contributors_url": contributorsUrl,
    "subscribers_url": subscribersUrl,
    "subscription_url": subscriptionUrl,
    "commits_url": commitsUrl,
    "git_commits_url": gitCommitsUrl,
    "comments_url": commentsUrl,
    "issue_comment_url": issueCommentUrl,
    "contents_url": contentsUrl,
    "compare_url": compareUrl,
    "merges_url": mergesUrl,
    "archive_url": archiveUrl,
    "downloads_url": downloadsUrl,
    "issues_url": issuesUrl,
    "pulls_url": pullsUrl,
    "milestones_url": milestonesUrl,
    "notifications_url": notificationsUrl,
    "labels_url": labelsUrl,
    "releases_url": releasesUrl,
    "deployments_url": deploymentsUrl,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "pushed_at": pushedAt,
    "git_url": gitUrl,
    "ssh_url": sshUrl,
    "clone_url": cloneUrl,
    "svn_url": svnUrl,
    "homepage": homepage,
    "size": size,
    "stargazers_count": stargazersCount,
    "watchers_count": watchersCount,
    "language": language,
    "has_issues": hasIssues,
    "has_projects": hasProjects,
    "has_downloads": hasDownloads,
    "has_wiki": hasWiki,
    "has_pages": hasPages,
    "has_discussions": hasDiscussions,
    "forks_count": forksCount,
    "mirror_url": mirrorUrl,
    "archived": archived,
    "disabled": disabled,
    "open_issues_count": openIssuesCount,
    "license": license?.toMap(),
    "allow_forking": allowForking,
    "is_template": isTemplate,
    "web_commit_signoff_required": webCommitSignoffRequired,
    "topics": topics == null ? [] : List<dynamic>.from(topics!.map((x) => x)),
    "visibility": visibility,
    "forks": forks,
    "open_issues": openIssues,
    "watchers": watchers,
    "default_branch": defaultBranch,
    "score": score,
  };
}

@HiveType(typeId: 3)
class License {
  @HiveField(1)
  String? key;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? spdxId;
  @HiveField(4)
  String? url;
  @HiveField(5)
  String? nodeId;

  License({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  factory License.fromMap(Map<String, dynamic> json) => License(
    key: json["key"],
    name: json["name"],
    spdxId: json["spdx_id"],
    url: json["url"],
    nodeId: json["node_id"],
  );

  Map<String, dynamic> toMap() => {
    "key": key,
    "name": name,
    "spdx_id": spdxId,
    "url": url,
    "node_id": nodeId,
  };
}

@HiveType(typeId: 4)
class Owner {
  @HiveField(1)
  String? login;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? nodeId;
  @HiveField(4)
  String? avatarUrl;
  @HiveField(5)
  String? gravatarId;
  @HiveField(6)
  String? url;
  @HiveField(7)
  String? htmlUrl;
  @HiveField(8)
  String? followersUrl;
  @HiveField(9)
  String? followingUrl;
  @HiveField(10)
  String? gistsUrl;
  @HiveField(11)
  String? starredUrl;
  @HiveField(12)
  String? subscriptionsUrl;
  @HiveField(13)
  String? organizationsUrl;
  @HiveField(14)
  String? reposUrl;
  @HiveField(15)
  String? eventsUrl;
  @HiveField(16)
  String? receivedEventsUrl;
  @HiveField(17)
  String? type;
  @HiveField(18)
  String? userViewType;
  @HiveField(19)
  bool? siteAdmin;

  Owner({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.userViewType,
    this.siteAdmin,
  });

  factory Owner.fromMap(Map<String, dynamic> json) => Owner(
    login: json["login"],
    id: json["id"],
    nodeId: json["node_id"],
    avatarUrl: json["avatar_url"],
    gravatarId: json["gravatar_id"],
    url: json["url"],
    htmlUrl: json["html_url"],
    followersUrl: json["followers_url"],
    followingUrl: json["following_url"],
    gistsUrl: json["gists_url"],
    starredUrl: json["starred_url"],
    subscriptionsUrl: json["subscriptions_url"],
    organizationsUrl: json["organizations_url"],
    reposUrl: json["repos_url"],
    eventsUrl: json["events_url"],
    receivedEventsUrl: json["received_events_url"],
    type: json["type"],
    userViewType: json["user_view_type"],
    siteAdmin: json["site_admin"],
  );

  Map<String, dynamic> toMap() => {
    "login": login,
    "id": id,
    "node_id": nodeId,
    "avatar_url": avatarUrl,
    "gravatar_id": gravatarId,
    "url": url,
    "html_url": htmlUrl,
    "followers_url": followersUrl,
    "following_url": followingUrl,
    "gists_url": gistsUrl,
    "starred_url": starredUrl,
    "subscriptions_url": subscriptionsUrl,
    "organizations_url": organizationsUrl,
    "repos_url": reposUrl,
    "events_url": eventsUrl,
    "received_events_url": receivedEventsUrl,
    "type": type,
    "user_view_type": userViewType,
    "site_admin": siteAdmin,
  };
}
