import '../util/capsules/link.dart';

abstract class Extractor {
  final String name;
  final String mainUrl;
  final String url;
  final List<String>? altUrls;

  Extractor(this.name, this.mainUrl, this.url, {this.altUrls});

  Stream<LinkResponse> extract(final String url, {final Map<String, String>? headers});
}
