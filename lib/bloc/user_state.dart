import 'dart:html';

import 'package:bloc_demo/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UserState extends Equatable {}

class UserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoaded extends UserState {
  List<User> userList;
  UserLoaded(this.userList);

  @override
  List<Object?> get props => [];
}

class UserLoadingError extends UserState {
  String error;
  UserLoadingError(this.error);

  @override
  List<Object?> get props => [error];
}
