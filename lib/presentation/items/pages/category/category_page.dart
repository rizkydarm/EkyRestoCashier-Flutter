import 'package:eky_pos/core/extensions/build_context_ext.dart';
import 'package:eky_pos/data/models/responses/category_response_model.dart';
import 'package:eky_pos/presentation/home/pages/home_page.dart';
import 'package:eky_pos/presentation/home/widgets/main_drawer.dart';
import 'package:eky_pos/presentation/items/bloc/category/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    context.read<CategoryBloc>().add(const CategoryEvent.getCategories());

    final scaffoldKey = GlobalKey<ScaffoldState>();
    final isLargeScreen = MediaQuery.of(context).size.width > 840;
    
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(isLargeScreen ? Icons.menu_open : Icons.menu),
          onPressed: () {
            if (isLargeScreen) {
              Provider.of<ToggleDrawerProvider>(context, listen: false).toggle();
            } else {
              scaffoldKey.currentState?.openDrawer();
            }
          },
        ),
      ),
      drawer: isLargeScreen ? null : MainDrawer(),
      body: CategoryBlocListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddCategoryBottomSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  static Future<void> showAddCategoryBottomSheet(BuildContext context, {CategoryModel? category}) {
    String? name;
    final formKey = GlobalKey<FormState>();
    return showModalBottomSheet(context: context,
      showDragHandle: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24)
      ),
      constraints: const BoxConstraints(
        maxWidth: 600,
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: formKey,
                child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Category name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    filled: true,
                  ),
                  onChanged: (value) => name = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Category name is required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  final isValid = formKey.currentState?.validate() ?? false;
                  if (isValid && name != null) {
                    context.read<CategoryBloc>().add(CategoryEvent.addCategory(name: name!));
                    Navigator.pop(context);
                  }
                }, 
                child: const Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CategoryBlocListView extends StatelessWidget {
  const CategoryBlocListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => Center(child: const Text('No Items')),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(child: Text(message)),
          success: (data) {
            if (data.isEmpty) {
              return const Center(child: Text('No Items'));
            }
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index].name ?? '-'),
                  onTap: () {
                    context.pushNamed('product', extra: data[index]);
                  },
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            CategoryPage.showAddCategoryBottomSheet(context);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context.read<CategoryBloc>().add(CategoryEvent.deleteCategory(id: data[index].id!));
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
