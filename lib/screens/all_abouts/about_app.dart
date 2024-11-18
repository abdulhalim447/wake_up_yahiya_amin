import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("About App"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/about_app.jpg", height: 250.0,
              width: double.infinity,),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Wake Up একটি উদ্ভাবনী অ্যাপ, যা আপনাকে মানসিক ও শারীরিকভাবে সুস্থ থাকতে সহায়তা করবে। \n\nপ্রতিদিনের জীবনে প্রোডাক্টিভ কাজ যুক্ত করার মাধ্যমে এটি আপনার জীবনযাত্রার মান উন্নত করতে সহায়ক। অ্যাপটিতে প্রতিদিন কিছু নির্দিষ্ট টাস্ক দেওয়া হবে, যেমন: ইয়োগা করা, এক্সারসাইজ, কুরআন তিলাওয়াত, নামাজ আদায় এবং অন্যান্য প্রোডাক্টিভ কাজ। আপনি এই টাস্কগুলো সম্পন্ন করে আরও সংগঠিত এবং প্রেরণাদায়ক হতে পারবেন। \n\nএছাড়াও, প্রতিদিন একটি করে মোটিভেশনাল ভিডিও সরবরাহ করা হবে, যা দেখে আপনি অনুপ্রাণিত হতে পারবেন এবং নতুন দিনের জন্য ইতিবাচক মানসিকতা গড়ে তুলতে পারবেন।\n\nWake Up অ্যাপটি আপনার জীবনের প্রতিটি দিনকে আরও কার্যকরী, আনন্দময় এবং অর্থবহ করে তুলতে প্রতিশ্রুতিবদ্ধ।',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'kalpurush'

                ),


              ),
            )


          ],
        ),
      ),
    );
  }
}
