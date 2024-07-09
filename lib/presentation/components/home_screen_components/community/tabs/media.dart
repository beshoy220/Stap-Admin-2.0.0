import 'package:flutter/material.dart';
import 'package:stap_admin/app/meta.dart';

// The media section works as following:
// 1] It has 3 level max of inserted folders
// 2] Folders comes first then files
// 3] Files uses a file viwer package (YET)
class Media extends StatefulWidget {
  const Media({super.key});

  @override
  State<Media> createState() => _MediaState();
}

class _MediaState extends State<Media> {
  final Map<String, dynamic> fileSystem = {
    'root': {
      'name': 'Root folder',
      'type': 'folder',
      'children': [
        {
          'name': 'folder1',
          'type': 'folder',
          'children': [
            {
              'name': 'subfolder1',
              'type': 'folder',
              'children': [
                {'name': 'file5.txt', 'type': 'file'},
                {'name': 'file6.txt', 'type': 'file'},
              ],
            },
            {'name': 'file1.txt', 'type': 'file'},
            {'name': 'file2.txt', 'type': 'file'},
          ],
        },
        {
          'name': 'folder2',
          'type': 'folder',
          'children': [
            {
              'name': 'subfolder2',
              'type': 'folder',
              'children': [
                {'name': 'file7.txt', 'type': 'file'},
                {
                  'name': 'subsubfolder1',
                  'type': 'folder',
                  'children': [
                    {'name': 'file8.txt', 'type': 'file'},
                  ],
                },
              ],
            },
            {'name': 'file3.txt', 'type': 'file'},
          ],
        },
        {
          'name': 'folder3',
          'type': 'folder',
          'children': [
            {'name': 'file9.txt', 'type': 'file'},
          ],
        },
        {'name': 'file4.txt', 'type': 'file'},
      ],
    },
  };

  // The main path that we starts with.
  late List<Map<String, dynamic>> path = fileSystem['root']['children'];
  // This is paths record list that saves paths gone throught
  // so we can get back again for previous paths
  late List<List<Map<String, dynamic>>> pathsRecord = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
            color: meta.colorPallet.primary200,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (pathsRecord.isNotEmpty) {
                          path = pathsRecord.last;
                          pathsRecord.removeLast();
                        }
                      });
                    },
                    child: const SizedBox(
                      height: double.maxFinite,
                      child: Center(
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  height: double.maxFinite,
                  width: 1,
                  color: meta.colorPallet.grey300,
                ),
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: () {},
                    child: const SizedBox(
                      height: double.maxFinite,
                      child: Center(
                        child: Text('Add File'),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  height: double.maxFinite,
                  width: 1,
                  color: meta.colorPallet.grey300,
                ),
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: () {},
                    child: const SizedBox(
                      height: double.maxFinite,
                      child: Center(
                        child: Text('Add Folder'),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  height: double.maxFinite,
                  width: 1,
                  color: meta.colorPallet.grey300,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (pathsRecord.isNotEmpty) {
                          path = pathsRecord.first;
                          pathsRecord = [];
                        }
                      });
                    },
                    child: const SizedBox(
                      height: double.maxFinite,
                      child: Center(
                        child: Icon(Icons.house_outlined),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: path.length,
            itemBuilder: (BuildContext context, int index) {
              if (path[index]['type'] == 'folder') {
                return InkWell(
                  onTap: () {
                    setState(() {
                      pathsRecord.add(path);
                      path = path[index]['children'];
                    });
                  },
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.folder,
                          size: 28,
                          color: meta.colorPallet.primary600,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          path[index]['name'].toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.file_copy_outlined,
                          size: 28,
                          color: meta.colorPallet.primary600,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          path[index]['name'].toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
