// the following code is bad example,and showcase of what shrinkwrap for multiple scrollable widgets does
// this cost flutter to dicate the total space to be taken for those childrean which is against cost optimization
// it is optimal to use for single scrollable situation

// import 'package:flutter/material.dart';
// import 'package:learn_app/widgets/image_sample.dart';
// import 'package:learn_app/widgets/listview_sample.dart';

// class LayoutUnderstandingPage extends StatelessWidget {
//   const LayoutUnderstandingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Listview Checking')),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: <Widget>[
//               const Text('Testing Listview Error'),
//               Expanded(
//                 child: ListView(
//                   shrinkWrap: true,
//                   children: [
//                     ImageSample(),
//                     const SizedBox(height: 10),
//                     ImageSample(),
//                     const SizedBox(height: 10),
//                     ImageSample(),
//                     const SizedBox(height: 20),
//                     _innerListviewList(),
//                     ImageSample(),
//                     const SizedBox(height: 10),
//                     ImageSample(),
//                     const SizedBox(height: 10),
//                     ImageSample(),
//                     const SizedBox(height: 10),
//                   ],
//                 ),
//               ),
//               const Text('Testing Listview Error'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _innerListviewList() {
//     return ListView(
//       shrinkWrap: true,
//       children: [
//         ListviewSample(),
//         const SizedBox(height: 10),
//         ListviewSample(),
//         const SizedBox(height: 10),
//         ListviewSample(),
//         const SizedBox(height: 10),
//         ListviewSample(),
//         const SizedBox(height: 10),
//         ListviewSample(),
//         const SizedBox(height: 10),
//         ListviewSample(),
//         const SizedBox(height: 10),
//         ListviewSample(),
//         const SizedBox(height: 10),
//         ListviewSample(),
//         const SizedBox(height: 10),
//         ListviewSample(),
//         const SizedBox(height: 10),
//       ],
//     );
//   }
// }

// follwing is the cost optimzation against using shrinkwrap(listview,gridview)
// customscrollview,silverlist uses lazy-loading,it uses widget that are visible on screen
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:learn_app/widgets/image_sample.dart';
import 'package:learn_app/widgets/listview_sample.dart';

@RoutePage()
class LayoutUnderstandingPage extends StatelessWidget {
  const LayoutUnderstandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: const Text(
                  'NestedScrollView with Slivers',
                  style: TextStyle(color: Colors.white),
                ),
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(background: ImageSample()),
              ),
            ];
          },
          body: CustomScrollView(
            slivers: [
              // Outer list section with ImageSample widgets
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text('Outer List: ImageSample Widgets'),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  ImageSample(),
                  const SizedBox(height: 10),
                  ImageSample(),
                  const SizedBox(height: 10),
                  ImageSample(),
                  const SizedBox(height: 20),
                ]),
              ),

              // Inner sliver list of ListviewSample widgets
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text('Inner List: ListviewSample Widgets'),
                ),
              ),
              SliverFixedExtentList(
                itemExtent: 110,
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: const ListviewSample(),
                  ),
                  childCount: 10,
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text('More Outer List Items'),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  ImageSample(),
                  const SizedBox(height: 10),
                  ImageSample(),
                  const SizedBox(height: 10),
                  ImageSample(),
                  const SizedBox(height: 10),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
