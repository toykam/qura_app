/// id : 1
/// position : 1
/// text_uthmani : "بِسْمِ"
/// text_indopak : "بِسۡمِ"
/// text_imlaei : "بِسْمِ"
/// verse_key : "1:1"
/// page_number : 1
/// line_number : 2
/// audio_url : "wbw/001_001_001.mp3"
/// location : "1:1:1"
/// char_type_name : "word"
/// code_v1 : "&#xfb51;"
/// translation : {"text":"In (the) name","language_name":"english"}
/// transliteration : {"text":"bis'mi","language_name":"english"}

class VerseWord {
  int? id;
  int? position;
  String? textUthmani;
  String? textIndopak;
  String? textImlaei;
  String? verseKey;
  int? pageNumber;
  int? lineNumber;
  String? audioUrl;
  String? location;
  String? charTypeName;
  String? codeV1;
  Translation? translation;
  Transliteration? transliteration;

  VerseWord({
      this.id, 
      this.position, 
      this.textUthmani, 
      this.textIndopak, 
      this.textImlaei, 
      this.verseKey, 
      this.pageNumber, 
      this.lineNumber, 
      this.audioUrl, 
      this.location, 
      this.charTypeName, 
      this.codeV1, 
      this.translation, 
      this.transliteration});

  VerseWord.fromJson(dynamic json) {
    id = json['id'];
    position = json['position'];
    textUthmani = json['text_uthmani'];
    textIndopak = json['text_indopak'];
    textImlaei = json['text_imlaei'];
    verseKey = json['verse_key'];
    pageNumber = json['page_number'];
    lineNumber = json['line_number'];
    audioUrl = json['audio_url'];
    location = json['location'];
    charTypeName = json['char_type_name'];
    codeV1 = json['code_v1'];
    translation = json['translation'] != null ? Translation.fromJson(json['translation']) : null;
    transliteration = json['transliteration'] != null ? Transliteration.fromJson(json['transliteration']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['position'] = position;
    map['text_uthmani'] = textUthmani;
    map['text_indopak'] = textIndopak;
    map['text_imlaei'] = textImlaei;
    map['verse_key'] = verseKey;
    map['page_number'] = pageNumber;
    map['line_number'] = lineNumber;
    map['audio_url'] = audioUrl;
    map['location'] = location;
    map['char_type_name'] = charTypeName;
    map['code_v1'] = codeV1;
    if (translation != null) {
      map['translation'] = translation?.toJson();
    }
    if (transliteration != null) {
      map['transliteration'] = transliteration?.toJson();
    }
    return map;
  }

}

/// text : "bis'mi"
/// language_name : "english"

class Transliteration {
  String? text;
  String? languageName;

  Transliteration({
      this.text, 
      this.languageName});

  Transliteration.fromJson(dynamic json) {
    text = json['text'];
    languageName = json['language_name'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['text'] = text;
    map['language_name'] = languageName;
    return map;
  }

}

/// text : "In (the) name"
/// language_name : "english"

class Translation {
  String? text;
  String? languageName;

  Translation({
      this.text, 
      this.languageName});

  Translation.fromJson(dynamic json) {
    text = json['text'];
    languageName = json['language_name'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['text'] = text;
    map['language_name'] = languageName;
    return map;
  }

}