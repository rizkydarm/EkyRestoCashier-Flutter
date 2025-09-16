import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithDrawer(navigationShell: navigationShell);
          },
          branches: [
            // Home Branch
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/home',
                  builder: (context, state) => const HomePage(),
                  routes: [
                    GoRoute(
                      path: 'detail/:id',
                      builder: (context, state) => DetailPage(
                        id: state.pathParameters['id'] ?? '',
                        title: 'Home Detail',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Discover Branch
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/discover',
                  builder: (context, state) => const DiscoverPage(),
                  routes: [
                    GoRoute(
                      path: 'detail/:id',
                      builder: (context, state) => DetailPage(
                        id: state.pathParameters['id'] ?? '',
                        title: 'Discover Detail',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Library Branch
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/library',
                  builder: (context, state) => const LibraryPage(),
                  routes: [
                    GoRoute(
                      path: 'detail/:id',
                      builder: (context, state) => DetailPage(
                        id: state.pathParameters['id'] ?? '',
                        title: 'Library Detail',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Profile Branch
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/profile',
                  builder: (context, state) => const ProfilePage(),
                  routes: [
                    GoRoute(
                      path: 'detail/:id',
                      builder: (context, state) => DetailPage(
                        id: state.pathParameters['id'] ?? '',
                        title: 'Profile Detail',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
      initialLocation: '/home',
    );

    return MaterialApp.router(
      title: 'Flutter Nested Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

class ScaffoldWithDrawer extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithDrawer({
    super.key,
    required this.navigationShell,
  });

  @override
  State<ScaffoldWithDrawer> createState() => _ScaffoldWithDrawerState();
}

class _ScaffoldWithDrawerState extends State<ScaffoldWithDrawer> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      widget.navigationShell.goBranch(
        index,
        initialLocation: index == widget.navigationShell.currentIndex,
      );
    });
  }

  bool _isDrawerOpen = false;
  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          minExtendedWidth: 240,
          minWidth: 80,
          extended: _isDrawerOpen,
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          leading: SizedBox(
            width: _isDrawerOpen ? 240 : 80,
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 80,
                child: IconButton(
                  icon: Icon(_isDrawerOpen ? Icons.chevron_left_outlined : Icons.chevron_right_outlined),
                  onPressed: _toggleDrawer,
                ),
              ),
            ),
          ),
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.explore),
              label: Text('Discover'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.library_books),
              label: Text('Library'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.person),
              label: Text('Profile'),
            ),
          ],
        ),
        Expanded(
          child: widget.navigationShell,
        ),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.home, size: 100),
            const Text('Home Page', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/home/detail/1'),
              child: const Text('Go to Detail'),
            ),
          ],
        ),
      ),
    );
  }
}

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.explore, size: 100),
          const Text('Discover Page', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => context.go('/discover/detail/2'),
            child: const Text('Go to Detail'),
          ),
        ],
      ),
    );
  }
}

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.library_books, size: 100),
          const Text('Library Page', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => context.go('/library/detail/3'),
            child: const Text('Go to Detail'),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person, size: 100),
          const Text('Profile Page', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => context.go('/profile/detail/4'),
            child: const Text('Go to Detail'),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String id;
  final String title;

  const DetailPage({
    super.key,
    required this.id,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title - ID: $id'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Detail Page for ID: $id',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}