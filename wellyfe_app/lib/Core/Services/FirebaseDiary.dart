import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDiary {
  final fireStoreInstance = FirebaseFirestore.instance;
  final firebaseUser =  FirebaseAuth.instance.currentUser;

  Future<void> getMonthlyDiaryData(context, int month, int year) async {

    fireStoreInstance
        .collection("diaries")
        .doc(firebaseUser!.uid)
        .collection("diary")
        .where("date", isGreaterThanOrEqualTo: DateTime(year, month).toString())
        .where("date", isLessThan: DateTime(year, month + 1).toString())
        .get()
        .then((value) {
          value.docs.forEach((result) {

            print(result.data());

            // Timestamp timestamp = result.data()["date"];
            //
            // diaryDataList.add(
            //     Diary(
            //       result.id,
            //       result.data()["title"],
            //       result.data()["content"],
            //       result.data()["mood"],
            //       result.data()["weather"],
            //       result.data()["image"],
            //       result.data()["favourite"],
            //       timestamp.toDate(),
            //     )
            // );

          });

          // diaryDataList.sort((a, b) => a.dateTime.compareTo(b.dateTime));
          //
          // Provider
          //   .of<DiaryProvider>(context, listen: false)
          //   .setDiaryList(diaryDataList);
    });
  }
}