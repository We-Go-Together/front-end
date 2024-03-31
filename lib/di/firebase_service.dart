import 'package:firebase_core/firebase_core.dart';
import 'package:herewego/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  static Future<FirebaseService> init() async {

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );

    return FirebaseService();
  }

  FirebaseAuth get auth => FirebaseAuth.instance;

  FirebaseDatabase get database => FirebaseDatabase.instance;
}