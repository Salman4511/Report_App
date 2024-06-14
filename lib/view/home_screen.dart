import 'package:flutter/material.dart';
import 'package:report_app/controller/report_repo.dart';
import 'package:report_app/model/report_model/report_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final repo = ReportRepo();
  late Future<List<ReportModel>> _futureReports;

  @override
  void initState() {
    super.initState();
    _futureReports = repo.fetchReports();
  }

  void _refreshReports() {
    setState(() {
      _futureReports = repo.fetchReports();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<ReportModel>>(
              future: _futureReports,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Error: ${snapshot.error}'),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _refreshReports,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data available'));
                } else {
                  List<ReportModel> reports = snapshot.data!;
                  return ListView.builder(
                    itemCount: reports.length,
                    itemBuilder: (context, index) {
                      ReportModel report = reports[index];
                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(
                            report.title ?? '',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(report.content ?? ''),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.calendar_today,
                                  color: Colors.blue),
                              Text(report.createdAt
                                      ?.toLocal()
                                      .toString()
                                      .split(' ')[0] ??
                                  ''),
                            ],
                          ),
                          onTap: () {},
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          ElevatedButton(
            onPressed: _refreshReports,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              backgroundColor: Colors.yellow,
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: const Text('Refresh'),
          ),
        ],
      ),
    );
  }
}
