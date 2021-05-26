import 'package:flutter/material.dart';
import 'package:graph_ql_tutorial/myapp.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  runApp(MyApp());
}
