class Producto {
  final int id;
  final String nombre;
  final String descripcion;
  final String categoria;
  final String imagen;
  final String precio;
  final int stock;

  Producto(
      {required this.id,
      required this.nombre,
      required this.descripcion,
      required this.categoria,
      required this.imagen,
      required this.precio,
      required this.stock});

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: json['id'] ?? 0,
      nombre: json['name'] ?? '',
      descripcion: json['description'] ?? '',
      categoria: json['category'] ?? '',
      imagen: json['image'] ?? '',
      precio: json['price'] ?? 0,
      stock: json['stock'] ?? 0,
    );
  }
}
