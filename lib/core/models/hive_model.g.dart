// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppDataAdapter extends TypeAdapter<AppData> {
  @override
  final int typeId = 1;

  @override
  AppData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppData(
      totalCount: fields[1] as int?,
      incompleteResults: fields[2] as bool?,
      items: (fields[3] as List?)?.cast<Item>(),
    );
  }

  @override
  void write(BinaryWriter writer, AppData obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.totalCount)
      ..writeByte(2)
      ..write(obj.incompleteResults)
      ..writeByte(3)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItemAdapter extends TypeAdapter<Item> {
  @override
  final int typeId = 2;

  @override
  Item read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Item(
      id: fields[1] as int?,
      nodeId: fields[2] as String?,
      name: fields[3] as String?,
      fullName: fields[4] as String?,
      private: fields[5] as bool?,
      owner: fields[6] as Owner?,
      htmlUrl: fields[7] as String?,
      description: fields[8] as String?,
      fork: fields[9] as bool?,
      url: fields[10] as String?,
      forksUrl: fields[11] as String?,
      keysUrl: fields[12] as String?,
      collaboratorsUrl: fields[13] as String?,
      teamsUrl: fields[14] as String?,
      hooksUrl: fields[15] as String?,
      issueEventsUrl: fields[16] as String?,
      eventsUrl: fields[17] as String?,
      assigneesUrl: fields[18] as String?,
      branchesUrl: fields[19] as String?,
      tagsUrl: fields[20] as String?,
      blobsUrl: fields[21] as String?,
      gitTagsUrl: fields[22] as String?,
      gitRefsUrl: fields[23] as String?,
      treesUrl: fields[24] as String?,
      statusesUrl: fields[25] as String?,
      languagesUrl: fields[26] as String?,
      stargazersUrl: fields[27] as String?,
      contributorsUrl: fields[28] as String?,
      subscribersUrl: fields[29] as String?,
      subscriptionUrl: fields[30] as String?,
      commitsUrl: fields[31] as String?,
      gitCommitsUrl: fields[32] as String?,
      commentsUrl: fields[33] as String?,
      issueCommentUrl: fields[34] as String?,
      contentsUrl: fields[35] as String?,
      compareUrl: fields[36] as String?,
      mergesUrl: fields[37] as String?,
      archiveUrl: fields[38] as String?,
      downloadsUrl: fields[39] as String?,
      issuesUrl: fields[40] as String?,
      pullsUrl: fields[41] as String?,
      milestonesUrl: fields[42] as String?,
      notificationsUrl: fields[43] as String?,
      labelsUrl: fields[44] as String?,
      releasesUrl: fields[45] as String?,
      deploymentsUrl: fields[46] as String?,
      createdAt: fields[47] as String?,
      updatedAt: fields[48] as String?,
      pushedAt: fields[49] as String?,
      gitUrl: fields[50] as String?,
      sshUrl: fields[51] as String?,
      cloneUrl: fields[52] as String?,
      svnUrl: fields[53] as String?,
      homepage: fields[54] as String?,
      size: fields[55] as int?,
      stargazersCount: fields[56] as int?,
      watchersCount: fields[57] as int?,
      language: fields[58] as String?,
      hasIssues: fields[59] as bool?,
      hasProjects: fields[60] as bool?,
      hasDownloads: fields[61] as bool?,
      hasWiki: fields[62] as bool?,
      hasPages: fields[63] as bool?,
      hasDiscussions: fields[64] as bool?,
      forksCount: fields[65] as int?,
      mirrorUrl: fields[66] as dynamic,
      archived: fields[67] as bool?,
      disabled: fields[68] as bool?,
      openIssuesCount: fields[69] as int?,
      license: fields[70] as License?,
      allowForking: fields[71] as bool?,
      isTemplate: fields[72] as bool?,
      webCommitSignoffRequired: fields[73] as bool?,
      topics: (fields[74] as List?)?.cast<String>(),
      visibility: fields[75] as String?,
      forks: fields[76] as int?,
      openIssues: fields[77] as int?,
      watchers: fields[78] as int?,
      defaultBranch: fields[79] as String?,
      score: fields[80] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer
      ..writeByte(80)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.nodeId)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.fullName)
      ..writeByte(5)
      ..write(obj.private)
      ..writeByte(6)
      ..write(obj.owner)
      ..writeByte(7)
      ..write(obj.htmlUrl)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.fork)
      ..writeByte(10)
      ..write(obj.url)
      ..writeByte(11)
      ..write(obj.forksUrl)
      ..writeByte(12)
      ..write(obj.keysUrl)
      ..writeByte(13)
      ..write(obj.collaboratorsUrl)
      ..writeByte(14)
      ..write(obj.teamsUrl)
      ..writeByte(15)
      ..write(obj.hooksUrl)
      ..writeByte(16)
      ..write(obj.issueEventsUrl)
      ..writeByte(17)
      ..write(obj.eventsUrl)
      ..writeByte(18)
      ..write(obj.assigneesUrl)
      ..writeByte(19)
      ..write(obj.branchesUrl)
      ..writeByte(20)
      ..write(obj.tagsUrl)
      ..writeByte(21)
      ..write(obj.blobsUrl)
      ..writeByte(22)
      ..write(obj.gitTagsUrl)
      ..writeByte(23)
      ..write(obj.gitRefsUrl)
      ..writeByte(24)
      ..write(obj.treesUrl)
      ..writeByte(25)
      ..write(obj.statusesUrl)
      ..writeByte(26)
      ..write(obj.languagesUrl)
      ..writeByte(27)
      ..write(obj.stargazersUrl)
      ..writeByte(28)
      ..write(obj.contributorsUrl)
      ..writeByte(29)
      ..write(obj.subscribersUrl)
      ..writeByte(30)
      ..write(obj.subscriptionUrl)
      ..writeByte(31)
      ..write(obj.commitsUrl)
      ..writeByte(32)
      ..write(obj.gitCommitsUrl)
      ..writeByte(33)
      ..write(obj.commentsUrl)
      ..writeByte(34)
      ..write(obj.issueCommentUrl)
      ..writeByte(35)
      ..write(obj.contentsUrl)
      ..writeByte(36)
      ..write(obj.compareUrl)
      ..writeByte(37)
      ..write(obj.mergesUrl)
      ..writeByte(38)
      ..write(obj.archiveUrl)
      ..writeByte(39)
      ..write(obj.downloadsUrl)
      ..writeByte(40)
      ..write(obj.issuesUrl)
      ..writeByte(41)
      ..write(obj.pullsUrl)
      ..writeByte(42)
      ..write(obj.milestonesUrl)
      ..writeByte(43)
      ..write(obj.notificationsUrl)
      ..writeByte(44)
      ..write(obj.labelsUrl)
      ..writeByte(45)
      ..write(obj.releasesUrl)
      ..writeByte(46)
      ..write(obj.deploymentsUrl)
      ..writeByte(47)
      ..write(obj.createdAt)
      ..writeByte(48)
      ..write(obj.updatedAt)
      ..writeByte(49)
      ..write(obj.pushedAt)
      ..writeByte(50)
      ..write(obj.gitUrl)
      ..writeByte(51)
      ..write(obj.sshUrl)
      ..writeByte(52)
      ..write(obj.cloneUrl)
      ..writeByte(53)
      ..write(obj.svnUrl)
      ..writeByte(54)
      ..write(obj.homepage)
      ..writeByte(55)
      ..write(obj.size)
      ..writeByte(56)
      ..write(obj.stargazersCount)
      ..writeByte(57)
      ..write(obj.watchersCount)
      ..writeByte(58)
      ..write(obj.language)
      ..writeByte(59)
      ..write(obj.hasIssues)
      ..writeByte(60)
      ..write(obj.hasProjects)
      ..writeByte(61)
      ..write(obj.hasDownloads)
      ..writeByte(62)
      ..write(obj.hasWiki)
      ..writeByte(63)
      ..write(obj.hasPages)
      ..writeByte(64)
      ..write(obj.hasDiscussions)
      ..writeByte(65)
      ..write(obj.forksCount)
      ..writeByte(66)
      ..write(obj.mirrorUrl)
      ..writeByte(67)
      ..write(obj.archived)
      ..writeByte(68)
      ..write(obj.disabled)
      ..writeByte(69)
      ..write(obj.openIssuesCount)
      ..writeByte(70)
      ..write(obj.license)
      ..writeByte(71)
      ..write(obj.allowForking)
      ..writeByte(72)
      ..write(obj.isTemplate)
      ..writeByte(73)
      ..write(obj.webCommitSignoffRequired)
      ..writeByte(74)
      ..write(obj.topics)
      ..writeByte(75)
      ..write(obj.visibility)
      ..writeByte(76)
      ..write(obj.forks)
      ..writeByte(77)
      ..write(obj.openIssues)
      ..writeByte(78)
      ..write(obj.watchers)
      ..writeByte(79)
      ..write(obj.defaultBranch)
      ..writeByte(80)
      ..write(obj.score);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LicenseAdapter extends TypeAdapter<License> {
  @override
  final int typeId = 3;

  @override
  License read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return License(
      key: fields[1] as String?,
      name: fields[2] as String?,
      spdxId: fields[3] as String?,
      url: fields[4] as String?,
      nodeId: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, License obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.key)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.spdxId)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.nodeId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LicenseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OwnerAdapter extends TypeAdapter<Owner> {
  @override
  final int typeId = 4;

  @override
  Owner read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Owner(
      login: fields[1] as String?,
      id: fields[2] as int?,
      nodeId: fields[3] as String?,
      avatarUrl: fields[4] as String?,
      gravatarId: fields[5] as String?,
      url: fields[6] as String?,
      htmlUrl: fields[7] as String?,
      followersUrl: fields[8] as String?,
      followingUrl: fields[9] as String?,
      gistsUrl: fields[10] as String?,
      starredUrl: fields[11] as String?,
      subscriptionsUrl: fields[12] as String?,
      organizationsUrl: fields[13] as String?,
      reposUrl: fields[14] as String?,
      eventsUrl: fields[15] as String?,
      receivedEventsUrl: fields[16] as String?,
      type: fields[17] as String?,
      userViewType: fields[18] as String?,
      siteAdmin: fields[19] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Owner obj) {
    writer
      ..writeByte(19)
      ..writeByte(1)
      ..write(obj.login)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.nodeId)
      ..writeByte(4)
      ..write(obj.avatarUrl)
      ..writeByte(5)
      ..write(obj.gravatarId)
      ..writeByte(6)
      ..write(obj.url)
      ..writeByte(7)
      ..write(obj.htmlUrl)
      ..writeByte(8)
      ..write(obj.followersUrl)
      ..writeByte(9)
      ..write(obj.followingUrl)
      ..writeByte(10)
      ..write(obj.gistsUrl)
      ..writeByte(11)
      ..write(obj.starredUrl)
      ..writeByte(12)
      ..write(obj.subscriptionsUrl)
      ..writeByte(13)
      ..write(obj.organizationsUrl)
      ..writeByte(14)
      ..write(obj.reposUrl)
      ..writeByte(15)
      ..write(obj.eventsUrl)
      ..writeByte(16)
      ..write(obj.receivedEventsUrl)
      ..writeByte(17)
      ..write(obj.type)
      ..writeByte(18)
      ..write(obj.userViewType)
      ..writeByte(19)
      ..write(obj.siteAdmin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OwnerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
