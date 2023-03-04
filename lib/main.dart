import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Models/UserModel.dart';
import 'widgets/with_stateful.dart';
import 'widgets/with_stateless.dart';
import 'widgets/with_widgetref.dart';

// Providers =>
// WidgetRef -> helps us to talk from a widget to a provider
// ProviderRef -> allows us to talk from a provider to another provider
// Ref -> Super class to the ProviderRef and WidgetRef
// For all types, put final and then give name of the type of provider. ref allows us
// to talk with other providers.

// 1. Provider =>
// It should always be immutable. Provider is the most basic of all providers. It exposes an object that never changes.
// Provides data to widgets or other providers, it is read-only and can not update the
// value outside of it. It can be used to provide primitive(int, bool, String),
// non-primitive(list, map) data types and even instances of classes.
final nameProvider = Provider<String>((ref) => 'Bilal');

// 2. StateProvider and StateController/Provider =>
// A provider that exposes a value that can be modified from outside. Used to update the
// value from outside which is not possible using the simple provider. It is like an
// upgrade over the normal provider. Used for String,int,double,bool not for complex values
// final nameStateProvider = StateProvider<String>((ref) => 'Bilal');
final nameStateProvider = StateProvider<String?>((ref) => null);

// StateNotifier & StateNotifierProvider =>
// For more complex states (e.g., for a class and its properties). Value of state can
//be changed inside the StateNotifier class not outside.
//state outside the StateNotifier class is immutable.
final userModelProvider = StateNotifierProvider<UserModelNotifier, UserModel>(
  (ref) => UserModelNotifier(
      // const UserModel(name: '', age: 0),
      ),
);

// ChangeNotifier & ChangeNotifierProvider =>
// Not recommended by Riverpod. Just used for transition from Provider to Riverpod.
// It is the only provider which is mutable outside of the class. It is similar
// to provider. Don't use it much if you are building application from scratch because
// of its mutable state.
final userModelChangeNotifierProvider = ChangeNotifierProvider(
  (ref) => UserModelChangeNotifierProvider(),
);
// FutureProvider =>
// If you have async code, and you want to get rid of FutureBuilder and asyncSnapshots.
// StreamProvider =>
// If you have stream and you want to get rid of streamBuilder and asyncSnapshots.

void main() => runApp(
      // const ProviderScope(child: MyApp()),
      const ProviderScope(child: Learning1()),
    );

class Learning1 extends StatelessWidget {
  const Learning1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 30)),
        ),
        home: const WithWidgetRef(),
        // home: const WithStateless(),
        // home: const WithStateful(),
      );
}
