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
              margin:  EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height/43.37),
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
            margin: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height/43.37),
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width/41.14),
            child: SearchBar(
              padding:  MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width/17.14)),
              leading: Container(
                    margin:  EdgeInsets.only(right: MediaQuery.sizeOf(context).width/13.71),
                      child:  Image(
                        image: const AssetImage('assets/images/magnifier 1.png'),
                        height: MediaQuery.sizeOf(context).height/43.37,
                        fit: BoxFit.cover,
                      ),
                  ),
              hintText: 'Search by pet type',
              hintStyle:  MaterialStatePropertyAll(TextStyle(
                fontFamily: 'BalsamiqSans',
                fontWeight: FontWeight.w400,
                color: const Color(0xFFacacac),
                fontSize: MediaQuery.sizeOf(context).height/41.3,
              )),
              textStyle:  MaterialStatePropertyAll(TextStyle(
                fontFamily: 'BalsamiqSans',
                fontWeight: FontWeight.w400,
                color: const Color(0xFFacacac),
                fontSize: MediaQuery.sizeOf(context).height/41.3,
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
              margin:  EdgeInsets.only(
                  bottom: MediaQuery.sizeOf(context).height/28.9,
                  left:MediaQuery.sizeOf(context).width/25.7,
                  right: MediaQuery.sizeOf(context).width/25.7,
              ),
              padding:  EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width/29.4,
                  vertical: MediaQuery.sizeOf(context).height/57.8,
              ),
              decoration: const BoxDecoration(color:Color(0x80DFE0DF) ),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.separated(
                    itemBuilder: (context,index){
                      return petItem(petList[index],context);
                    },
                    separatorBuilder:(context,index)=>  SizedBox(height: MediaQuery.sizeOf(context).height/57.83,),
                    itemCount: petList.length,
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
  Widget petItem(Pet pet,context)=>Container(
    padding:  EdgeInsets.only(
        left: MediaQuery.sizeOf(context).width/41.14,
        top: MediaQuery.sizeOf(context).height/173.5 ,
        bottom: MediaQuery.sizeOf(context).height/173.5,
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    height: MediaQuery.sizeOf(context).height/6.673,
    width: double.maxFinite,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width/3.74,
          margin: const EdgeInsets.only(),
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(pet.petPic),fit: BoxFit.fitHeight)
          ),
        ),
        SizedBox(width: MediaQuery.sizeOf(context).width/82.3,),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(
                text: pet.petCategory,
                size: 26,
                overflow: TextOverflow.ellipsis,
            ),
            SmallText(
                text: pet.petType,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/pawprintImg.png',
                  width: MediaQuery.sizeOf(context).width/11.75,
                  height: MediaQuery.sizeOf(context).height/23.4,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: MediaQuery.sizeOf(context).height/86.74,),
                SmallText(text: 'Pet Love: ${pet.petLoveCount}',color: const Color(0xFFDB6400),)
              ],
            )
          ],
        )
      ],
    ),
  );
}

