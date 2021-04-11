import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:mockito/mockito.dart';
import 'package:sil_feed/src/domain/value_objects/constants.dart';

R provideMockedNetworkImages<R>(
  R Function() body,
) {
  return HttpOverrides.runZoned(
    body,
    createHttpClient: (_) => createMockImageHttpClient(),
  );
}

class MockHttpClient extends Mock implements HttpClient {
  @override
  Future<HttpClientRequest> getUrl(Uri? url) async {
    return super.noSuchMethod(
      // ignore: always_specify_types
      Invocation.method(#getUrl, [url]),
      returnValue: Future<HttpClientRequest>.value(
        MockHttpClientRequest(),
      ),
    ) as Future<HttpClientRequest>;
  }
}

class MockHttpClientRequest extends Mock implements HttpClientRequest {
  @override
  HttpHeaders get headers => super.noSuchMethod(Invocation.getter(#headers),
      returnValue: MockHttpHeaders()) as HttpHeaders;

  @override
  Future<HttpClientResponse> close() =>
      // ignore: always_specify_types
      super.noSuchMethod(Invocation.method(#close, []),
              returnValue:
                  Future<HttpClientResponse>.value(MockHttpClientResponse()))
          as Future<HttpClientResponse>;
}

class MockHttpClientResponse extends Mock implements HttpClientResponse {
  @override
  HttpClientResponseCompressionState get compressionState =>
      super.noSuchMethod(Invocation.getter(#compressionState),
              returnValue: HttpClientResponseCompressionState.notCompressed)
          as HttpClientResponseCompressionState;

  @override
  int get contentLength =>
      super.noSuchMethod(Invocation.getter(#contentLength), returnValue: 0)
          as int;

  @override
  int get statusCode =>
      super.noSuchMethod(Invocation.getter(#statusCode), returnValue: 0) as int;

  @override
  StreamSubscription<List<int>> listen(void Function(List<int>)? onData,
          {Function? onError, void Function()? onDone, bool? cancelOnError}) =>
      super.noSuchMethod(
              // ignore: always_specify_types
              Invocation.method(#listen, [
                onData,
                // ignore: always_specify_types
              ], {
                const Symbol('onError'): onError,
                const Symbol('onDone'): onDone,
                const Symbol('cancelOnError'): cancelOnError,
              }),
              returnValue: MockStreamSubscription<List<int>>())
          as StreamSubscription<List<int>>;
}

class MockHttpHeaders extends Mock implements HttpHeaders {}

class MockStreamSubscription<T> extends Mock implements StreamSubscription<T> {}

/// Returns a [MockHttpClient] that responds with demo image to all requests.
MockHttpClient createMockImageHttpClient() {
  final MockHttpClient client = MockHttpClient();
  final MockHttpClientRequest request = MockHttpClientRequest();
  final MockHttpClientResponse response = MockHttpClientResponse();
  final MockHttpHeaders headers = MockHttpHeaders();

  when(client.getUrl(Uri.parse('http://example.com')))
      .thenAnswer((_) => Future<HttpClientRequest>.value(request));
  when(request.headers).thenReturn(headers);
  when(request.close())
      .thenAnswer((_) => Future<HttpClientResponse>.value(response));
  when(response.compressionState)
      .thenReturn(HttpClientResponseCompressionState.notCompressed);
  when(response.contentLength).thenReturn(transparentImage.length);
  when(response.statusCode).thenReturn(HttpStatus.ok);
  when(response.listen(
    any,
    onError: anyNamed('onError'),
    onDone: anyNamed('onDone'),
    cancelOnError: anyNamed('cancelOnError'),
  )).thenAnswer((Invocation invocation) {
    final void Function(List<int>) onData =
        invocation.positionalArguments[0] as void Function(List<int>);
    final void Function() onDone =
        invocation.namedArguments[#onDone] as void Function();
    final void Function(Object, [StackTrace]) onError = invocation
        .namedArguments[#onError] as void Function(Object, [StackTrace]);
    final bool? cancelOnError =
        invocation.namedArguments[#cancelOnError] as bool?;

    return Stream<List<int>>.fromIterable(<List<int>>[transparentImage]).listen(
        onData,
        onDone: onDone,
        onError: onError,
        cancelOnError: cancelOnError);
  });

  return client;
}

// transparent pixel in png format
final Uint8List transparentImage = base64Decode(
  'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==',
);

Map<String, Function> mockGetFeedActionCallbacks() => <String, Function>{
      kCompleteIndividualRiderKYC: () {},
      kCompleteOrganizationRiderKYC: () {},
      kCompleteIndividualPractitionerKYC: () {},
      kCompleteOrganizationPractitionerKYC: () {},
      kCompleteOrganizationProviderKYC: () {},
      kCompleteIndividualPharmaceuticalKYC: () {},
      kCompleteOrganizationPharmaceuticalKYC: () {},
      kCompleteIndividualCoachKYC: () {},
      kCompleteOrganizationCoachKYC: () {},
      kCompleteIndividualNutritionKYC: () {},
      kCompleteOrganizationNutritionKYC: () {},
      kCompleteProfile: () {},
      kVerifyEmail: () {},
      kPartnerAccountSetup: () {},
    };
