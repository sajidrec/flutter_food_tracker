import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'food_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FoodItem> foodItemList = [];

  TextEditingController textEditingControllerFoodQuantity =
          TextEditingController(),
      textEditingControllerFoodName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Food tracker",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange.shade400,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    foodItemList.insert(
                      0,
                      FoodItem(
                        (textEditingControllerFoodName.text
                                .toString()
                                .isNotEmpty)
                            ? textEditingControllerFoodName.text.toString()
                            : "Unmentioned",
                        int.tryParse(textEditingControllerFoodQuantity.text
                                .toString()) ??
                            1,
                        DateTime.now(),
                      ),
                    );

                    setState(() {});
                  },
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    alignment: Alignment.center,
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue,
                      border: Border.all(color: Colors.blue.shade200, width: 3),
                    ),
                    child: const Text(
                      "Tap to add",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      child: TextField(
                        controller: textEditingControllerFoodQuantity,
                        decoration: const InputDecoration(
                          hintText: "exp 1",
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: textEditingControllerFoodName,
                        decoration: const InputDecoration(
                          hintText: "Food name",
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: foodItemList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          foodItemList[index].getQuantity.toString(),
                        ),
                      ),
                      title: Text(
                        foodItemList[index].getFoodName.toString(),
                      ),
                      subtitle: Text(DateFormat.yMEd()
                          .add_jms()
                          .format(foodItemList[index].getTime)),
                      trailing: IconButton(
                        onPressed: () {
                          foodItemList.removeAt(index);
                          setState(() {});
                        },
                        icon: const Icon(Icons.delete_forever_rounded),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
