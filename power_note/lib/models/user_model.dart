import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class User extends Equatable {
   String uid;
  String name;
   String email;
   String password;
  User({
    
  required this.uid, 
  required this.name,
  required this.email,
  required this.password});

  @override
  List<Object?> get props => [uid, name, email, password];
}
