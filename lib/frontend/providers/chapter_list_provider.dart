

import 'package:quran_app/backend/services/implementation/index.dart';
import 'package:quran_app/utils/base_provider.dart';
import 'package:quran_app/backend/models/quran_chapter.dart';

class ChapterListProvider extends BaseProvider {

  List<QuranChapter> chapters = [];

  ChapterListProvider() {
    initialize();
  }

  void initialize() async {
    try {
      backToLoading(msg: 'Loading...');
      chapters = await quranServiceApi.getListOfChapters();
      print(chapters);
      backToLoaded();
    } catch (error) {
      backToFailed(msg: "Error: $error");
      rethrow;
    }
  }
}