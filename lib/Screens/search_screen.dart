import 'package:flutter/material.dart';
import 'package:imbd_app_task/Dimensions/dimensions.dart';
import 'package:imbd_app_task/movie_data/movie_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Map> foundMatches = [];
  bool noMatchesFound = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foundMatches = MovieData.MovieDataList;
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(title: Container(child: TextField(decoration: InputDecoration(border: OutlineInputBorder()))),backgroundColor: Colors.white,elevation: 0,),
        body: Container(
          height: Dimensions.totalScreenHeight,
          width: Dimensions.totalScreenWidth,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  // color: Colors.brown.withOpacity(0.5),
                  margin: EdgeInsets.all(3),
                  child: TextField(
                    controller: controller,
                    onChanged: (value) {
                      filterMovie(value);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search Here',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  // color: Colors.green,
                ),
              ),

              Expanded(
                flex: 8,
                child: Container(
                  // color: Colors.blue,
                  child: noMatchesFound
                      ? Center(child: Text('Not Available'))
                      : GridView.builder(
                          itemCount: foundMatches.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.6, crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(5),
                              color: Colors.grey.withOpacity(0.5),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      child: Text(
                                        foundMatches[index]['movie_name'],
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Colors.blue,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                foundMatches[index]['country'],
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                'Ratings: ${foundMatches[index]['rating']}',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
          // color: Colors.blue.withOpacity(0.5),
        ),
      ),
    );
  }

  void filterMovie(String value) {
    if (value.isEmpty) {
      foundMatches = MovieData.MovieDataList;
    } else {
      foundMatches = MovieData.MovieDataList.where((element) =>
          element['movie_name']
              .toString()
              .toLowerCase()
              .contains(value.toString().toLowerCase()) ||
          element['country']
              .toString()
              .toLowerCase()
              .contains(value.toString().toLowerCase()) ||
          element['rating']
              .toString()
              .toLowerCase()
              .contains(value.toString().toLowerCase())).toList();
      if (foundMatches.isEmpty) {
        noMatchesFound = true;
      } else {
        noMatchesFound = false;
      }
    }
    setState(() {});
  }
}
