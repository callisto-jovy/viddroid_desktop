import 'package:flutter/material.dart';
import 'package:viddroid_flutter_desktop/util/capsules/fetch.dart';

import '../widgets/half_page_image.dart';
import '../widgets/tv_widget.dart';

class WatchableView extends StatefulWidget {
  final FetchResponse _fetchResponse;

  const WatchableView(this._fetchResponse, {Key? key}) : super(key: key);

  @override
  State<WatchableView> createState() => _WatchableViewState();
}

class _WatchableViewState extends State<WatchableView> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final FetchResponse fetchResponse = widget._fetchResponse;
    return Scaffold(
      appBar: AppBar(
        title: Text(fetchResponse.title),
      ),
      body: Stack(children: [
        HalfPageImage(
            tag: fetchResponse.data,
            imageURL: fetchResponse.backgroundImage,
            headers: fetchResponse.thumbnailHeaders),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  fetchResponse.title,
                  softWrap: true,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Bebas Neue',
                    shadows: [
                      Shadow(
                        color: Colors.black87.withOpacity(1),
                        offset: const Offset(10, 10),
                        blurRadius: 25,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(1.5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(5))),
                    child: Text(
                      fetchResponse.type.name.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  fetchResponse.duration != null
                      ? Center(
                          child: Text(
                            fetchResponse.duration!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : Container(),
                ],
              ),
              const Spacer(flex: 2),
              fetchResponse is TvFetchResponse ? TvWidget(fetchResponse) : Container()
            ],
          ),
        )
      ]),
    );
  }
}
