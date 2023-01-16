import 'package:bloc_demo/bloc/user_bloc.dart';
import 'package:bloc_demo/bloc/user_event.dart';
import 'package:bloc_demo/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            UserBloc(RepositoryProvider.of(context))..add(GetUser()),
        child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoading) {
                return const CircularProgressIndicator();
              }

              if (state is UserLoaded) {
                var data = state.userList;
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(data[index].image!),
                        ),
                        title: Text(data[index].name!),
                      );
                    });
              }

              if (state is UserLoadingError) {
                return Center(
                  child: Text(state.error),
                );
              }
              return Container();
            },
          ),
        ));
  }
}
