/// id : 1
/// revelation_place : "makkah"
/// revelation_order : 5
/// bismillah_pre : false
/// name_simple : "Al-Fatihah"
/// name_complex : "Al-Fātiĥah"
/// name_arabic : "الفاتحة"
/// verses_count : 7
/// pages : [1,1]
/// translated_name : {"language_name":"english","name":"The Opener"}

class QuranChapter {
  int? id;
  String? revelationPlace;
  int? revelationOrder;
  bool? bismillahPre;
  String? nameSimple;
  String? nameComplex;
  String? nameArabic;
  int? versesCount;
  List<int>? pages;
  Translated_name? translatedName;

  QuranChapter({
      this.id, 
      this.revelationPlace, 
      this.revelationOrder, 
      this.bismillahPre, 
      this.nameSimple, 
      this.nameComplex, 
      this.nameArabic, 
      this.versesCount, 
      this.pages, 
      this.translatedName});

  QuranChapter.fromJson(dynamic json) {
    id = json['id'];
    revelationPlace = json['revelation_place'];
    revelationOrder = json['revelation_order'];
    bismillahPre = json['bismillah_pre'];
    nameSimple = json['name_simple'];
    nameComplex = json['name_complex'];
    nameArabic = json['name_arabic'];
    versesCount = json['verses_count'];
    pages = json['pages'] != null ? json['pages'].cast<int>() : [];
    translatedName = json['translated_name'] != null ? Translated_name.fromJson(json['translated_name']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['revelation_place'] = revelationPlace;
    map['revelation_order'] = revelationOrder;
    map['bismillah_pre'] = bismillahPre;
    map['name_simple'] = nameSimple;
    map['name_complex'] = nameComplex;
    map['name_arabic'] = nameArabic;
    map['verses_count'] = versesCount;
    map['pages'] = pages;
    if (translatedName != null) {
      map['translated_name'] = translatedName?.toJson();
    }
    return map;
  }

}

/// language_name : "english"
/// name : "The Opener"

class Translated_name {
  String? languageName;
  String? name;

  Translated_name({
      this.languageName, 
      this.name});

  Translated_name.fromJson(dynamic json) {
    languageName = json['language_name'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['language_name'] = languageName;
    map['name'] = name;
    return map;
  }

}