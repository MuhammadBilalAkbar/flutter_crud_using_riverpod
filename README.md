## 1. Research: CRUD Operations Using Riverpod State Management

- Keywords:
    - crud app using riverpod state management flutter
    - riverpod flutter example github
    - flutter riverpod architecture
    - flutter riverpod login example
    - riverpod flutter tutorial
    - riverpod github
    - riverpod vs bloc
    - flutter riverpod example
    - riverpod vs provider
    - flutter riverpod
    - riverpod flutter
    - flutter riverpod tutorial

- Video Title: Flutter CRUD App using Riverpod State Management - Flutter Riverpod example


## 2. Research: Competitors

**Flutter Videos/Articles**

- 2.2K: https://www.youtube.com/watch?v=zxe-0rOZdIc
- 2K: https://www.youtube.com/watch?v=jJl59OUKtIg
- 9K: https://www.youtube.com/watch?v=Q6tT3Ca2PY8
- 4K: https://www.youtube.com/watch?v=AEXY_SGWbXc
- 44K: https://www.youtube.com/watch?v=vrPk6LB9bjo
- 17K: https://www.youtube.com/watch?v=pwflXIA-6YQ
- 74K: https://www.youtube.com/watch?v=Zp7VKVhirmw
- 12K: https://www.youtube.com/watch?v=2EV5w73QbF4
- https://riverpod.dev/docs/concepts/providers
- https://parthpanchal53.medium.com/flutter-firebase-firestore-crud-app-using-riverpod-981811e2a73d
- https://www.dbestech.com/tutorials/flutter-riverpod-example-state-management
- https://itnext.io/flutter-state-management-with-riverpod-ef8d4ef77392
- https://itnext.io/flutter-riverpod-example-and-guide-with-networking-b758af7b646b
- https://codewithandrea.com/videos/starter-architecture-flutter-firebase/


**Android/Swift/React Videos**

- NA

**Great Features**
- A simple way to access state from anywhere in your application while robust and testable.
- Allows easily accessing that state in multiple locations. Providers are a complete replacement for patterns like Singletons, Service Locators, Dependency Injection or InheritedWidgets.
- Simplifies combining this state with others. Ever struggled to merge multiple objects into one? This scenario is built directly inside providers.
- Enables performance optimizations. Whether for filtering widget rebuilds or for caching expensive state computations; providers ensure that only what is impacted by a state change is recomputed.
- Increases the testability of your application. With providers, you do not need complex `setUp`/`tearDown` steps. Furthermore, any provider can be overridden to behave differently during a test, which allows easily testing a very specific behavior.
- Allows easy integration with advanced features, such as logging or pull-to-refresh.
- You can find more at [riverpod.dev](https://riverpod.dev/docs/concepts/providers).

**Problems from Videos**
- NA

**Problems from Flutter Stackoverflow**

- https://stackoverflow.com/questions/64198816/riverpod-alternate-way-of-overriding-initstate-inside-consumerwidget/64218048#64218048
- https://stackoverflow.com/questions/67233449/the-type-statenotifierprovider-is-declared-with-2-type-parameters-but-1-type/67234289#67234289
- https://stackoverflow.com/questions/66411312/riverpod-how-to-await-using-futureprovider-on-asyncvalue-not-in-widget/66955043#66955043
- https://stackoverflow.com/questions/71813090/flutter-riverpod-ref-read-vs-ref-listen-vs-ref-watch/71843825#71843825
- https://stackoverflow.com/questions/71251830/why-is-riverpod-failing-even-to-initialize-in-project-method-not-found-error/71259018#71259018
- https://stackoverflow.com/questions/68727448/dart-riverpod-undefined-class-widgetref/68728029#68728029
- https://stackoverflow.com/questions/66556027/riverpod-reading-state-in-outside-buildcontext-and-provider

## 3. Video Structure

**Main Points / Purpose Of Lesson**

1. A simple way to access state from anywhere in your application while robust and testable.
2. Main Points
    - There are six types of Riverpod providers. The most common `StateNotifier` & `StateNotifierProvider` is used in this project with random numbers to create, edit or delete them.
    - _[...]_
3. _[Out of 1. & 2. create 2-3 sentences that could be later used for recording the introduction of this video lesson]_

**The Structured Main Content**
1. Different Types of Providers
<br/> WidgetRef   -> Helps us to talk from a widget to a provider
<br/> ProviderRef -> Allows us to talk from a provider to another provider
<br/> Ref         -> Super class to the ProviderRef and WidgetRef
<br/>For all types, put final and then give name of the type of provider. ref allows us to talk with other providers.
<br/> There are multiple types of providers for multiple different use cases. With all of these providers available, it is sometimes difficult to understand when to use one provider type over another. Use the table below to choose a provider that fits what you want to provide to the widget tree.

| Provider Type                                                                                                                                                                                      | Provider Create Function                    | Example Use Case                                                     |
|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------------------------|:---------------------------------------------------------------------|
| [Provider](https://riverpod.dev/docs/providers/provider)                                                                                                                                           | Returns any type                            | A service class / computed property (filtered list)                  |
| [StateProvider](https://riverpod.dev/docs/providers/state_provider)                                                                                                                                | Returns any type                            | A filter condition / simple state object                             |
| [FutureProvider](https://riverpod.dev/docs/providers/future_provider)                                                                                                                              | Returns a Future of any type                | A result from an API call                                            |
| [StreamProvider](https://riverpod.dev/docs/providers/stream_provider)                                                                                                                              | Returns a Stream of any type                | A stream of results from an API                                      |
| [StateNotifierProvider](https://riverpod.dev/docs/providers/state_notifier_provider)                                                                                                               | Returns a subclass of StateNotifier         | A complex state object that is immutable except through an interface |
| [ChangeNotifierProvider](https://pub.dev/documentation/flutter_riverpod/latest/flutter_riverpod/ChangeNotifierProvider-class.html)                                                                 | Returns a subclass of ChangeNotifier        | A complex state object that requires mutability                      |

<br>
- Provider:
<br/>It should always be immutable. Provider is the most basic of all providers. It exposes an object that never changes. Provides data to widgets or other providers, it is read-only and can not update the value outside of it. It can be used to provide primitive(int, bool, String), non-primitive(list, map) data types and even instances of classes. 
- StateProvider and StateController/Provider:
<br/>A provider that exposes a value that can be modified from outside. Used to update the value from outside which is not possible using the simple provider. It is like an upgrade over the normal provider. Used for String,int,double,bool not for complex values
- StateNotifier & StateNotifierProvider:
<br/>For more complex states (e.g., for a class and its properties). Value of state can be changed inside the StateNotifier class not outside. State outside the StateNotifier class is immutable. 
- ChangeNotifier & ChangeNotifierProvider:
<br/>Not recommended by Riverpod. Just used for transition from Provider to Riverpod. It is the only provider which is mutable outside of the class. It is similar to provider. Don't use it much if you are building application from scratch because of its mutable state.
- FutureProvider:
<br/>If you have async code, and you want to get rid of FutureBuilder and asyncSnapshots.
- StreamProvider:
<br/>If you have stream and you want to get rid of streamBuilder and asyncSnapshots.
- Run `dart pub get flutter_riverpod` to add this dependency in your `pubspec.yaml` file. Import `import 'package:flutter_riverpod/flutter_riverpod.dart';` where you want to use in your project.
- For this video:
    - There is no need of setup for Android and iOS.
    - _[2. Pick Image From Gallery]_
    - _[3. Pick Image From Camera]_
    - _[4. Persist Images To Local Storage]_
