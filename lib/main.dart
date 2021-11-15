// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'ApiService.dart';
import 'Registro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'RegistroCovid App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        home: const Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiService service = ApiService();
  late Future<List<Registro>> futureAlbums;

  @override
  void initState() {
    super.initState();
    futureAlbums = service.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Vacunados'),
        leading: IconButton(icon: Icon(Icons.search), onPressed: () {},),
        
        
      ),
      body: Center(
          child: FutureBuilder<List<Registro>>(
              future: futureAlbums,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Carnet: ' +
                            snapshot.data[index].carnet.toString()),
                        subtitle: Text('Nombre completo: ' +
                            snapshot.data[index].nombreCompleto.toString() +
                            '\n' +
                            snapshot.data[index].vacuna.toString()),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text('Ocurrio un error: ${snapshot.error}'));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
