import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_app/Model/api_model.dart';

final apiUrl = 'https://api.publicapis.org/entries';

Future<ApiModel> fetchApiModel() async {
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    print('api = hit');
    return ApiModel.fromJson(jsonData);
  } else {
    throw Exception('Failed to load data from API');
  }
}

class ApiScreen extends StatelessWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('API Screen'),
        ),
        body: Column(
          children: [
            FutureBuilder<ApiModel>(
                future: fetchApiModel(),
                builder: (context,snapshot){
                  //final apiModel = snapshot.data!;
                  if(snapshot.hasData)
                    {
                      final apiModel = snapshot.data!;
                      return Expanded(
                        child: ListView.builder(
                            itemCount: apiModel.entries?.length,
                            itemBuilder: (context,index){
                              final entry = apiModel.entries![index];

                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Card(
                                    elevation: 5,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Api'),
                                            Text(entry?.api ?? ' '),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text('LINK : '),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Wrap(
                                              spacing: 0.0,
                                              runSpacing: 0.0,
                                              children: [
                                                Text(
                                                  entry?.link ?? ' ',
                                                  style: TextStyle(
                                                    fontSize:16,
                                                    color: Colors.blue,
                                                    decoration: TextDecoration.underline,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Category'),
                                            Text(entry?.category ?? ' '),
                                          ],
                                        ),
                                      ],
                                    )
                                ),
                              );
                            }
                        ),
                      );
                    }
                  else
                    {
                      return Column(
                       children: [
                         SizedBox(height: 300,),
                          Center(
                            child: Container(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                strokeWidth: 4.0,
                              ),
                            ),
                          ),
                        ],
                      );

                    }

                },
            ),
          ],
        ),
      ),
    );
  }
}
