/// url : "AbdulBaset/Mujawwad/mp3/001001.mp3"
/// segments : [[0,1,0,960],[1,2,970,1420],[2,3,1430,2670],[3,4,2680,6210]]

class VerseAudio {
  String? url;
  List<List<int>>? segments;

  VerseAudio({
      this.url, 
      this.segments});

  VerseAudio.fromJson(dynamic json) {
    url = json['url'];
    segments = json['segments'] != null ? json['segments'].cast<int>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['url'] = url;
    map['segments'] = segments;
    return map;
  }

}