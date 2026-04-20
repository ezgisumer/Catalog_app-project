import 'package:catalog_app/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final Products product;
  final Set<int> cartIds;

  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.cartIds,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Back"), backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: widget.product.id ?? 0,
              child: Image.network(
                widget.product.thumbnail ?? "",
                height: 350,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title ?? "",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),

                  SizedBox(height: 4),

                  Text(
                    (widget.product.tags != null &&
                            widget.product.tags!.length > 1)
                        ? widget.product.tags![1]
                        : "",
                    style: TextStyle(fontSize: 14),
                  ),

                  SizedBox(height: 12),

                  Text(
                    "Description",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 4),

                  Text(
                    widget.product.description ?? "",
                    style: TextStyle(fontSize: 16),
                  ),

                  SizedBox(height: 14),

                  Text(
                    "₺${widget.product.price ?? 0}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.purpleAccent[700],
                    ),
                  ),

                  SizedBox(height: 40),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent[100],
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        widget.cartIds.add(widget.product.id ?? 0);
                      });

                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Added to cart")));
                    },
                    child: Text(
                      "Add to cart",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
