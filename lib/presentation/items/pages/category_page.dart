import 'package:eky_pos/presentation/items/bloc/category/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CategoryBloc>().add(CategoryEvent.getCategories());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Text("No Items");
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            error: (message) {
              return Center(child: Text(message));
            },
            success: (data) {
              if (data.isEmpty) {
                return const Center(
                  child: Text('No Items'),
                );
              }
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index].name ?? '-'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        context.read<CategoryBloc>().add(CategoryEvent.deleteCategory(id: data[index].id!));
                      },
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String? name;
          final formKey = GlobalKey<FormState>();
          showModalBottomSheet(context: context,
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
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
