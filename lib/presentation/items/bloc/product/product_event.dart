part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.started() = _Started;
  const factory ProductEvent.getProducts() = _GetProducts;
  const factory ProductEvent.getProductById(String id) = _GetProductById;
  const factory ProductEvent.addProduct(ProductModel product) = _AddProduct;
  const factory ProductEvent.editProduct(ProductModel product, int id) = _EditProduct;
  const factory ProductEvent.deleteProduct(int id) = _DeleteProduct;
  const factory ProductEvent.searchProduct(String query) = _SearchProduct;
  const factory ProductEvent.updateStock(
    int stock,
    String type,
    String note,
    int id,
  ) = _UpdateStock;
  const factory ProductEvent.getProductsByCategory(int categoryId) = _GetProductsByCategory;
  const factory ProductEvent.getProductByBarcode(String barcode) = _GetProductByBarcode;
}
