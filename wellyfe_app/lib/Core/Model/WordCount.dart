import 'package:sortedmap/sortedmap.dart';
import 'package:wellyfe_app/Core/Model/Diary.dart';

class WordCount {
  bool rotate;
  double size;

  WordCount(this.rotate, this.size);

  static Map<String, int> wordCloud = SortedMap(Ordering.byValue());

  static void getCloudText() {
    wordCloud = SortedMap(Ordering.byValue());
    Diary.diaryDataList.forEach((element) {
      String word = "";
      for (var i = 0; i < element.content.length; i++) {

        if (containSymbol(element.content[i])) {
          if (!wordCloud.containsKey(word))
            wordCloud[word] = 1;
          else
            wordCloud[word] = wordCloud[word]! + 1;

          word = "";
        }

        else
          word += element.content[i].toLowerCase();
      }
    });

  }

  static bool containSymbol(String string) {
    if (string == "." || string == "," || string == "?" || string == "!" || string == " ")
      return true;
    return false;
  }
}