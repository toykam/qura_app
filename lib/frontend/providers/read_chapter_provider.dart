

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/backend/models/quran_chapter.dart';
import 'package:quran_app/backend/services/implementation/index.dart';
import 'package:quran_app/utils/base_provider.dart';
import 'package:quran_app/backend/models/chapter_verse.dart';
import 'package:quran_app/utils/constants/end_points.dart';

enum PlayState {Loading, Idle, Buffering, Ready, Completed}

class ReadChapterProvider extends BaseProvider {
  late QuranChapter _chapter;
  late List<ChapterVerse> verses;
  late AudioPlayer versePlayer;
  late AudioPlayer allVersePlayer;
  late AudioPlayer verseWordPlayer;
  late ScrollController scrollController;
  int? currentAyahIndex;
  int? playedVerse;

  PlayState allVersePlayerState = PlayState.Loading;
  bool allVersePlaying = false;
  bool versePlaying = false;
  bool _wasPlaying = false;


  QuranChapter get chapter => _chapter;

  ReadChapterProvider(QuranChapter chapter)  {
    _chapter = chapter;
    versePlayer = AudioPlayer();
    allVersePlayer = AudioPlayer();
    verseWordPlayer = AudioPlayer();
    scrollController = ScrollController(initialScrollOffset: 0);
    initialize();
    // initializePlayList();
  }

  void initializeListeners() async {
    allVersePlayer.playerStateStream.listen((event) {
      print("It is playing: $event");
      allVersePlaying = event.playing;
      if (event.processingState == ProcessingState.buffering) {
        allVersePlayerState = PlayState.Buffering;
      }
      if (event.processingState == ProcessingState.loading) {
        allVersePlayerState = PlayState.Loading;
      }
      if (event.processingState == ProcessingState.ready) {
        allVersePlayerState = PlayState.Ready;
      }
      if (event.processingState == ProcessingState.completed) {
        allVersePlayer.seek(Duration.zero, index: 0);
        scrollController.animateTo(0, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
        allVersePlayerState = PlayState.Completed;
        allVersePlayer.pause();
      }
      notifyListeners();
    });

    allVersePlayer.currentIndexStream.listen((event) {
      currentAyahIndex = event;
      if (allVersePlaying && allVersePlayerState != PlayState.Completed) {
        scrollController.animateTo((scrollController.initialScrollOffset) + currentAyahIndex! * 300, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
      notifyListeners();
    });

    versePlayer.playerStateStream.listen((event) {
      print("Verse player is playing: $event");
      versePlaying = event.playing;
      if (event.processingState == ProcessingState.completed) {
        if (_wasPlaying) {
          _wasPlaying = false;
          playAllVerse();
        }
        versePlayer.seek(Duration.zero);
        versePlayer.pause();
        notifyListeners();
      }
    });
    // notifyListeners();
  }

  void initializePlayList() async {
    await allVersePlayer.setAudioSource(
      ConcatenatingAudioSource(
        // Start loading next item just before reaching it.
        useLazyPreparation: true, // default
        // Customise the shuffle algorithm.
        shuffleOrder: DefaultShuffleOrder(), // default
        // Specify the items in the playlist.
        children: [
          ...verses.map((e) => AudioSource.uri(Uri.parse("$VERSE_AUDIO_FILE_END_POINT${e.audio!.url}")),)
        ],
      ),
      // Playback will be prepared to start from track1.mp3
      initialIndex: 0, // default
      // Playback will be prepared to start from position zero.
      initialPosition: Duration.zero, // default
    );
  }

  void playAllVerse() async {
    if (allVersePlayer.playing) {
      currentAyahIndex = allVersePlayer.currentIndex;
      notifyListeners();
      await allVersePlayer.pause();
    } else {
      if (allVersePlayer.processingState == ProcessingState.completed) {
        allVersePlayer.seek(Duration.zero, index: 0);
        currentAyahIndex = 0;
        notifyListeners();
        // allVersePlayer.stop();
      }
      await allVersePlayer.play();
    }
  }

  void playVerse(versePath, index) async {
    // is it the current playing verse that was clicked?
    print("Selected: $index Played: $playedVerse $currentAyahIndex");
    if(allVersePlayer.playing) {
      _wasPlaying = true;
      playAllVerse();
    }
    if (index == playedVerse) {
      print('Previous one');

      if (versePlayer.playing) {
        print('Previous one noe paused');
        await versePlayer.pause();
      } else {
        versePlayer.seek(Duration.zero);
        print('Previous one now want to play');
        await versePlayer.play();
      }
    } else {
      playedVerse = index;
      currentAyahIndex = index - 1;
      print("Selected: $index Played: $playedVerse CurrentAyah $currentAyahIndex");
      notifyListeners();
      await versePlayer.setUrl(versePath);
      await versePlayer.play();
    }
  }

  void initialize() async {
    try {
      backToLoading(msg: 'Getting chapter verse');
      verses = await quranServiceApi.getVersesByChapter(_chapter.id!);
      initializePlayList();
      initializeListeners();
      backToLoaded();
    } catch (error) {
      backToFailed(msg: 'Error: $error');
      rethrow;
    }
  }

  @override
  void dispose() {
    allVersePlayer.dispose();
    versePlayer.dispose();
    verseWordPlayer.dispose();
    super.dispose();
  }
}