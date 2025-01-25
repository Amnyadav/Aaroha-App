import 'package:flutter/material.dart';

class News1 extends StatelessWidget {
  const News1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Praised by the ministry of Education"),
        titleTextStyle: TextStyle(fontSize: 25),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  "Ministry of Education Applauds Aaroha's Role in Empowering the Underprivileged..",
                  style:TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                    children: [
                      Text("27 Nov 2024",style: TextStyle(fontSize: 14)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'lib/images/X_icon.png',
                          width:20,
                          height:20,

                        ),
                      ),
                    ]
                ),
              ),



              const SizedBox(height: 16),

              Image.asset(
                'lib/images/post.jpg',
                height: 400,
                width: double.infinity,
                fit: BoxFit.scaleDown,
              ),




              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'The Ministry of Education recently posted on X , acknowledging the remarkable contributions of Aaroha in uplifting the underprivileged through education and social welfare. \n\n' ' Here\'s what they said:\n\n' '"As part of the MANIT chapter of Aaroha, an NGO, the institute empowers underprivileged children with quality education and organizes enriching events like science exhibitions and seminars on India\'s cultural heritage.\n"''Aaroha continues to work tirelessly towards creating a more inclusive and enquitable society. The recognition from education ministry is a testament to the organization\'s impactful initiatives and the dedication of its team \n\n  We thank the education ministry for their kind words and remain committed to our mission of tranformin lives through meaningful action',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
