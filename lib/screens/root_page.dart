import 'package:flutter/material.dart';
import 'package:note_app_bloc/main.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late final NamesCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = NamesCubit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomeScreen")),
      body: StreamBuilder<String?>(
        stream: cubit.stream,
        // initialData: initialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final button = TextButton(
              onPressed: () {
                cubit.pickRandomName();
              },
              child: Text("pick a random name"));
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return button;
            case ConnectionState.waiting:
              return button;
            case ConnectionState.active:
              return Column(
                children: [
                  Text(
                    snapshot.data ?? "",
                  ),
                  button,
                ],
              );

            case ConnectionState.done:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
