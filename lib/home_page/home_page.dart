import 'package:design_task/components/small_text.dart';
import 'package:flutter/material.dart';

import '../components/big_text.dart';
import '../pet_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  // the pet list
  final List<Pet> petList = [
    Pet("Dog","Golden",20,"https://drive.google.com/uc?export=view&id=1SVXNgYjWidATdPpPfswlWtS31DnhjB-2"),
    Pet("Lablador","Golden", 18, "https://drive.google.com/uc?export=view&id=152WsHjSIgQUy0gS_WQEo3mWOSMK8v1kM"),
    Pet("Dog", "Cardigan", 12, "https://drive.google.com/uc?export=view&id=1fHoNz-wywIk_ta4RIJzXm7yLrObyKDty"),
    Pet("Cat", "Street Cat", 17, "https://drive.google.com/uc?export=view&id=1SL7ZirhhuTpgk7wRe_t0vB_3xD9iqCGm"),
    Pet("Cat", "White Cat", 19, "https://drive.google.com/uc?export=view&id=1C_S4qQ4wck3LasJ1Bs5Lz8yhwN60SmTH"),
    Pet("Cat", "Kitten", 18, "https://drive.google.com/uc?export=view&id=1qQILdlJ3gtm_0VBzmSoqgTbisVZ-7kr9"),
    Pet("Bird","House Bird",15,"https://drive.google.com/uc?export=view&id=1LbUWy1JxxkSGSd4cu4dMBK5ChilbFud8"),
    Pet("Bird","Parrot",14,"https://drive.google.com/uc?export=view&id=1B9eAFq_9D75eXtn0BJM6gtq811eby6QN"),
    Pet("Bird","Pink Bird",15,"https://drive.google.com/uc?export=view&id=1Sg8plSKxYt1kRQn_DH_OdvHiE2FoeQah"),
    Pet("Bird","Talking Parrot",17,"https://drive.google.com/uc?export=view&id=1Sg8plSKxYt1kRQn_DH_OdvHiE2FoeQah"),
    Pet("Rat","Hamster",9,"https://drive.google.com/uc?export=view&id=11tVuPyyv23mByiFNHrJRuE55gyhMrGA2"),
    Pet("Rabbit","Brown Rabbit",16,"https://drive.google.com/uc?export=view&id=1huzYq6qlL4BiFzXqD7SuMYM67J5Ea0bV"),
    Pet("Rabbit", "Gray Rabbit",17,"https://drive.google.com/uc?export=view&id=1lxI-yXMPIp2nz2MLc7duJ5Sw6lrA-AsJ"),
  ];

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.sizeOf(context).height);
    print(MediaQuery.sizeOf(context).width);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SafeArea(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: double.maxFinite,
              height: MediaQuery.sizeOf(context).height * 0.1,
              color: const Color(0xFFdfe0df),
              child: const Center(
                  child: BigText(
                text: 'Pet Market',
              )),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SearchBar(
              padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 24)),
              leading: Container(
                    margin: const EdgeInsets.only(right: 30),
                      child: const Image(
                        image: AssetImage('assets/images/magnifier 1.png'),
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                  ),
              hintText: 'Search by pet type',
              hintStyle: const MaterialStatePropertyAll(TextStyle(
                fontFamily: 'BalsamiqSans',
                fontWeight: FontWeight.w400,
                color: Color(0xFFacacac),
                fontSize: 21,
              )),
              textStyle: const MaterialStatePropertyAll(TextStyle(
                fontFamily: 'BalsamiqSans',
                fontWeight: FontWeight.w400,
                color: Color(0xFFacacac),
                fontSize: 21,
              )
              ),
              shadowColor: const MaterialStatePropertyAll(Colors.transparent),
              surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
              backgroundColor: const MaterialStatePropertyAll(
                Color(0xFFefefef),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 30,left:16,right: 16 ),
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(color:Color(0x80DFE0DF) ),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.separated(
                    itemBuilder: (context,index){
                      return petItem(petList[index]);
                    },
                    separatorBuilder:(context,index)=> const SizedBox(height: 15,),
                    itemCount: petList.length,
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
  Widget petItem(Pet pet)=>Container(
    padding: const EdgeInsets.only(left: 10,top: 5 ,bottom: 5),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    height: 130,
    width: double.maxFinite,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: [
        Container(
          width: 110,
          margin: const EdgeInsets.only(),
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(pet.petPic),fit: BoxFit.fitHeight)
          ),
        ),
        const SizedBox(width: 5,),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(text: pet.petCategory,size: 26,overflow: TextOverflow.ellipsis),
            SmallText(text: pet.petType),
            Row(
              children: [
                Image.asset(
                  'assets/images/pawprintImg.png',
                  width: 35,
                  height: 37,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10,),
                SmallText(text: 'Pet Love: ${pet.petLoveCount}',color: const Color(0xFFDB6400),)
              ],
            )
          ],
        )
      ],
    ),
  );
}

