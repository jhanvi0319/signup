part of 'homepage_bloc.dart';

@immutable
abstract class HomepageEvent {}

class SendData extends HomepageEvent {
  final String mobile;
  final String firstName;
  final String lastName;
  final String password;
  final String email;

  SendData(
    this.mobile,
    this.firstName,
    this.lastName,
    this.password,
    this.email,
  );
}
