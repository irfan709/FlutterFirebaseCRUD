import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/crudappcubit/crudfirebase/crudfirebase_cubit.dart';
import 'package:flutter_firebase/model/user.dart';
import 'crudappbloc/firebasecrud/firebasecrud_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Demo'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // BlocProvider.of<FirebasecrudBloc>(context).add(CreateDataEvent(
                //     User(username: "Mittu", email: "mittu@gmail.com")));

                BlocProvider.of<CrudfirebaseCubit>(context).createData(
                    User(username: "Mittu", email: "mittu@gmail.com"));
              },
              child: Text('Add Data'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                elevation: 10,
              ),
            ),
            SizedBox(height: 20),
            // BlocBuilder<FirebasecrudBloc, FirebasecrudState>(
            //   builder: (context, state) {
            //     if (state is FirebasecrudLoading) {
            //       return Center(child: CircularProgressIndicator());
            //     } else if (state is FirebasecrudFailure) {
            //       return Center(child: Text('Something went wrong...'));
            //     } else if (state is FirebasecrudLoaded) {
            //       final users = state.users;
            //       return users.isEmpty
            //           ? Center(
            //               child: Text('No Data'),
            //             )
            //           : Padding(
            //               padding: EdgeInsets.all(10),
            //               child: Column(
            //                 children: users.map((user) {
            //                   return ListTile(
            //                     leading: GestureDetector(
            //                       onTap: () {
            //                         BlocProvider.of<FirebasecrudBloc>(context)
            //                             .add(DeleteDataEvent(user.id!));
            //                       },
            //                       child: Icon(Icons.delete),
            //                     ),
            //                     trailing: GestureDetector(
            //                       onTap: () {
            //                         BlocProvider.of<FirebasecrudBloc>(context)
            //                             .add(UpdateDataEvent(User(
            //                           id: user.id,
            //                           username: "AAA",
            //                           email: "aaa@gmail.com",
            //                         )));
            //                       },
            //                       child: Icon(Icons.update),
            //                     ),
            //                     title: Text(user.username!),
            //                     subtitle: Text(user.email!),
            //                   );
            //                 }).toList(),
            //               ),
            //             );
            //     } else {
            //       return Container(); // Handle other states if necessary
            //     }
            //   },
            // )

            BlocBuilder<CrudfirebaseCubit, CrudfirebaseState>(
              builder: (context, state) {
                if (state is CrudfirebaseLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is CrudfirebaseFailure) {
                  return Center(child: Text('Something went wrong...'));
                } else if (state is CrudfirebaseLoaded) {
                  final users = state.users;
                  return users.isEmpty
                      ? Center(
                          child: Text('No Data'),
                        )
                      : Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: users.map((user) {
                              return ListTile(
                                leading: GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<CrudfirebaseCubit>(context)
                                        .deleteData(user.id!);
                                  },
                                  child: Icon(Icons.delete),
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<CrudfirebaseCubit>(context)
                                        .updateData(User(
                                            id: user.id,
                                            username: "AAA",
                                            email: "aaa@gmail.com"));
                                  },
                                  child: Icon(Icons.update),
                                ),
                                title: Text(user.username!),
                                subtitle: Text(user.email!),
                              );
                            }).toList(),
                          ),
                        );
                } else {
                  return Container(); // Handle other states if necessary
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
