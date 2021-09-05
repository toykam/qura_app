

import 'package:quran_app/backend/models/quran_chapter.dart';
import 'package:quran_app/backend/models/chapter_info.dart';
import 'package:quran_app/backend/models/chapter_verse.dart';

abstract class QuranService {

  // Chapter API
  Future<List<QuranChapter>> getListOfChapters();
  Future<QuranChapter> getChapter(int chapterId, {String language});
  Future<ChapterInfo> getChapterInfo(int chapterId, {String language});

  // Verses API
  Future<List<ChapterVerse>> getVersesByChapter(int chapterId, {String language, bool word});

}