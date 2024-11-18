part of 'authentication_bloc.dart';

enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final User? user;

  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user,
  });

  // No information about the user
  const AuthenticationState.unknown() : this._();
  // User is authenticated
  const AuthenticationState.authenticated(User user): this._(status: AuthenticationStatus.authenticated, user: user); 
  // User is not authenticated
  const AuthenticationState.unauthenticated(): this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [status, user];
}