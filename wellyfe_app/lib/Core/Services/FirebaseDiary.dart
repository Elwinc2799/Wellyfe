import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:wellyfe_app/Core/Model/Diary.dart';
import 'package:wellyfe_app/Core/Providers/DiaryProvider.dart';

class FirebaseDiary {
  final fireStoreInstance = FirebaseFirestore.instance;
  final firebaseUser =  FirebaseAuth.instance.currentUser;

  Future<void> getMonthlyDiaryData(context, int month, int year) async {
    List<Diary> diaryDataList = [];

    fireStoreInstance
        .collection("diaries")
        .doc(firebaseUser!.uid)
        .collection("diary")
        .where("date", isGreaterThanOrEqualTo: DateTime.utc(year, month, 1))
        .where("date", isLessThanOrEqualTo: DateTime.utc(year, month + 1, 1))
        .get()
        .then((value) {
          value.docs.forEach((result) {
            Timestamp timestamp = result.data()["date"];

            diaryDataList.add(
                Diary(
                  result.id,
                  result.data()["title"],
                  result.data()["content"],
                  result.data()["mood"],
                  result.data()["weather"],
                  result.data()["image"],
                  result.data()["favourite"],
                  timestamp.toDate(),
                )
            );

          });

          diaryDataList.sort((a, b) => a.dateTime.compareTo(b.dateTime));

           Provider
            .of<DiaryProvider>(context, listen: false)
            .setMonthlyDiaryList(diaryDataList);
    });
  }

  Future<int> getUniqueDiaryData(context, int month, int year) async {
    List<DateTime> unique = [];
    var map = Map();

    int length = await fireStoreInstance
        .collection("diaries")
        .doc(firebaseUser!.uid)
        .collection("diary")
        .where("date", isGreaterThanOrEqualTo: DateTime.utc(year, month, 1))
        .where("date", isLessThanOrEqualTo: DateTime.utc(year, month + 1, 1))
        .get()
        .then((value) {
          value.docs.forEach((result) {
            Timestamp timestamp = result.data()["date"];
            unique.add(timestamp.toDate());
          });

         unique.forEach((element) {
          if(!map.containsKey(element.day)) {
            map[element.day] = 1;
          } else {
            map[element.day] += 1;
          }
        });

         return map.length;
    });

    return length;
  }
}