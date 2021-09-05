/// id : 1
/// verse_number : 1
/// verse_key : "1:1"
/// juz_number : 1
/// hizb_number : 1
/// rub_number : 1
/// sajdah_type : null
/// sajdah_number : null
/// text_uthmani : "بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ"
/// page_number : 1
/// words : [{"id":1,"position":1,"audio_url":"wbw/001_001_001.mp3","char_type_name":"word","code_v1":"ﭑ","page_number":1,"line_number":2,"text":"ﭑ","translation":{"text":"In (the) name","language_name":"english"},"transliteration":{"text":"bis'mi","language_name":"english"}},{"id":2,"position":2,"audio_url":"wbw/001_001_002.mp3","char_type_name":"word","code_v1":"ﭒ","page_number":1,"line_number":2,"text":"ﭒ","translation":{"text":"(of) Allah","language_name":"english"},"transliteration":{"text":"l-lahi","language_name":"english"}},{"id":3,"position":3,"audio_url":"wbw/001_001_003.mp3","char_type_name":"word","code_v1":"ﭓ","page_number":1,"line_number":2,"text":"ﭓ","translation":{"text":"the Most Gracious","language_name":"english"},"transliteration":{"text":"l-raḥmāni","language_name":"english"}},{"id":4,"position":4,"audio_url":"wbw/001_001_004.mp3","char_type_name":"word","code_v1":"ﭔ","page_number":1,"line_number":2,"text":"ﭔ","translation":{"text":"the Most Merciful","language_name":"english"},"transliteration":{"text":"l-raḥīmi","language_name":"english"}},{"id":5,"position":5,"audio_url":null,"char_type_name":"end","code_v1":"ﭕ","page_number":1,"line_number":2,"text":"ﭕ","translation":{"text":"Ayah 1","language_name":"english"},"transliteration":{"text":null,"language_name":"english"}}]
/// audio : {"url":"AbdulBaset/Mujawwad/mp3/001001.mp3","segments":[[0,1,0,960],[1,2,970,1420],[2,3,1430,2670],[3,4,2680,6210]]}

class ChapterVerse {
  int? id;
  int? verseNumber;
  String? verseKey;
  int? juzNumber;
  int? hizbNumber;
  int? rubNumber;
  dynamic? sajdahType;
  dynamic? sajdahNumber;
  String? textUthmani;
  int? pageNumber;
  List<Words>? words;
  Audio? audio;

  ChapterVerse({
      this.id, 
      this.verseNumber, 
      this.verseKey, 
      this.juzNumber, 
      this.hizbNumber, 
      this.rubNumber, 
      this.sajdahType, 
      this.sajdahNumber, 
      this.textUthmani, 
      this.pageNumber, 
      this.words, 
      this.audio});

  ChapterVerse.fromJson(dynamic json) {
    id = json['id'];
    verseNumber = json['verse_number'];
    verseKey = json['verse_key'];
    juzNumber = json['juz_number'];
    hizbNumber = json['hizb_number'];
    rubNumber = json['rub_number'];
    sajdahType = json['sajdah_type'];
    sajdahNumber = json['sajdah_number'];
    textUthmani = json['text_uthmani'];
    pageNumber = json['page_number'];
    if (json['words'] != null) {
      words = [];
      json['words'].forEach((v) {
        words?.add(Words.fromJson(v));
      });
    }
    audio = json['audio'] != null ? Audio.fromJson(json['audio']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['verse_number'] = verseNumber;
    map['verse_key'] = verseKey;
    map['juz_number'] = juzNumber;
    map['hizb_number'] = hizbNumber;
    map['rub_number'] = rubNumber;
    map['sajdah_type'] = sajdahType;
    map['sajdah_number'] = sajdahNumber;
    map['text_uthmani'] = textUthmani;
    map['page_number'] = pageNumber;
    if (words != null) {
      map['words'] = words?.map((v) => v.toJson()).toList();
    }
    if (audio != null) {
      map['audio'] = audio?.toJson();
    }
    return map;
  }

}

/// url : "AbdulBaset/Mujawwad/mp3/001001.mp3"
/// segments : [[0,1,0,960],[1,2,970,1420],[2,3,1430,2670],[3,4,2680,6210]]

class Audio {
  String? url;
  List<dynamic>? segments;

  Audio({
      this.url, 
      this.segments});

  Audio.fromJson(dynamic json) {
    url = json['url'];
    segments = json['segments'] != null ? json['segments']: [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['url'] = url;
    map['segments'] = segments;
    return map;
  }

}

/// id : 1
/// position : 1
/// audio_url : "wbw/001_001_001.mp3"
/// char_type_name : "word"
/// code_v1 : "ﭑ"
/// page_number : 1
/// line_number : 2
/// text : "ﭑ"
/// translation : {"text":"In (the) name","language_name":"english"}
/// transliteration : {"text":"bis'mi","language_name":"english"}

class Words {
  int? id;
  int? position;
  String? audioUrl;
  String? charTypeName;
  String? codeV1;
  int? pageNumber;
  int? lineNumber;
  String? text;
  Translation? translation;
  Transliteration? transliteration;

  Words({
      this.id, 
      this.position, 
      this.audioUrl, 
      this.charTypeName, 
      this.codeV1, 
      this.pageNumber, 
      this.lineNumber, 
      this.text, 
      this.translation, 
      this.transliteration});

  Words.fromJson(dynamic json) {
    id = json['id'];
    position = json['position'];
    audioUrl = json['audio_url'];
    charTypeName = json['char_type_name'];
    codeV1 = json['code_v1'];
    pageNumber = json['page_number'];
    lineNumber = json['line_number'];
    text = json['text'];
    translation = json['translation'] != null ? Translation.fromJson(json['translation']) : null;
    transliteration = json['transliteration'] != null ? Transliteration.fromJson(json['transliteration']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['position'] = position;
    map['audio_url'] = audioUrl;
    map['char_type_name'] = charTypeName;
    map['code_v1'] = codeV1;
    map['page_number'] = pageNumber;
    map['line_number'] = lineNumber;
    map['text'] = text;
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