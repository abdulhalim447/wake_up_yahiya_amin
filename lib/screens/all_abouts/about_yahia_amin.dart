import 'package:flutter/material.dart';

class AboutYahiyaAmin extends StatelessWidget {
  const AboutYahiyaAmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("ইয়াহিয়া আমিন সম্পর্কে"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/yahiya_amin.png", height: 250.0,
              width: double.infinity,),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'ইয়াহিয়া আমিন একজন বাংলাদেশি মনোবিজ্ঞানী, উদ্যোক্তা এবং বিনিয়োগকারী। তিনি ইউনিভার্সিটি অব লন্ডন থেকে মনোবিজ্ঞানে স্নাতকোত্তর ডিগ্রি অর্জন করেছেন। ইয়াহিয়া আমিন লাইফস্প্রিং এর ফাউন্ডার, যেখানে তিনি মানসিক স্বাস্থ্যসেবা প্রদান করেন।',
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
