import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get the collection
  final CollectionReference data =
      FirebaseFirestore.instance.collection("data");

  // final CollectionReference company =
  //     FirebaseFirestore.instance.collection("company");
  //create : add a note
  Future<void> addUser(
    String name,
    String email,
    String mobile,
    String age,
    String jobDiscription,
    String salary,
    String category,
  ) {
    return data.add({
      'Name': name,
      'Email': email,
      'Mobile': mobile,
      'Age': age,
      'Job Discription': jobDiscription,
      'Salary': salary,
      'Category': category,
    });
  }

  Future<void> addCompany(
    String companyName,
    String companyEmail,
    String companyMobile,
    String companyAddress,
    String companyDiscription,
    String category,
  ) {
    return data.add({
      'Company Name': companyName,
      'Company Email': companyEmail,
      'Company Mobile': companyMobile,
      'Company Address': companyAddress,
      'Company Discription': companyDiscription,
      'Category': category,
    });
  }

  //read : display the note
  Stream<QuerySnapshot> getUserStream() {
    final userStream = FirebaseFirestore.instance
        .collection('data')
        .orderBy('Name', descending: true)
        .snapshots();

    return userStream;
  }

  Stream<QuerySnapshot> getCompanyStream() {
    final companyStream = FirebaseFirestore.instance
        .collection('data')
        .orderBy('Company Name', descending: true)
        .snapshots();

    return companyStream;
  }

  //DataStream
  Stream<QuerySnapshot> getDataStream() {
    final dataStream = FirebaseFirestore.instance
        .collection('data')
        .orderBy('Name' ?? 'Company Name', descending: true)
        .snapshots();

    return dataStream;
  }

  //update : update the note
  Future updateUser({
    required String docID,
    required Map<String, dynamic> updatedInfo,
  }) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(docID)
        .update(updatedInfo);
  }

  Future updateCompany({
    required String docID,
    required Map<String, dynamic> updatedInfo,
  }) async {
    await FirebaseFirestore.instance
        .collection('company')
        .doc(docID)
        .update(updatedInfo);
  }

  //Delete
  Future deleteCustomer({
    required String docID,
  }) async {
    await FirebaseFirestore.instance.collection('users').doc(docID).delete();
  }

  Future deleteCompany({
    required String docID,
  }) async {
    await FirebaseFirestore.instance.collection('company').doc(docID).delete();
  }
}
