import 'package:comestore/widgets/MainTitle.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text(" مــتـجـر كـــــــــــــوم - المــــــنـــتجـــــات "),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 10,
              ),
              MainTitle(
                title: "تفاصيل المنتج",
                ontap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 250.36,
                width: 351,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/imagesProducts/bags.png",
                        )),
                    borderRadius: BorderRadius.circular(7)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 77.08,
                width: 351,
                decoration: BoxDecoration(
                    color: const Color(0xffe8e8e8),
                    borderRadius: BorderRadius.circular(7)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    textAlign: TextAlign.end,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    "حقيبة أنيقة وعملية مصممة لتلبية احتياجاتك اليومية. مصنوعة من مواد عالية الجودة لضمان المتانة وتحمل الاستخدام المتكرر. تتميز الحقيبة بمساحة واسعة متعددة الجيوب لتخزين أغراضك الشخصية مثل الهاتف",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: "IBM Plex Sans Arabic",
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "الكمية",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "IBM Plex Sans Arabic",
                    fontWeight: FontWeight.w600),
              ),
              Container(
                width: 138.06,
                height: 30,
                decoration: BoxDecoration(
                    color: const Color(0xffe8e8e8),
                    borderRadius: BorderRadius.circular(3)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove,
                        size: 18,
                      ),
                    ),
                    const Text(
                      "3",
                      style: TextStyle(
                          color: Color(0xff1E1E1E),
                          fontFamily: "IBM Plex Sans Arabic",
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "السعر الاجمالي",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "IBM Plex Sans Arabic",
                    fontWeight: FontWeight.w600),
              ),
              Container(
                  width: 138.06,
                  height: 30,
                  decoration: BoxDecoration(
                      color: const Color(0xffe8e8e8),
                      borderRadius: BorderRadius.circular(3)),
                  child: const Center(
                    child: Text("34\$",
                        style: TextStyle(
                            color: Color(0xff1E1E1E),
                            fontFamily: "IBM Plex Sans Arabic",
                            fontWeight: FontWeight.w600,
                            fontSize: 16)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
