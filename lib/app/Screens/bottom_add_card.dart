import 'package:etec_center/Services/Student_detail.dart';
import 'package:etec_center/Services/Student_service.dart';
import 'package:etec_center/app/model/register_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class Add_Card extends StatefulWidget {
  const Add_Card({
    Key? key,
  }) : super(key: key);

  @override
  State<Add_Card> createState() => _Add_CardState();
}

class _Add_CardState extends State<Add_Card> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          "List Student",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
      ),
      body: StreamBuilder<List<Student_register>>(
        stream: StudentService().getPeople(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              var data = snapshot.data![index];

              return Slidable(
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Student_detail(people: data))),
                      backgroundColor: const Color(0xFF0392CF),
                      foregroundColor: Colors.white,
                      icon: Icons.edit,
                      label: 'Edit',
                    ),
                    SlidableAction(
                      onPressed: (context) => StudentService().deletePeople(data.name.toString()),
                      backgroundColor: const Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: Card(
                  color: const Color.fromARGB(179, 219, 225, 236),
                  child: ListTile(
                    leading: SizedBox(
                      width: 70,
                      height: 70,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          data.photo ??
                              'https://3znvnpy5ek52a26m01me9p1t-wpengine.netdna-ssl.com/wp-content/uploads/2017/07/noimage_person.png',
                        ),
                      ),
                    ),
                    title: Text(
                      data.name ?? "Student Name",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      data.subject ?? "Subject Study",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    trailing: Text(
                      data.sex ?? "sex",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 0,
            ),
            itemCount: snapshot.data!.length,
          );
        },
      ),
    );
  }
}
