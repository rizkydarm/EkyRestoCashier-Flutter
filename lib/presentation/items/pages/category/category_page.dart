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
        onPressed: () => showAddCategoryDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  static Future<void> showAddCategoryDialog(BuildContext context, {CategoryModel? category}) {
    String? name;
    final formKey = GlobalKey<FormState>();
    return showDialog(
      context: context,
      useRootNavigator: true,
      builder: (context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          clipBehavior: Clip.antiAlias,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.4,
              maxHeight: MediaQuery.of(context).size.height * 0.4,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
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
                  const Spacer(),
                  FilledButton(
                    onPressed: () {
                      final isValid = formKey.currentState?.validate() ?? false;
                      if (isValid && name != null) {
                        context.read<CategoryBloc>().add(CategoryEvent.addCategory(name: name!));
                        context.pop();
                      }
                    }, 
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
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
      // buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        // print("build CategoryBloc in CategoryPage.ListView");
        return state.maybeWhen(
          orElse: () => Center(child: const Text('No Items')),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(child: Text(message)),
          success: (data) {
            if (data.isEmpty) {
              return const Center(child: Text('No Items'));
            }
            return ListView.separated(
              itemCount: data.length,
              separatorBuilder: (context, index) => const Divider(),
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
                            CategoryPage.showAddCategoryDialog(context, category: data[index]);
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
