# 파이어 스토어 쿼리문
```dart
await firestore.collection('collection_Name').add({"" : ""});
await firestore.collection('collection_Name').get();
await firestore.collection("collection_Name").where().get();
await firestore.collection("collection_Name").doc("document_Id").update({"" : ""});
await firestore.collection("collection_Name").doc("document_Id").delete();
```