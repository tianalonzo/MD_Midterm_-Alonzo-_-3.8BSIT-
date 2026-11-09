
import 'dart:io';

mixin TimestampMixin {
  DateTime createdAt = DateTime.now();
  String getDate() => createdAt.toString().substring(0, 19);
}

abstract class CenterRecord with TimestampMixin {
  int id;
  String name;

  CenterRecord(this.id, this.name);
  void displayDetails();
}

class LearningResource extends CenterRecord {
  String _category;
  int _copies;

  LearningResource(int id, String name, this._category, this._copies)
      : super(id, name);

  int get copies => _copies;

  void borrow() {
    if (_copies > 0) {
      _copies--;
      print('Borrowed successfully!');
    } else {
      print('No copies available!');
    }
  }

  void returnItem() => _copies++;

  @override
  void displayDetails() {
    print('Resource: $name | ID: $id');
    print('Category: $_category | Copies: $_copies');
    print('Date: ${getDate()}');
  }
}

class Participant extends CenterRecord {
  String _email;
  int _borrowed = 0;

  Participant(int id, String name, this._email) : super(id, name);

  int get borrowed => _borrowed;

  void borrowItem() => _borrowed++;

  void returnItem() {
    if (_borrowed > 0) _borrowed--;
  }

  @override
  void displayDetails() {
    print('Participant: $name | ID: $id');
    print('Email: $_email | Borrowed: $_borrowed');
    print('Date: ${getDate()}');
  }
}

List<LearningResource> resources = [];
List<Participant> participants = [];

Map<int, LearningResource> resourceMap = {};
Map<int, Participant> participantMap = {};

String getInput(String message) {
  while (true) {
    stdout.write(message);
    String? value = stdin.readLineSync();
    if (value != null && value.trim().isNotEmpty) return value.trim();
    print('Invalid input!');
  }
}

int getNumber(String message) {
  while (true) {
    try {
      int n = int.parse(getInput(message));
      if (n >= 0) return n;
    } catch (_) {}
    print('Enter a valid non-negative number!');
  }
}

void addResource() {
  int id = getNumber('Resource ID: ');
  if (resourceMap.containsKey(id)) {
    print('ID already exists!');
    return;
  }

  var r = LearningResource(
    id,
    getInput('Resource Name: '),
    getInput('Category: '),
    getNumber('Available Copies: '),
  );

  resources.add(r);
  resourceMap[id] = r;
  print('Resource added successfully!');
}

void registerParticipant() {
  int id = getNumber('Participant ID: ');
  if (participantMap.containsKey(id)) {
    print('ID already exists!');
    return;
  }

  String name = getInput('Name: ');
  String email = getInput('Email: ');

  if (!email.contains('@') || !email.contains('.')) {
    print('Invalid email!');
    return;
  }

  var p = Participant(id, name, email);
  participants.add(p);
  participantMap[id] = p;
  print('Participant registered successfully!');
}

void viewRecords() {
  List<CenterRecord> records = [...resources, ...participants];

  if (records.isEmpty) {
    print('No records available!');
    return;
  }

  for (var record in records) {
    record.displayDetails();
    print('-------------------------');
  }
}

void borrowResource() {
  var p = participantMap[getNumber('Participant ID: ')];
  var r = resourceMap[getNumber('Resource ID: ')];

  if (p == null || r == null) {
    print('Record not found!');
  } else if (r.copies > 0) {
    r.borrow();
    p.borrowItem();
  } else {
    print('No copies available!');
  }
}

void returnResource() {
  var p = participantMap[getNumber('Participant ID: ')];
  var r = resourceMap[getNumber('Resource ID: ')];

  if (p == null || r == null) {
    print('Record not found!');
  } else if (p.borrowed > 0) {
    p.returnItem();
    r.returnItem();
    print('Returned successfully!');
  } else {
    print('No borrowed resources!');
  }
}

void main() {
  bool running = true;

  while (running) {
    print('''
====================================
 COMMUNITY LEARNING CENTER SYSTEM
====================================
1. Add Resource
2. Register Participant
3. View Records
4. Borrow Resource
5. Return Resource
6. Exit
====================================
''');

    switch (getInput('Choose (1-6): ')) {
      case '1': addResource(); break;
      case '2': registerParticipant(); break;
      case '3': viewRecords(); break;
      case '4': borrowResource(); break;
      case '5': returnResource(); break;
      case '6':
        print('Thank you for using the system!');
        running = false;
        break;
      default: print('Invalid choice!');
    }
  }
}
