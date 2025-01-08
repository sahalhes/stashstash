import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _supabase = supabase.Supabase.instance.client;
  User? _currentUser;
  bool _isLoading = false;

  AuthService() {
    _initializeAuth();
  }

  bool get isLoading => _isLoading;
  User? get currentUser => _currentUser;

  Future<void> _initializeAuth() async {
    _auth.authStateChanges().listen((user) async {
      _currentUser = user;
      if (user != null) {
        await syncUserWithSupabase(user);
      }
      notifyListeners();
    });
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      _isLoading = true;
      notifyListeners();

      // Begin Google Sign In
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      // Get auth details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create Firebase credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase
      final userCredential = await _auth.signInWithCredential(credential);

      // Save auth state
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      return userCredential;
    } catch (e) {
      print('Error signing in with Google: $e');
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> syncUserWithSupabase(User firebaseUser) async {
    try {
      await _supabase.from('users').upsert({
        'id': firebaseUser.uid,
        'email': firebaseUser.email,
        'username':
            firebaseUser.displayName ?? firebaseUser.email?.split('@')[0],
        'profile_image_url': firebaseUser.photoURL,
        'auth_provider': 'google',
        'updated_at': DateTime.now().toIso8601String(),
      }).execute();
    } catch (e) {
      print('Error syncing with Supabase: $e');
    }
  }

  Future<void> signOut() async {
    try {
      _isLoading = true;
      notifyListeners();

      await Future.wait([
        _auth.signOut(),
        _googleSignIn.signOut(),
      ]);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
