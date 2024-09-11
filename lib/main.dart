import 'package:counter_provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
    // dengan watch

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              const TextCounter(),
              // Consumer<CounterProvider>(builder: (context, provider, child) {
              //   return Text(
              //     '${provider.counter}',
              //     style: Theme.of(context).textTheme.headlineMedium,
              //   );
              // },),
            ],
          ),
        ),
        floatingActionButton: ButtonBar(
          children: [
            FloatingActionButton(
              onPressed: () {
                // Provider.of<CounterProvider>(context, listen: false)
                //     .increment(); // default nya begini
                context
                    .read<CounterProvider>()
                    .decrement(); // ini jika pakai extendsions
              },
              heroTag: 'Decrement',
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: () {
                // Provider.of<CounterProvider>(context, listen: false)
                //     .increment(); // default nya begini
                context.read<CounterProvider>().increment();
              },
              heroTag: 'Increment',
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ));
  }
}

// memanggil hasil dengan Consumer
class TextCounter extends StatelessWidget {
  const TextCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final int newCounter = context.watch<CounterProvider>().counter;

    return Text(
      '${newCounter}',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
