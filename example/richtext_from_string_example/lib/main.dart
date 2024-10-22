import 'package:flutter/material.dart';
import 'package:richtext_from_string/richtext_from_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'RichText from String example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Basic test",
              style: TextStyle(fontSize: 32),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: RichTextConverter(
                    "This is *italic*, **bold**, _underlined_, and [clickable](action) text. Even here it is **working** [right](action2)?")
                .convert(
              callbacks: {
                'action': () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog.adaptive(
                          title: Text("You clicked the text!"),
                        );
                      });
                },
                'action2': () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog.adaptive(
                        title: Text("And again!"),
                      );
                    },
                  );
                },
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Apply different styles",
              style: TextStyle(fontSize: 32),
            ),
          ),
          Builder(
            builder: (context) {
              String text =
                  """This is *italic*, **bold**, _underline as line through_, and [clickable](action) text. Even here it is **working** [right](action2)?""";
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: RichTextConverter(
                  text,
                  options: RichTextOptions(
                    boldStyle: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.w900),
                    italicStyle: const TextStyle(
                        fontSize: 22, fontStyle: FontStyle.italic),
                    gestureStyle:
                        const TextStyle(fontSize: 10, color: Colors.red),
                    underlineStyle: const TextStyle(
                        fontSize: 24, decoration: TextDecoration.lineThrough),
                  ),
                ).convert(),
              );
            },
          ),
        ],
      ),
    );
  }
}
