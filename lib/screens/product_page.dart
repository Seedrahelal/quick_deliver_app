import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void productPage(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.only(left: 20, right: 20),
        shadowColor: const Color.fromARGB(255, 4, 48, 118),
        elevation: 200,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
        ),
        child: SizedBox(
          height: 720,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name Product',
                  style: TextStyle(
                    wordSpacing: 8,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 3, 47, 122),
                    fontSize: 35,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 270,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 248, 169, 84),
                        blurRadius: 5,
                      ),
                    ],
                    color: const Color.fromARGB(255, 235, 180, 122),
                    border: Border.all(
                      color: const Color.fromARGB(255, 196, 104, 6),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.asset(
                      'assets/store/photo_2024-12-22_15-16-53.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  '* Description : It lasts for a long time and is highly efficient',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 3, 47, 122),
                    fontSize: 18,
                  ),
                ),
                const Text(
                  '* ID : 154851',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 3, 47, 122),
                    fontSize: 18,
                  ),
                ),
                const Text(
                  '* Price : 60000',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 3, 47, 122),
                    fontSize: 18,
                  ),
                ),
                const Text(
                  '* Number Of Product : 20',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 3, 47, 122),
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    const Text(
                      "Buy now :",
                      style: TextStyle(
                        shadows: [
                          BoxShadow(
                            color: Color.fromARGB(255, 251, 131, 3),
                            blurRadius: 30,
                            spreadRadius: 20,
                          ),
                        ],
                        color: Color.fromARGB(255, 3, 47, 122),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(flex: 1),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 3, 47, 122),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      height: 40,
                      width: 155,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.cartPlus,
                          color: Colors.white,
                          size: 22,
                        ),
                        label: const Text(
                          'Cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      "Loved it :",
                      style: TextStyle(
                        shadows: [
                          BoxShadow(
                            color: Color.fromARGB(255, 251, 131, 3),
                            blurRadius: 30,
                            spreadRadius: 20,
                          ),
                        ],
                        color: Color.fromARGB(255, 3, 47, 122),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(flex: 1),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 3, 47, 122),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      height: 40,
                      width: 155,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.gratipay,
                          color: Colors.white,
                          size: 26,
                        ),
                        label: const Text(
                          'Favorite',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}







//  void _showDeleteConfirmationDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           elevation: 100,
//           shadowColor: const Color(0xffC678D7),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           title: const Text(
//             'Confirm Deletion....!',
//             style: TextStyle(fontSize: 23),
//           ),
//           content: const Text(
//             'Are you sure you want to delete this note ??',
//             style: TextStyle(fontSize: 17),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text(
//                 'Cancel',
//                 style: TextStyle(fontSize: 18),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: const Text(
//                 'Delete',
//                 style: TextStyle(fontSize: 18),
//               ),
//               onPressed: () {
//                 note.delete();
//                 BlocProvider.of<NotesCubit>(context).fetchAllNotes();
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
