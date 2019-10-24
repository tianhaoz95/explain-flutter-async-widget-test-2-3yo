import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SlowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slow Screen'),
      ),
      body: Center(
        child: SlowScreenContent(),
      ),
    );
  }
}

class SlowScreenContent extends StatefulWidget {
  SlowScreenContent({Key key}) : super(key: key);
  @override
  _SlowScreenContent createState() => _SlowScreenContent();
}

class _SlowScreenContent extends State<SlowScreenContent> {
  Future<String> content;
  @override
  void initState() {
    super.initState();
    content = Future.delayed(Duration(seconds: 3), () => 'I am really slo...ow ;)');
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: content,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Not started');
          case ConnectionState.active:
            return Text('Active');
          case ConnectionState.waiting:
            return Text('Awaiting result...');
          case ConnectionState.done:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            return Text('Result: ${snapshot.data}', key: Key('slow_content'));
        }
        return Text('Unknown state :(');
      },
    );
  }
}
