import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:swishapp/config/server_addresses.dart';
import 'package:swishapp/data/model/filter_rules.dart';
import 'package:swishapp/data/model/sort_rules.dart';
import 'package:swishapp/data/error/exceptions.dart';

class NetworkRequest {
  static const STATUS_OK = 200;
  static const STATUS_CREATED = 201;

  final Map<String, String> _jsonHeaders = {'content-type': 'application/json'};

  final http.Client client;
  final RequestType type;
  final String address;
  final Map<String, dynamic> body;
  Map<String, String> headers;
  final List<int> listBody;
  final String plainBody;

  NetworkRequest(this.type, this.address,
      {@required this.client,
      this.body,
      this.plainBody,
      this.listBody,
      this.headers});

  Future<http.Response> getResult() async {
    print('ADDRESS: $address');
    if (listBody != null) {
      print('listBody: ${jsonEncode(listBody)}');
    }
    if (plainBody != null) {
      print('plainBody: $plainBody');
    }
    if (body != null) {
      print('body: ${jsonEncode(body)}');
    }
    http.Response response;
    headers ??= _jsonHeaders;
    try {
      switch (type) {
        case RequestType.post:
          response = await client.post(
            address,
            headers: headers,
            body: jsonEncode(body) ?? plainBody ?? listBody,
          );
          break;
        case RequestType.get:
          response = await client.get(address, headers: headers);
          break;
        case RequestType.put:
          response = await client.put(address,
              body: body ?? plainBody ?? listBody, headers: headers);
          break;
        case RequestType.delete:
          response = await client.delete(address, headers: headers);
          break;
      }
      print('RESULT: ${response.body}');
      if (response.statusCode != STATUS_OK) {
        throw HttpRequestException();
      }
      return response;
    } catch (exception) {
      if (exception is HttpRequestException) {
        rethrow;
      } else {
        throw RemoteServerException();
      }
    }
  }

  factory NetworkRequest.productList(
      http.Client client,
      int pageIndex,
      int pageSize,
      int categoryId,
      FilterRules filterRules,
      SortRules sortRules) {
    List<String> parameters = [];
    if (pageIndex != null) {
      parameters.add('page=${pageIndex + 1}');
    }
    if (pageSize != null) {
      parameters.add('per_page=$pageSize');
    }
    if (categoryId != null) {
      parameters.add('category=$categoryId');
    }
    if (sortRules != null) {
      parameters.add('orderby=${sortRules.jsonRuleName}');
      parameters.add('order=${sortRules.jsonOrder}');
    }
    //TODO add filter rules here
    final serverAddress =
        ServerAddresses.serverAddress + '?' + parameters.join('&');
    return NetworkRequest(
      RequestType.get,
      serverAddress,
      client: client,
    );
  }
}

enum RequestType {
  post,
  get,
  put,
  delete,
}
