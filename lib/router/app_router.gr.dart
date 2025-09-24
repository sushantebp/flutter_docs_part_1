// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ButtonTypePage]
class ButtonTypeRoute extends PageRouteInfo<void> {
  const ButtonTypeRoute({List<PageRouteInfo>? children})
    : super(ButtonTypeRoute.name, initialChildren: children);

  static const String name = 'ButtonTypeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ButtonTypePage();
    },
  );
}

/// generated route for
/// [DetailsPage]
class DetailsRoute extends PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({Key? key, required String id, List<PageRouteInfo>? children})
    : super(
        DetailsRoute.name,
        args: DetailsRouteArgs(key: key, id: id),
        initialChildren: children,
      );

  static const String name = 'DetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailsRouteArgs>();
      return DetailsPage(key: args.key, id: args.id);
    },
  );
}

class DetailsRouteArgs {
  const DetailsRouteArgs({this.key, required this.id});

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DetailsRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [DialogBoxExamplePage]
class DialogBoxExampleRoute extends PageRouteInfo<void> {
  const DialogBoxExampleRoute({List<PageRouteInfo>? children})
    : super(DialogBoxExampleRoute.name, initialChildren: children);

  static const String name = 'DialogBoxExampleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DialogBoxExamplePage();
    },
  );
}

/// generated route for
/// [HandlingUserInputPage]
class HandlingUserInputRoute extends PageRouteInfo<void> {
  const HandlingUserInputRoute({List<PageRouteInfo>? children})
    : super(HandlingUserInputRoute.name, initialChildren: children);

  static const String name = 'HandlingUserInputRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HandlingUserInputPage();
    },
  );
}

/// generated route for
/// [KeysUsecasePage]
class KeysUsecaseRoute extends PageRouteInfo<void> {
  const KeysUsecaseRoute({List<PageRouteInfo>? children})
    : super(KeysUsecaseRoute.name, initialChildren: children);

  static const String name = 'KeysUsecaseRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const KeysUsecasePage();
    },
  );
}

/// generated route for
/// [LayoutUnderstandingPage]
class LayoutUnderstandingRoute extends PageRouteInfo<void> {
  const LayoutUnderstandingRoute({List<PageRouteInfo>? children})
    : super(LayoutUnderstandingRoute.name, initialChildren: children);

  static const String name = 'LayoutUnderstandingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LayoutUnderstandingPage();
    },
  );
}

/// generated route for
/// [NetworkExamplePage]
class NetworkExampleRoute extends PageRouteInfo<void> {
  const NetworkExampleRoute({List<PageRouteInfo>? children})
    : super(NetworkExampleRoute.name, initialChildren: children);

  static const String name = 'NetworkExampleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NetworkExamplePage();
    },
  );
}

/// generated route for
/// [ResponsiveLayoutExamplePage]
class ResponsiveLayoutExampleRoute extends PageRouteInfo<void> {
  const ResponsiveLayoutExampleRoute({List<PageRouteInfo>? children})
    : super(ResponsiveLayoutExampleRoute.name, initialChildren: children);

  static const String name = 'ResponsiveLayoutExampleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ResponsiveLayoutExamplePage();
    },
  );
}

/// generated route for
/// [StateManageExamplePage]
class StateManageExampleRoute extends PageRouteInfo<void> {
  const StateManageExampleRoute({List<PageRouteInfo>? children})
    : super(StateManageExampleRoute.name, initialChildren: children);

  static const String name = 'StateManageExampleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StateManageExamplePage();
    },
  );
}
