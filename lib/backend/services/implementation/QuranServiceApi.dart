
import 'package:quran_app/backend/models/chapter_info.dart';
import 'package:quran_app/backend/models/chapter_verse.dart';
import 'package:quran_app/backend/models/quran_chapter.dart';
import 'package:quran_app/backend/services/implementation/api_service.dart';
import 'package:quran_app/backend/services/quran_service.dart';
import 'package:quran_app/utils/constants/end_points.dart';

class QuranServiceApi implements QuranService {

  late ApiService _apiService;


  QuranServiceApi(ApiService apiService) {
    _apiService = apiService;
  }

  @override
  Future<QuranChapter> getChapter(int chapterId, {String? language}) async {
    // TODO: implement getChapter
    throw UnimplementedError();
  }

  @override
  Future<ChapterInfo> getChapterInfo(int chapterId, {String? language}) async {
    // TODO: implement getChapterInfo
    throw UnimplementedError();
  }

  @override
  Future<List<QuranChapter>> getListOfChapters() async {
    ApiResponse response = await _apiService.makeGetRequest(GET_LIST_OF_CHAPTER_ENDPOINT);
    return List.from(response.data['chapters']).map((e) => QuranChapter.fromJson(e)).toList();
  }

  @override
  Future<List<ChapterVerse>> getVersesByChapter(int chapterId, {String language = 'en', bool word = true}) async {
    ApiResponse response = await _apiService.makeGetRequest(GET_VERSES_BY_CHAPTER_ENDPOINT+'$chapterId?words=$word&language=$language&audio=1&per_page=50&fields=text_uthmani');
    return List.from(response.data['verses']).map((e) => ChapterVerse.fromJson(e)).toList();
  }

}