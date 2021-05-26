import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graph_ql_tutorial/graphql.dart';
import 'package:graph_ql_tutorial/query.dart';
import 'dart:convert';


class MyApp extends StatelessWidget {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphQLConfiguration.initailizeClient(),
      child: CacheProvider(
        child: MaterialApp(
          home: Scaffold(
            body: Center(
              child: Container(
                color: Colors.blueAccent,
                child: FlatButton(
                  child: Text("Get OTP"),
                  onPressed: (){
                    sendOtp("9846794542");
                  },

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}









void sendOtp(String mobile) async {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueryMutation addMutation = QueryMutation();
  GraphQLClient _client = graphQLConfiguration.clientToQuery();
  QueryResult result = await _client.mutate(
    MutationOptions(
        document: gql(addMutation.getOTP()), variables: {'phone': mobile}),
  );


  if (result.hasException) {
    print("Somme error happen");
  } else {
    print(jsonEncode(result.data));
  }
}

