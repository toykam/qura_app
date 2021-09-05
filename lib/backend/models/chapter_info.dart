/// id : 1
/// chapter_id : 1
/// language_name : "english"
/// short_text : "This Surah is named Al-Fatihah because of its subject-matter. Fatihah is that which opens a subject or a book or any other thing. In other words, Al-Fatihah is a sort of preface."
/// source : "Sayyid Abul Ala Maududi - Tafhim al-Qur'an - The Meaning of the Quran"
/// text : "<h2>Name</h2>\r\n<p>This Surah is named Al-Fatihah because of its subject-matter. Fatihah is that which opens a subject or a book or any other thing. In other words, Al-Fatihah is a sort of preface.</p>\r\n<h2>Period of Revelation</h2>..."

class ChapterInfo {
  int? id;
  int? chapterId;
  String? languageName;
  String? shortText;
  String? source;
  String? text;

  ChapterInfo({
      this.id, 
      this.chapterId, 
      this.languageName, 
      this.shortText, 
      this.source, 
      this.text});

  ChapterInfo.fromJson(dynamic json) {
    id = json['id'];
    chapterId = json['chapter_id'];
    languageName = json['language_name'];
    shortText = json['short_text'];
    source = json['source'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['chapter_id'] = chapterId;
    map['language_name'] = languageName;
    map['short_text'] = shortText;
    map['source'] = source;
    map['text'] = text;
    return map;
  }

}