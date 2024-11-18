part of 'my_user_bloc.dart';

enum MyUserStatus {sucess, loading, failure}

class MyUserState extends Equatable {
  final MyUserStatus status;
  final MyUser? user;

  const MyUserState._({
    this.status = MyUserStatus.loading,
    this.user,
  });

  const MyUserState.loading() : this._();
  const MyUserState.sucess(MyUser user): this._(status: MyUserStatus.sucess, user: user);
  const MyUserState.failure() : this._(status: MyUserStatus.failure);

  @override
  List<Object?> get props => [status, user];
}