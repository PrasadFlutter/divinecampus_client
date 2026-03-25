// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(
            fontFamily: 'Jost',
            color: Color(0xffe00040),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Color(0xffe00040)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink.shade50, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.pink.shade100),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    height: 88,
                    width: 88,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Image.asset('assets/images/splash/divlogo.PNG'),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Divine Campus',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffe00040),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text:
                              'Divine Campus is the most comprehensive online resource for spiritual processes in Human Life and in the Cosmos. This multifaith and interspiritual website, founded by ',
                        ),
                        const TextSpan(
                          text: 'Shree Anand Krishna',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                          text:
                              ', is devoted to resources for spiritual journeys, with a mission to help people find and walk a spiritual path that instils comfort, hope, strength and happiness for people who are exploring their own faith or are curious about others, huge number of poems written by ',
                        ),
                        const TextSpan(
                          text: 'Shree Anand Krishna',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                          text:
                              ' which cover a broad range of topics under the umbrella of Divinity and Spirituality, awakening to absolute awareness, theology of God, the lives and teachings of sages and saints, articles on our mystical traditions, world religions, powers of consciousness and meditation, sacred relationships, eternal life and more.',
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // _InfoCard(
            //   title: 'Who We Are',
            //   description:
            //       'Divine Campus offers curated spiritual and educational content including books, symbols, quotations, music, videos, and daily features.',
            //   icon: Icons.groups_outlined,
            // ),
            // const SizedBox(height: 10),
            // _InfoCard(
            //   title: 'Our Vision',
            //   description:
            //       'To make value-based wisdom and devotional knowledge accessible through a simple and engaging mobile experience.',
            //   icon: Icons.visibility_outlined,
            // ),
            // const SizedBox(height: 10),
            // _InfoCard(
            //   title: 'Contact',
            //   description:
            //       'R-257, Lower Ground Floor\nGreater Kailash - I, New Delhi - 110048\nWebsite: divinecampus.com',
            //   icon: Icons.location_on_outlined,
            // ),
          ],
        ),
      ),
    );
  }
}

// class _InfoCard extends StatelessWidget {
//   final String title;
//   final String description;
//   final IconData icon;

//   const _InfoCard({
//     required this.title,
//     required this.description,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.zero,
//       elevation: 2,
//       shadowColor: Colors.black.withOpacity(0.08),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
//       child: Padding(
//         padding: const EdgeInsets.all(14),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.pink.shade50,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Icon(icon, color: const Color(0xffe00040), size: 20),
//             ),
//             const SizedBox(width: 10),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontFamily: 'Jost',
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   const SizedBox(height: 6),
//                   Text(
//                     description,
//                     style: TextStyle(
//                       fontFamily: 'Jost',
//                       fontSize: 13.5,
//                       height: 1.4,
//                       color: Colors.grey.shade700,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
