import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderData extends StatefulWidget {
  const ProviderData({Key? key}) : super(key: key);

  @override
  State<ProviderData> createState() => _ProviderDataState();
}

class _ProviderDataState extends State<ProviderData> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const MyText(),
          ),
          body: const Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  const Level1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Level2();
  }
}

class Level2 extends StatelessWidget {
  const Level2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  const Level3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(builder: (context, dataNotifier, _) {
      return Text(dataNotifier.data);
    });
  }
}

class MyText extends StatelessWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        Provider.of<Data>(context, listen: false).changeText(newText);
      },
    );
    // return Consumer<Data>(builder: (context, data, _) {
    //   return TextField(
    //     onChanged: (newText) {
    //       data.changeText(newText);
    //     },
    //   );
    // });
  }
}

class Data with ChangeNotifier {
  String data = 'hello world';

  void changeText(String newText) {
    data = newText;
    notifyListeners();
  }
}
