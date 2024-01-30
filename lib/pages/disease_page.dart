// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:crop_guard/util/my_card.dart';
import 'package:flutter/material.dart';

class Diseases extends StatelessWidget {
  const Diseases({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Rice Plant Diseases', 
        style: TextStyle(
          color: Colors.grey, 
          fontWeight:FontWeight.w500,
          fontSize: 18),),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              //card 1
              MyCard(
                imagePath: 'lib/images/rice-blast.png',
                dname: 'Rice Blast', 
                ddescription: "The rice blast disease, which is caused by a fungus Mangnaporthe oryzae known as one of the most formidable and economically impactful maladies affecting rice agriculture globally. With rice serving as a primary dietary staple for more than half of the world's population, this disease carries significant consequences, as it can result in substantial reductions in crop yields result in loss for farmers. The severity of rice blast is attributed to its capacity to generate distinctive diamond-shaped lesions on various parts of rice plants, including leaves, stems, and panicles. These lesions have the tendency to grow larger and coalesce, hampering the plant's ability to conduct photosynthesis effectively and resulting in substantial reductions in crop yields.",
                ),
              SizedBox(height: 10,),
                    
              //card 2
              MyCard(
                imagePath: 'lib/images/brown-spot.png',
                dname: 'Brown Spot', 
                ddescription: "Brown spots on rice plants are a common symptom of various plant diseases. These spots typically appear as small to large discolored areas on the leaves, stems, or grains of the rice plant. Fungal infections, bacterial diseases, or nutrient deficiencies can all be responsible for their occurrence. Fungal pathogens like brown spot are caused by Bipolaris oryzae. The effects of brown spots on rice plants highlight the importance of early detection, effective disease management strategies, and maintaining optimal growing conditions to mitigate the negative impact on crop health and yield.",
                ),
              SizedBox(height: 10,),

              //card 3
              MyCard(
                imagePath: 'lib/images/bacterial-blight.png',
                dname: 'Bacterial Blight',
                ddescription:"Bacterial blight, a concerning issue in rice cultivation, is attributed to the presence of the Xanthomonas oryzae, primarily affecting regions with warm and humid climates. It presents unique and easily recognizable visual indications. It is marked by the development of small, water-soaked lesions that first manifest as yellowish-green spots on the leaves, leaf sheaths, and panicles of rice plants. As the disease progresses, these lesions undergo a transformation, darkening into brown or black with a noticeable yellow halo. In advanced stages, the disease may induce streaking on the leaves and disrupt the normal development of panicles. Bacterial blight takes a significant toll on rice crops, causing not only reduced grain quality and yield but also stunted plant growth.",
                ),
              SizedBox(height: 10,),

              //card 4
              MyCard(
                imagePath: 'lib/images/leaf-smut.png',
                dname: 'Leaf Smut',
                ddescription: "Leaf smut, in rice plants is the result of an infection by the Ustilaginoidea virens fungus. The disease is marked by the appearance of small, initially green to whitish spore balls on rice panicles, which subsequently change into smoky gray to dark green or black formations. In severe cases, it can distort panicles and diminish grain quality. The fungus enters rice plants during the flowering stage and thrives within rice grains, eventually giving rise to the distinctive smut balls containing spores. Leaf smut poses a substantial threat to rice yields and quality, necessitating the use of strategies such as fungicides, disease-resistant rice varieties, and sound agricultural practices for effective management.",
                ),
              SizedBox(height: 10,),

              //card 5
              MyCard(
                imagePath: 'lib/images/tungro.png',
                dname: 'Tungro',
                ddescription: "Tungro is a viral disease of rice that is transmitted by leafhoppers. It is caused by two viruses: rice tungro spherical virus (RTSV) and rice tungro bacilliform virus (RTBV).Tungro disease, prevalent in rice crops across Southeast Asia, is caused by Nephotettix virescens (leafhopper) which acts as vector for transmitting viruses. This viral infection manifests in rice plants as leaf discoloration (yellowing or reddening), stunted growth leading to significant yield losses. Integrated pest management practices, and the monitoring of leafhopper populations to minimize the disease's impact and sustain rice production",
                ),

              SizedBox(height: 25,),
              Text('end of page', 
              style: TextStyle(fontSize: 14, 
              fontWeight: FontWeight.w500,
              color: Colors.grey[400],),),

              SizedBox(height: 25,),
            
            ],      
                  ),
          ),
        ),
          ),
    );
  }
}