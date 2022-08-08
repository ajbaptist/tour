import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Intro'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text('Start with useDefaultTheme'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const MyHomePage(
                      title: 'Flutter Intro',
                      mode: Mode.defaultTheme,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              child: const Text('Start with useAdvancedTheme'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const MyHomePage(
                      title: 'Flutter Intro',
                      mode: Mode.advancedTheme,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              child: const Text('Start with customTheme'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const MyHomePage(
                      title: 'Flutter Intro',
                      mode: Mode.customTheme,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

enum Mode {
  defaultTheme,
  customTheme,
  advancedTheme,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
    required this.mode,
  }) : super(key: key);

  final String title;

  final Mode mode;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Intro intro;

  Widget customThemeWidgetBuilder(StepWidgetParams stepWidgetParams) {
    List<String> texts = [
      'Hello, I\'m Flutter Intro.',
      'I can help you quickly implement the Step By Step guide in the Flutter project.',
      'My usage is also very simple, you can quickly learn and use it through example and api documentation.',
      'In order to quickly implement the guidance, I also provide a set of out-of-the-box themes, I wish you all a happy use, goodbye!',
    ];
    return Padding(
      padding: const EdgeInsets.all(
        32,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            '${texts[stepWidgetParams.currentStepIndex]}【${stepWidgetParams.currentStepIndex + 1} / ${stepWidgetParams.stepCount}】',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: stepWidgetParams.onPrev,
                child: const Text(
                  'Prev',
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              ElevatedButton(
                onPressed: stepWidgetParams.onNext,
                child: const Text(
                  'Next',
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              ElevatedButton(
                onPressed: stepWidgetParams.onFinish,
                child: const Text(
                  'Finish',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.mode == Mode.defaultTheme) {
      /// init Intro
      intro = Intro(
        stepCount: 4,
        maskClosable: true,
        onHighlightWidgetTap: (introStatus) {
          print("click---->${introStatus.currentStepIndex}");
        },

        /// use defaultTheme
        widgetBuilder: StepWidgetBuilder.useDefaultTheme(
          texts: [
            'Hello, I\'m Flutter Intro.',
            'I can help you quickly implement the Step By Step guide in the Flutter project.',
            'My usage is also very simple, you can quickly learn and use it through example and api documentation.',
            'In order to quickly implement the guidance, I also provide a set of out-of-the-box themes, I wish you all a happy use, goodbye!',
          ],
          buttonTextBuilder: (currPage, totalPage) {
            print("check------meena");
            return currPage < totalPage - 1 ? 'Next' : 'Finh';
          },
        ),
      );
      intro.setStepConfig(
        2,
        borderRadius: BorderRadius.circular(64),
      );
    }
    if (widget.mode == Mode.advancedTheme) {
      var texts = [
        'Hello, I\'m Flutter Intro.',
        'I can help you quickly implement the Step By Step guide in the Flutter project.',
        'My usage is also very simple, you can quickly learn and use it through example and api documentation.',
        'In order to quickly implement the guidance, I also provide a set of out-of-the-box themes, I wish you all a happy use, goodbye!',
      ];

      /// init Intro
      intro = Intro(
        stepCount: 4,
        maskClosable: true,
        onHighlightWidgetTap: (introStatus) {
          print("introStatus");
        },

        /// useAdvancedTheme
        widgetBuilder: StepWidgetBuilder.useAdvancedTheme(
          widgetBuilder: (params) {
            return Column(
              children: [
                Text(
                  params.currentStepIndex > texts.length - 1
                      ? ''
                      : texts[params.currentStepIndex],
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 28,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                      overlayColor: MaterialStateProperty.all<Color>(
                        Colors.white.withOpacity(0.1),
                      ),
                      side: MaterialStateProperty.all<BorderSide>(
                        const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 8,
                        ),
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        const StadiumBorder(),
                      ),
                    ),
                    onPressed: () {
                      if (params.stepCount - 1 == params.currentStepIndex) {
                        params.onFinish();
                      } else {
                        params.onNext!();
                      }
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
      intro.setStepConfig(
        0,
        borderRadius: BorderRadius.circular(64),
      );
    }
    if (widget.mode == Mode.customTheme) {
      /// init Intro
      intro = Intro(
        stepCount: 4,

        maskClosable: true,

        /// implement widgetBuilder function
        widgetBuilder: customThemeWidgetBuilder,
      );
    }

    Timer(
      const Duration(
        milliseconds: 500,
      ),
      () {
        /// start the intro
        intro.start(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Container(
                    key: intro.keys[2],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Placeholder(
                  /// 3rd guide
                  key: intro.keys[1],
                  fallbackHeight: 100,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Placeholder(
                        /// 4th guide
                        key: intro.keys[3],
                        fallbackHeight: 100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          /// 1st guide
          key: intro.keys[0],
          child: const Icon(
            Icons.play_arrow,
          ),
          onPressed: () {
            intro.start(context);
          },
        ),
      ),
      onWillPop: () async {
        // sometimes you need get current status
        IntroStatus introStatus = intro.getStatus();
        if (introStatus.isOpen) {
          // destroy guide page when tap back key
          intro.dispose();
          return false;
        }
        return true;
      },
    );
  }
}
