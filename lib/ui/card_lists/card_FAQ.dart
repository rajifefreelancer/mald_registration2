import 'package:flutter/material.dart';
import 'package:mald_registration_app02/widgets/my_divider_widget.dart';

class CardFAQ extends StatefulWidget {
  const CardFAQ({super.key});

  @override
  State<CardFAQ> createState() => _CardFAQState();
}

class _CardFAQState extends State<CardFAQ> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            "FREQUENTLY ASKED QUESTIONS",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          myDivider(24),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            width: 1.5, color: const Color(0xffcddeff))),
                    child: ExpansionTile(
                      shape: Border.all(
                          width: 0.0, color: Colors.white.withOpacity(0)),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      tilePadding: const EdgeInsets.symmetric(horizontal: 12.0),
                      childrenPadding: const EdgeInsets.only(
                          left: 24.0, right: 24.0, bottom: 8.0),
                      title: const Text(
                        "What is the cut-off point for the age level that corresponds to the grade level ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        myDivider(4),
                        const Text("Age Appropriate for different levels:-"),
                        const SizedBox(height: 6.0),
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  // "•	Foundation (Age 2.0 years-3.0 years)\n•	Pre-Nursery (Age 3.0-4.0 years)\n•	Nursery (Age *4.0 years-5.0 years)\n•	KG (Age 5.0years-6.0 years)\n•	Preparatory (Age 6.0 years+)\n•	Grade 1 (Age 7 years+)\n•	Grade 2 (Age 8 years+)"),
                                  "•	Foundation\n (Age 2.0 years-3.0 years)\n•	Pre-Nursery\n (Age 3.0-4.0 years)\n•	Nursery\n (Age *4.0 years-5.0 years)\n•	KG (Age 5.0years-6.0 years)\n•	Preparatory\n (Age 6.0 years+)\n•	Grade 1 (Age 7 years+)\n•	Grade 2 (Age 8 years+)\n•	Grade 3 (Age 9 years+)\n•	Grade 4 (Age 10 years+)\n•	Grade 5 (Age 11years+)\n•	Grade 6 (Age 12 years+)\n•	Grade 7 (Age 13 years+)\n•	Grade 8 (Age 14 years+)"),
                              // SizedBox(width: 20),
                              // Text(
                              //     "•	Grade 3 (Age 9 years+)\n•	Grade 4 (Age 10 years+)\n•	Grade 5 (Age 11years+)\n•	Grade 6 (Age 12 years+)\n•	Grade 7 (Age 13 years+)\n•	Grade 8 (Age 14 years+)"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        const Text(
                            "* NB- MALD strictly applies the age limit for each level. However, as there is a possibility that there is a few moths gap for the children to reach at this age level at the beginning of the academic year, Hence, by the beginning of the academic year, they are expected to be at least be 3 years and 9 months for December 31st to be the cut -off date for accepting the age level specified."),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            width: 1.5, color: const Color(0xffcddeff))),
                    child: ExpansionTile(
                      shape: Border.all(
                          width: 0.0, color: Colors.white.withOpacity(0)),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      tilePadding: const EdgeInsets.symmetric(horizontal: 12.0),
                      childrenPadding: const EdgeInsets.only(
                          left: 24.0, right: 24.0, bottom: 8.0),
                      title: const Text(
                        "Why is it mandatory to follow such cut-off points ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        myDivider(16.0),
                        const Text(
                            "For Nursery, the chance is given for those children that are nearly going to be four years (at least 3.9 years of age at the beginning of the academic year. December 31st is the cut -off date for accepting age 4 for Nursery. The Federal Democratic Republic of Ethiopia, Ministry of Education has declared that the official age for children to be engaged in education is 4 years. Moreover, the children's level of maturity (socially, emotionally, cognitively) are all directly related to their age. According to our observation, those children that are lagging behind academically (we refer them as late bloomers) are those children whose age levels below the age levels of their peers in the respective classes. Moreover, the Cambridge curriculum also requires specific age limits."),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            width: 1.5, color: const Color(0xffcddeff))),
                    child: ExpansionTile(
                      shape: Border.all(
                          width: 0.0, color: Colors.white.withOpacity(0)),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      tilePadding: const EdgeInsets.symmetric(horizontal: 12.0),
                      childrenPadding: const EdgeInsets.only(
                          left: 24.0, right: 24.0, bottom: 8.0),
                      title: const Text(
                        "What is the meaning of a capital levy ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        myDivider(16.0),
                        const Text(
                            "Capital levy is a one- time payment that the school requests newly admitted students to pay. MALD is a school which went through a slow natural growth process to reach to the level that it is now. The good investment on the human and other resources that were made in the earlier years is the basis for this growth. As the number of students increases, there is a need to maintain the growth momentum. Those newly admitted students are lucky enough to join at this growth level. Hence, they are requested to pay ETB 40,000 at entrance point."),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            width: 1.5, color: const Color(0xffcddeff))),
                    child: ExpansionTile(
                      shape: Border.all(
                          width: 0.0, color: Colors.white.withOpacity(0)),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      tilePadding: const EdgeInsets.symmetric(horizontal: 12.0),
                      childrenPadding: const EdgeInsets.only(
                          left: 24.0, right: 24.0, bottom: 8.0),
                      title: const Text(
                        "How many quarters are there in a year ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        myDivider(16.0),
                        const Text("There are three quarters in a year."),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            width: 1.5, color: const Color(0xffcddeff))),
                    child: ExpansionTile(
                      shape: Border.all(
                          width: 0.0, color: Colors.white.withOpacity(0)),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      tilePadding: const EdgeInsets.symmetric(horizontal: 12.0),
                      childrenPadding: const EdgeInsets.only(
                          left: 24.0, right: 24.0, bottom: 8.0),
                      title: const Text(
                        "How many children are we going to be in a class ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        myDivider(16.0),
                        const Text(
                            "The maximum number of students in a class is 30."),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            width: 1.5, color: const Color(0xffcddeff))),
                    child: ExpansionTile(
                      shape: Border.all(
                          width: 0.0, color: Colors.white.withOpacity(0)),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      tilePadding: const EdgeInsets.symmetric(horizontal: 12.0),
                      childrenPadding: const EdgeInsets.only(
                          left: 24.0, right: 24.0, bottom: 8.0),
                      title: const Text(
                        "Why is wood chips used on the playground ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        myDivider(16.0),
                        const Text(
                            "The concern regarding the playground having wood chips led to the request for replacing it with rubber as most school does. We would like to bring to your attention that MALD is very concerned about your child safety than beauty. Safety comes first for us! \nWe have based our decision on researches for choosing wood chips than rubber.  Research shows that natural is always safer, and safety should be prioritized when considering the well- being of children. Recycled rubber mulch releases gaseous volatile organic compounds, also known as VOCs. The release of these gases is accelerated by heat. VOCs can lead to health issues, such as nausea, liver and kidney damage, sinus irritation, and more. \nWood playground mulch, on the other hand, is a safe choice that will considerably reduce the impact of a fall without releasing harmful chemicals."),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            width: 1.5, color: const Color(0xffcddeff))),
                    child: ExpansionTile(
                      shape: Border.all(
                          width: 0.0, color: Colors.white.withOpacity(0)),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      tilePadding: const EdgeInsets.symmetric(horizontal: 12.0),
                      childrenPadding: const EdgeInsets.only(
                          left: 24.0, right: 24.0, bottom: 8.0),
                      title: const Text(
                        "There are stairs and how can the children at pre-primary level be safe in this physical set-up ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        myDivider(16.0),
                        const Text(
                            "MALD puts safety first. Moreover, MALD would like to bring up children that are strong and resilient that shouldn't only expect to pass through a highly protective physical environment. The staff in MALD are also caring and supportive."),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            width: 1.5, color: const Color(0xffcddeff))),
                    child: ExpansionTile(
                      shape: Border.all(
                          width: 0.0, color: Colors.white.withOpacity(0)),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      tilePadding: const EdgeInsets.symmetric(horizontal: 12.0),
                      childrenPadding: const EdgeInsets.only(
                          left: 24.0, right: 24.0, bottom: 8.0),
                      title: const Text(
                        "How does MALD handle Cambridge checkpoint exams ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        myDivider(16.0),
                        const Text(
                            "The Cambridge curriculum has checkpoints at Year 2, 6 and 9.  MALD recognizes that for the Year 2, the children will not be ready, we cannot make the year 2 students sit for the checkpoint exam. In the next academic year 2024-2025, MALD will make Year 6 and Year 9 students sit for the checkpoint exams. The exam are mainly the following subjects- English, Math and Science."),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            width: 1.5, color: const Color(0xffcddeff))),
                    child: ExpansionTile(
                      shape: Border.all(
                          width: 0.0, color: Colors.white.withOpacity(0)),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      tilePadding: const EdgeInsets.symmetric(horizontal: 12.0),
                      childrenPadding: const EdgeInsets.only(
                          left: 24.0, right: 24.0, bottom: 8.0),
                      title: const Text(
                        "How does the National level exams (Grade 6, 8 and 12) handled in MALD ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        myDivider(16.0),
                        const Text(
                            "MALD School follows the Cambridge curriculum from the year 1 onwards (Prep and onwards). In Ethiopia, as the medium of instruction for grade 6 and below is Amharic, the National Exam for grade 6 is also conducted in Amharic. This makes it difficult for our students to compete with others. Therefore except grade 6, MALD facilitates for the students of grade 8 to sit for the National Exam."),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            width: 1.5, color: const Color(0xffcddeff))),
                    child: ExpansionTile(
                      shape: Border.all(
                          width: 0.0, color: Colors.white.withOpacity(0)),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      tilePadding: const EdgeInsets.symmetric(horizontal: 12.0),
                      childrenPadding: const EdgeInsets.only(
                          left: 24.0, right: 24.0, bottom: 8.0),
                      title: const Text(
                        "What are the school opening and closing times ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        myDivider(16.0),
                        const Text(
                            "Students are expected to be in the compound by 8:20 AM as the morning assembly program takes place starting from 8:20 AM. Teachers encourage and guide students to do stretching exercises and dances using motivational songs so that they are energized to be active during the day. The Ethiopian National Anthem is sung and students in line go to their respective classes at 8:40 AM. The compound's main gate is closed from 8:30 AM.   Any parent that arrives after 8:30am, he/she is required to report to the school office, take the permission slip/tardy slip for getting his/her child in the classroom. The school doesn't accept students for the day after 8: 45 AM.\nThis applies for CMC branch but for the other Campuses the end of the school time for the pre-primary compound children is at 2:45 PM and for the primary compound is 3:15 PM. The school expects all students to be picked up latest by 4:00 PM. Parents that couldn't arrive for any reason within this time to pick-up their children, they are required to notify the school through telephone so that temporary arrangement is made to wait for the late pick-up. As the school office ends the day by 5:00 PM, the late parents shouldn't go beyond 5:00 PM as a final pick-up time."),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            width: 1.5, color: const Color(0xffcddeff))),
                    child: ExpansionTile(
                      shape: Border.all(
                          width: 0.0, color: Colors.white.withOpacity(0)),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      tilePadding: const EdgeInsets.symmetric(horizontal: 12.0),
                      childrenPadding: const EdgeInsets.only(
                          left: 24.0, right: 24.0, bottom: 8.0),
                      title: const Text(
                        "What subject and language is offered in the School ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        myDivider(16.0),
                        const Text(
                            "English, Amharic, Math, Science, Global Perspective (Social Studies), Character Development, Sports, Art or Art and Craft, Music, Mandarin"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            width: 1.5, color: const Color(0xffcddeff))),
                    child: ExpansionTile(
                      shape: Border.all(
                          width: 0.0, color: Colors.white.withOpacity(0)),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      tilePadding: const EdgeInsets.symmetric(horizontal: 12.0),
                      childrenPadding: const EdgeInsets.only(
                          left: 24.0, right: 24.0, bottom: 8.0),
                      title: const Text(
                        "How do I report my child's absence from school ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        myDivider(16.0),
                        const Text(
                            "If your child is unwell or unable to attend school, notify the school Administration on the 	date your child is missing class."),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            width: 1.5, color: const Color(0xffcddeff))),
                    child: ExpansionTile(
                      shape: Border.all(
                          width: 0.0, color: Colors.white.withOpacity(0)),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      tilePadding: const EdgeInsets.symmetric(horizontal: 12.0),
                      childrenPadding: const EdgeInsets.only(
                          left: 24.0, right: 24.0, bottom: 8.0),
                      title: const Text(
                        "What clubs or extracurricular activities are available ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        myDivider(16.0),
                        const Text(
                            "We are planning to offer various clubs, sports, and activities. Inquire about the options available for your child to participate in after-school programs."),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            width: 1.5, color: const Color(0xffcddeff))),
                    child: ExpansionTile(
                      shape: Border.all(
                          width: 0.0, color: Colors.white.withOpacity(0)),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      tilePadding: const EdgeInsets.symmetric(horizontal: 12.0),
                      childrenPadding: const EdgeInsets.only(
                          left: 24.0, right: 24.0, bottom: 8.0),
                      title: const Text(
                        "How can I communicate with teachers ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        myDivider(16.0),
                        const Text(
                            "Teachers appreciate open communication immediately after school hour from 3:30 PM - 4:00 PM.   Note that it should not be in the morning."),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
