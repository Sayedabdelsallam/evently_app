import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/event_model.dart';

abstract class FirebaseFirestoreService
{
  /// Firebase FireStore

  static CollectionReference<EventDataModel> getCollectionRef() {
    return FirebaseFirestore.instance
        .collection(EventDataModel.collectionName)
        .withConverter<EventDataModel>(
      fromFirestore: (snapshot, _) =>
          EventDataModel.fromFirestore(snapshot.data()!),
      toFirestore: (eventModel, _) => eventModel.toFirestore(),
    );
  }

  static Future<bool> createNewEvent(EventDataModel eventData) async {
    try
    {
      var collectionRef = getCollectionRef();
      var docRef = collectionRef.doc();
      eventData.eventID = docRef.id;
      docRef.set(eventData);
      return Future.value(true);
    } catch(e)
    {
      return Future.value(false);
    }
  }

  readEvents() async {
    final collectionRef = getCollectionRef();
    return collectionRef.get();
  }

  static Future<List<EventDataModel>> getDataFromFirestore() async
  {
    var collectionRef = getCollectionRef();
    QuerySnapshot<EventDataModel> data = await collectionRef.get();

    List<EventDataModel> eventDataList = data.docs.map((element)
    {
     return element.data();
    }).toList();
    return eventDataList;
  }

  static Stream<QuerySnapshot<EventDataModel>>  getStreamDataFromFirestore(String categoryName)
  {
    var collectionRef = getCollectionRef().where(
      'eventCategory' , isEqualTo: categoryName ,
    );
    return collectionRef.snapshots();
  }

  static Stream<QuerySnapshot<EventDataModel>>  getStreamFavouriteData()
  {
    var collectionRef = getCollectionRef().where(
      'isFavorite' , isEqualTo: true ,
    );
    return collectionRef.snapshots();
  }

  static Future<bool> deleteEvent(EventDataModel eventData) async {
    try {
      var collectionRef = getCollectionRef();
      var docRef = collectionRef.doc(eventData.eventID);

      // التأكد من أن الوثيقة موجودة قبل حذفها
      var docSnapshot = await docRef.get();
      if (!docSnapshot.exists) {
        print('Error: Document does not exist.');
        return false;
      }

      await docRef.delete();
      return true;
    } catch (e) {
      print('Error deleting event: $e');
      return false;
    }
  }


  static Future<bool> updateEvent(EventDataModel eventData) async {
    try {
      var collectionRef = getCollectionRef();
      var docRef = collectionRef.doc(eventData.eventID);

      // Check if document exists before updating
      var docSnapshot = await docRef.get();
      if (!docSnapshot.exists) {
        print('Document does not exist.');
        return false;  // Document does not exist, return false
      }

      // Update the document
      await docRef.update(eventData.toFirestore());

      // If no error occurred, return true
      return true;
    } catch (e) {
      // Log the error for debugging
      print('Error updating event: $e');
      return false;
    }
  }


}