import 'dart:convert';

BolaModel premierLeagueFromJson(String str) => BolaModel.fromJson(json.decode(str));

String premierLeagueToJson(BolaModel data) => json.encode(data.toJson());

class BolaModel {
  List<Team> teams;

  BolaModel({
    required this.teams,
  });

  factory BolaModel.fromJson(Map<String, dynamic> json) => BolaModel(
    teams: List<Team>.from(json["teams"].map((x) => Team.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "teams": List<dynamic>.from(teams.map((x) => x.toJson())),
  };
}

class Team {
  String idTeam;
  String idSoccerXml;
  String idApIfootball;
  String? intLoved;
  String strTeam;
  String strTeamAlternate;
  String strTeamShort;
  String intFormedYear;
  StrSport strSport;
  StrLeague strLeague;
  String idLeague;
  StrLeague2 strLeague2;
  String idLeague2;
  StrLeague3 strLeague3;
  String idLeague3;
  StrLeague4 strLeague4;
  String? idLeague4;
  String strLeague5;
  String? idLeague5;
  StrLeague6 strLeague6;
  String? idLeague6;
  StrLeague7 strLeague7;
  String? idLeague7;
  dynamic strDivision;
  String idVenue;
  String strStadium;
  String strKeywords;
  String strRss;
  String strLocation;
  String intStadiumCapacity;
  String strWebsite;
  String strFacebook;
  String strTwitter;
  String strInstagram;
  String strDescriptionEn;
  String? strDescriptionDe;
  String? strDescriptionFr;
  dynamic strDescriptionCn;
  String strDescriptionIt;
  String? strDescriptionJp;
  String? strDescriptionRu;
  String? strDescriptionEs;
  String? strDescriptionPt;
  dynamic strDescriptionSe;
  dynamic strDescriptionNl;
  dynamic strDescriptionHu;
  String? strDescriptionNo;
  dynamic strDescriptionIl;
  dynamic strDescriptionPl;
  String strColour1;
  String strColour2;
  String strColour3;
  StrGender strGender;
  StrCountry strCountry;
  String strBadge;
  String strLogo;
  String strFanart1;
  String strFanart2;
  String strFanart3;
  String strFanart4;
  String strBanner;
  String strEquipment;
  String strYoutube;
  StrLocked strLocked;

  Team({
    required this.idTeam,
    required this.idSoccerXml,
    required this.idApIfootball,
    required this.intLoved,
    required this.strTeam,
    required this.strTeamAlternate,
    required this.strTeamShort,
    required this.intFormedYear,
    required this.strSport,
    required this.strLeague,
    required this.idLeague,
    required this.strLeague2,
    required this.idLeague2,
    required this.strLeague3,
    required this.idLeague3,
    required this.strLeague4,
    required this.idLeague4,
    required this.strLeague5,
    required this.idLeague5,
    required this.strLeague6,
    required this.idLeague6,
    required this.strLeague7,
    required this.idLeague7,
    required this.strDivision,
    required this.idVenue,
    required this.strStadium,
    required this.strKeywords,
    required this.strRss,
    required this.strLocation,
    required this.intStadiumCapacity,
    required this.strWebsite,
    required this.strFacebook,
    required this.strTwitter,
    required this.strInstagram,
    required this.strDescriptionEn,
    required this.strDescriptionDe,
    required this.strDescriptionFr,
    required this.strDescriptionCn,
    required this.strDescriptionIt,
    required this.strDescriptionJp,
    required this.strDescriptionRu,
    required this.strDescriptionEs,
    required this.strDescriptionPt,
    required this.strDescriptionSe,
    required this.strDescriptionNl,
    required this.strDescriptionHu,
    required this.strDescriptionNo,
    required this.strDescriptionIl,
    required this.strDescriptionPl,
    required this.strColour1,
    required this.strColour2,
    required this.strColour3,
    required this.strGender,
    required this.strCountry,
    required this.strBadge,
    required this.strLogo,
    required this.strFanart1,
    required this.strFanart2,
    required this.strFanart3,
    required this.strFanart4,
    required this.strBanner,
    required this.strEquipment,
    required this.strYoutube,
    required this.strLocked,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    idTeam: json["idTeam"],
    idSoccerXml: json["idSoccerXML"],
    idApIfootball: json["idAPIfootball"],
    intLoved: json["intLoved"],
    strTeam: json["strTeam"],
    strTeamAlternate: json["strTeamAlternate"],
    strTeamShort: json["strTeamShort"],
    intFormedYear: json["intFormedYear"],
    strSport: strSportValues.map[json["strSport"]]!,
    strLeague: strLeagueValues.map[json["strLeague"]]!,
    idLeague: json["idLeague"],
    strLeague2: strLeague2Values.map[json["strLeague2"]]!,
    idLeague2: json["idLeague2"],
    strLeague3: strLeague3Values.map[json["strLeague3"]]!,
    idLeague3: json["idLeague3"],
    strLeague4: strLeague4Values.map[json["strLeague4"]]!,
    idLeague4: json["idLeague4"],
    strLeague5: json["strLeague5"],
    idLeague5: json["idLeague5"],
    strLeague6: strLeague6Values.map[json["strLeague6"]]!,
    idLeague6: json["idLeague6"],
    strLeague7: strLeague7Values.map[json["strLeague7"]]!,
    idLeague7: json["idLeague7"],
    strDivision: json["strDivision"],
    idVenue: json["idVenue"],
    strStadium: json["strStadium"],
    strKeywords: json["strKeywords"],
    strRss: json["strRSS"],
    strLocation: json["strLocation"],
    intStadiumCapacity: json["intStadiumCapacity"],
    strWebsite: json["strWebsite"],
    strFacebook: json["strFacebook"],
    strTwitter: json["strTwitter"],
    strInstagram: json["strInstagram"],
    strDescriptionEn: json["strDescriptionEN"],
    strDescriptionDe: json["strDescriptionDE"],
    strDescriptionFr: json["strDescriptionFR"],
    strDescriptionCn: json["strDescriptionCN"],
    strDescriptionIt: json["strDescriptionIT"],
    strDescriptionJp: json["strDescriptionJP"],
    strDescriptionRu: json["strDescriptionRU"],
    strDescriptionEs: json["strDescriptionES"],
    strDescriptionPt: json["strDescriptionPT"],
    strDescriptionSe: json["strDescriptionSE"],
    strDescriptionNl: json["strDescriptionNL"],
    strDescriptionHu: json["strDescriptionHU"],
    strDescriptionNo: json["strDescriptionNO"],
    strDescriptionIl: json["strDescriptionIL"],
    strDescriptionPl: json["strDescriptionPL"],
    strColour1: json["strColour1"],
    strColour2: json["strColour2"],
    strColour3: json["strColour3"],
    strGender: strGenderValues.map[json["strGender"]]!,
    strCountry: strCountryValues.map[json["strCountry"]]!,
    strBadge: json["strBadge"],
    strLogo: json["strLogo"],
    strFanart1: json["strFanart1"],
    strFanart2: json["strFanart2"],
    strFanart3: json["strFanart3"],
    strFanart4: json["strFanart4"],
    strBanner: json["strBanner"],
    strEquipment: json["strEquipment"],
    strYoutube: json["strYoutube"],
    strLocked: strLockedValues.map[json["strLocked"]]!,
  );

  Map<String, dynamic> toJson() => {
    "idTeam": idTeam,
    "idSoccerXML": idSoccerXml,
    "idAPIfootball": idApIfootball,
    "intLoved": intLoved,
    "strTeam": strTeam,
    "strTeamAlternate": strTeamAlternate,
    "strTeamShort": strTeamShort,
    "intFormedYear": intFormedYear,
    "strSport": strSportValues.reverse[strSport],
    "strLeague": strLeagueValues.reverse[strLeague],
    "idLeague": idLeague,
    "strLeague2": strLeague2Values.reverse[strLeague2],
    "idLeague2": idLeague2,
    "strLeague3": strLeague3Values.reverse[strLeague3],
    "idLeague3": idLeague3,
    "strLeague4": strLeague4Values.reverse[strLeague4],
    "idLeague4": idLeague4,
    "strLeague5": strLeague5,
    "idLeague5": idLeague5,
    "strLeague6": strLeague6Values.reverse[strLeague6],
    "idLeague6": idLeague6,
    "strLeague7": strLeague7Values.reverse[strLeague7],
    "idLeague7": idLeague7,
    "strDivision": strDivision,
    "idVenue": idVenue,
    "strStadium": strStadium,
    "strKeywords": strKeywords,
    "strRSS": strRss,
    "strLocation": strLocation,
    "intStadiumCapacity": intStadiumCapacity,
    "strWebsite": strWebsite,
    "strFacebook": strFacebook,
    "strTwitter": strTwitter,
    "strInstagram": strInstagram,
    "strDescriptionEN": strDescriptionEn,
    "strDescriptionDE": strDescriptionDe,
    "strDescriptionFR": strDescriptionFr,
    "strDescriptionCN": strDescriptionCn,
    "strDescriptionIT": strDescriptionIt,
    "strDescriptionJP": strDescriptionJp,
    "strDescriptionRU": strDescriptionRu,
    "strDescriptionES": strDescriptionEs,
    "strDescriptionPT": strDescriptionPt,
    "strDescriptionSE": strDescriptionSe,
    "strDescriptionNL": strDescriptionNl,
    "strDescriptionHU": strDescriptionHu,
    "strDescriptionNO": strDescriptionNo,
    "strDescriptionIL": strDescriptionIl,
    "strDescriptionPL": strDescriptionPl,
    "strColour1": strColour1,
    "strColour2": strColour2,
    "strColour3": strColour3,
    "strGender": strGenderValues.reverse[strGender],
    "strCountry": strCountryValues.reverse[strCountry],
    "strBadge": strBadge,
    "strLogo": strLogo,
    "strFanart1": strFanart1,
    "strFanart2": strFanart2,
    "strFanart3": strFanart3,
    "strFanart4": strFanart4,
    "strBanner": strBanner,
    "strEquipment": strEquipment,
    "strYoutube": strYoutube,
    "strLocked": strLockedValues.reverse[strLocked],
  };
}

enum StrCountry {
  ENGLAND
}

final strCountryValues = EnumValues({
  "England": StrCountry.ENGLAND
});

enum StrGender {
  MALE
}

final strGenderValues = EnumValues({
  "Male": StrGender.MALE
});

enum StrLeague {
  ENGLISH_PREMIER_LEAGUE
}

final strLeagueValues = EnumValues({
  "English Premier League": StrLeague.ENGLISH_PREMIER_LEAGUE
});

enum StrLeague2 {
  EFL_TROPHY,
  FA_CUP
}

final strLeague2Values = EnumValues({
  "EFL Trophy": StrLeague2.EFL_TROPHY,
  "FA Cup": StrLeague2.FA_CUP
});

enum StrLeague3 {
  EFL_CUP,
  FA_CUP
}

final strLeague3Values = EnumValues({
  "EFL Cup": StrLeague3.EFL_CUP,
  "FA Cup": StrLeague3.FA_CUP
});

enum StrLeague4 {
  EMPTY,
  UEFA_CHAMPIONS_LEAGUE,
  UEFA_CONFERENCE_LEAGUE,
  UEFA_EUROPA_LEAGUE
}

final strLeague4Values = EnumValues({
  "": StrLeague4.EMPTY,
  "UEFA Champions League": StrLeague4.UEFA_CHAMPIONS_LEAGUE,
  "UEFA Conference League": StrLeague4.UEFA_CONFERENCE_LEAGUE,
  "UEFA Europa League": StrLeague4.UEFA_EUROPA_LEAGUE
});

enum StrLeague6 {
  EMPTY,
  FA_COMMUNITY_SHIELD
}

final strLeague6Values = EnumValues({
  "": StrLeague6.EMPTY,
  "FA Community Shield": StrLeague6.FA_COMMUNITY_SHIELD
});

enum StrLeague7 {
  EMPTY,
  FIFA_CLUB_WORLD_CUP
}

final strLeague7Values = EnumValues({
  "": StrLeague7.EMPTY,
  "FIFA Club World Cup": StrLeague7.FIFA_CLUB_WORLD_CUP
});

enum StrLocked {
  UNLOCKED
}

final strLockedValues = EnumValues({
  "unlocked": StrLocked.UNLOCKED
});

enum StrSport {
  SOCCER
}

final strSportValues = EnumValues({
  "Soccer": StrSport.SOCCER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}