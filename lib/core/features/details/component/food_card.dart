import 'package:flutter/material.dart';
import 'package:wasel_app/core/features/menu/model/menu_model.dart';
import 'package:wasel_app/core/shared/custome_cached_network_image.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class FoodCard extends StatefulWidget {
  FoodCard({required this.data});
  final MenuModel data ;
  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {

  int _currentPage = 0; 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: LightColors.primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
         
          Stack(
            children: [
         
              SizedBox(
                height: 180,
                child: ClipRRect( 
                  borderRadius: BorderRadius.circular(20),
                  child: PageView.builder(
                    itemCount: widget.data.foodImages.length,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF9DAAB9)
                        ),
                        child: CustomeCachedNetworkImage(urlImage: widget.data.foodImages.toString()));
                    },
                  ),
                ),
              ),
     
              Positioned(
                bottom: 15,
                left: 15,
                child: _buildBadge(widget.data.category,(){}),
              ),
              
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.data.foodImages.length,
                    (index) => _buildDot(index == _currentPage),
                  ),
                ),
              ),
          
              Positioned(
                bottom: 15,
                right: 15,
                child: _buildBadge("Delivery",()),
              ),
            ],
          ),
          SizedBox(height: 12),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.data.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("\$${widget.data.price}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 8),
       
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Colors.grey),
                  Text(" Kentucky 39495", style: TextStyle(color: Colors.grey)),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.star, size: 18, color: Colors.orange),
                  Text(" 4.9 ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
                  Text("(10 Reviews)", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildBadge(String text,onTap) {
    return GestureDetector(
      onTap: ()=>onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
      ),
    );
  }


  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300), 
      margin: EdgeInsets.symmetric(horizontal: 3),
      width: isActive ? 22 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          if(isActive) BoxShadow(color: Colors.black26, blurRadius: 2)
        ]
      ),
    );
  }
}