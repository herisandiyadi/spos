import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:squadra_pos/refactor/data/providers/http/http_contract.dart';
import 'package:squadra_pos/refactor/data/providers/models/api_result.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_exception.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_model.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_parameter.dart';

class HttpNetworkImplementation implements HttpNetwork {
  @override
  Future<http.Response> getResponse({required NetworkModel method}) async {
    var client = http.Client();

    try {
      return await method.when(
        post: (networkParameter) => sendPostRequest(client, networkParameter),
        get: (networkParameter) => sendGetRequest(client, networkParameter),
        put: (networkParameter) => sendPutRequest(client, networkParameter),
      );
    } finally {
      client.close();
    }
  }

  // :: post
  Future<http.Response> sendPostRequest(http.Client client, NetworkParameter networkParameter) async {
    if (containsFile(networkParameter.requestBody)) {
      return await sendMultipartRequest(networkParameter);
    } else {
      return await sendJsonRequest(client, networkParameter);
    }
  }

  Future<http.Response> sendJsonRequest(http.Client client, NetworkParameter networkParameter) async {
    return await client.post(
      Uri.parse(networkParameter.url),
      body: jsonEncode(networkParameter.requestBody),
      headers: {...?networkParameter.header},
    ).timeout(const Duration(seconds: 10));
  }

  Future<http.Response> sendMultipartRequest(NetworkParameter networkParameter) async {
    var request = http.MultipartRequest('POST', Uri.parse(networkParameter.url));

    if (networkParameter.requestBody != null) {
      for (var entry in networkParameter.requestBody!.entries) {
        if (entry.value is File) {
          request.files.add(
            await http.MultipartFile.fromPath(
              entry.key, 
              (entry.value as File).path, 
              filename: getFileName((entry.value as File).path),
            ),
          );
        } else {
          request.fields[entry.key] = entry.value;
        }
      }
    }

    request.headers.addAll({...?networkParameter.header});

    var streamedResponse = await request.send().timeout(const Duration(seconds: 10));

    return await http.Response.fromStream(streamedResponse);
  }

  // :: get
  Future<http.Response> sendGetRequest(http.Client client, NetworkParameter networkParameter) async {
    return await client.get(
      Uri.parse(networkParameter.url).replace(queryParameters: networkParameter.queryParameter), headers: {...?networkParameter.header},
    ).timeout(const Duration(seconds: 10));
  }

  // :: put
  Future<http.Response> sendPutRequest(http.Client client, NetworkParameter networkParameter) async {
    if (containsFile(networkParameter.requestBody)) {
      return await sendBinaryPutRequest(client, networkParameter);
    } else {
      return await sendJsonPutRequest(client, networkParameter);
    }
  }

  Future<http.Response> sendBinaryPutRequest(http.Client client, NetworkParameter networkParameter) async {
    final Map<String, dynamic>? body = networkParameter.requestBody;

    if (body == null || body["image"] == null) throw Exception("Request body atau image tidak boleh null");

    final File file = body["image"];
    final Uint8List fileBytes = await file.readAsBytes();
    
    return client.put(
      Uri.parse(networkParameter.url),
      body: fileBytes,
      headers: {...?networkParameter.header},
    ).timeout(const Duration(seconds: 10));
  }

  Future<http.Response> sendJsonPutRequest(http.Client client, NetworkParameter networkParameter) async {
    return await client.put(
      Uri.parse(networkParameter.url),
      body: jsonEncode(networkParameter.requestBody),
      headers: {...?networkParameter.header},
    ).timeout(const Duration(seconds: 10));
  }
  
  String getFileName(String filePath) {
    return filePath.split('/').last;
  }

  bool containsFile(Map<String, dynamic>? requestBody) {
    if (requestBody == null) return false;

    return requestBody.values.any((value) => value is File);
  }

  @override
  bool validStatusCode(int statusCode) {
    return statusCode >= 200 && statusCode < 300;
  }

  @override
  ApiResult unknownException = const ApiResult.failure(networkException: NetworkException.unknownException());
}