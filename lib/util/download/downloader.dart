import 'package:viddroid_flutter_desktop/util/capsules/link.dart';
import 'package:viddroid_flutter_desktop/util/download/basic_downloader.dart';
import 'package:viddroid_flutter_desktop/util/download/hls_downloader.dart';

abstract class Downloader {
  final LinkResponse url;
  final String filePath;

  Downloader(this.url, {required this.filePath});

  Future<void> download(Function(int) progressCallback);
}

class Downloaders {
  Downloader? getDownloader(final LinkResponse linkResponse, final String filePath) {
    //Figure out the appropriate downloader. (This is very basic for now).
    if (linkResponse.url.endsWith('.m3u8')) {
      return HLSDownloader(linkResponse, filePath: filePath);
    } else {
      return BasicDownloader(linkResponse, filePath: filePath);
    }
  }
}
