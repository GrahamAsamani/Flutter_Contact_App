
import 'package:contact_details/contact_details_view.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
 
import 'contact_model.dart';
 
class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
 
  final ScrollController _scrollController = ScrollController();
 
  final List<Map<String, String>> data = [
    {
      "name": "Graham Asamani",
      "phone": "0545238463",
      "email": "nonummy.ac@outlook.couk",
      "country": "Ghana",
      "region": "central"
    },
    {
      "name": "Teddy",
      "phone": "0544669456",
      "email": "learnfromthewise@gmail.com",
      "country":"cote deivoire",
      "region": "ashanti region"
    },
    {
      "name": "Benbela",
      "phone": "0243122179",
      "email": "vel@google.com",
      "country": "Ghana",
      "region": "Central"
    },
    {
      "name": "Baebae",
      "phone": "0244013371",
      "email": "eros.proin.ultrices@hotmail.com",
      "country": "Usa",
      "region": "califonia"
    },
    {
      "name": "Debby baby",
      "phone": "024566584",
      "email": "at.egestas@aol.couk",
      "country": "Austraila",
      "region": "Canda"
    },
    {
      "name": "lawrencia Baby",
      "phone": "054988815",
      "email": "proin.nisl@icloud.org",
      "country": "United Kingdom",
      "region": "breimingam"
    },
    {
      "name": "Victoria",
      "phone": "0503435557",
      "email": "non@yahoo.couk",
      "country": "Canada",
      "region": "jurga"
    },
    {
      "name": "osomex",
      "phone": "059483166",
      "email": "molestie.in@yahoo.ca",
      "country": "China",
      "region": "North Island"
    },
    {
      "name": "Sahara baby",
      "phone": "024404998",
      "email": "non@google.couk",
      "country": "Turkey",
      "region": "Bigben"
    },
    {
      "name": "Daddy",
      "phone": "0244954648",
      "email": "sagittis.augue@google.edu",
      "country": "south Africa",
      "region": "CAPE Verd"
    }
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'My Contacts',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('images/image 3.png'),
              ),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Search by name or number',
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recent',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ContactDetailsView(
                            contact: Contact(
                                country: 'Ghana',
                                email: 'seekingthekingdom16@gmail.com',
                                name: 'Graham asamani',
                                phone: '0596552367',
                                region: 'Central Region'));
                      }));
                    },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('images/image 2.png'),
                    ),
                    title: const Text(
                      'Sahara Baby',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text('+233 24 54 36 757'),
                    trailing: const IconButton(
                        onPressed: null, icon: Icon(Icons.more_horiz)),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 25,
                    thickness: 2,
                  );
                },
                itemCount: 3),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Contacts',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            GroupedListView<Map<String, String>, String>(
              shrinkWrap: true,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    groupByValue.substring(0, 1),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ContactDetailsView(
                            contact: contact,
                          );
                        }));
                      },
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('images/image 1.png'),
                      ),
                      title: Text(
                        '${element['name']}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${element['phone']}'),
                      trailing: const IconButton(
                          onPressed: null, icon: Icon(Icons.more_horiz)),
                    ),
                    const Divider(
                      indent: 25,
                      thickness: 2,
                    )
                  ],
                );
              },
              itemComparator: (item1, item2) =>
                  item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1A4ADA),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
} 