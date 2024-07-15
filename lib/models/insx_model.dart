import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

class InsxModel {

  final String id;
  final String ca;
  final String pea_no;
  final String cus_name;
  final String cus_id;
  final String status;
  final String tel;
  final String invoice_no;
  final String bill_date;
  final String write_id;
  final String portion;
  final String address;
  final String new_period_date;
  final String write_date;
  final String total;
  final String lat;
  final String lng;
  final String invoice_status;
  final String noti_date;
  final String update_date;
  final String timestamp;
  final String work_date;
  final String work_image;
  final String work_image_lat;
  final String work_image_lng;
  final String worker_code;
  final String worker_name;
  final String user_id;
  final String distance;
  InsxModel({
    required this.id,
    required this.ca,
    required this.pea_no,
    required this.cus_name,
    required this.cus_id,
    required this.status,
    required this.tel,
    required this.invoice_no,
    required this.bill_date,
    required this.write_id,
    required this.portion,
    required this.address,
    required this.new_period_date,
    required this.write_date,
    required this.total,
    required this.lat,
    required this.lng,
    required this.invoice_status,
    required this.noti_date,
    required this.update_date,
    required this.timestamp,
    required this.work_date,
    required this.work_image,
    required this.work_image_lat,
    required this.work_image_lng,
    required this.worker_code,
    required this.worker_name,
    required this.user_id,
    required this.distance,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ca': ca,
      'pea_no': pea_no,
      'cus_name': cus_name,
      'cus_id': cus_id,
      'status': status,
      'tel': tel,
      'invoice_no': invoice_no,
      'bill_date': bill_date,
      'write_id': write_id,
      'portion': portion,
      'address': address,
      'new_period_date': new_period_date,
      'write_date': write_date,
      'total': total,
      'lat': lat,
      'lng': lng,
      'invoice_status': invoice_status,
      'noti_date': noti_date,
      'update_date': update_date,
      'timestamp': timestamp,
      'work_date': work_date,
      'work_image': work_image,
      'work_image_lat': work_image_lat,
      'work_image_lng': work_image_lng,
      'worker_code': worker_code,
      'worker_name': worker_name,
      'user_id': user_id,
      'distance': distance,
    };
  }

  factory InsxModel.fromMap(Map<String, dynamic> map) {
    return InsxModel(
      id: (map['id'] ?? '') as String,
      ca: (map['ca'] ?? '') as String,
      pea_no: (map['pea_no'] ?? '') as String,
      cus_name: (map['cus_name'] ?? '') as String,
      cus_id: (map['cus_id'] ?? '') as String,
      status: (map['status'] ?? '') as String,
      tel: (map['tel'] ?? '') as String,
      invoice_no: (map['invoice_no'] ?? '') as String,
      bill_date: (map['bill_date'] ?? '') as String,
      write_id: (map['write_id'] ?? '') as String,
      portion: (map['portion'] ?? '') as String,
      address: (map['address'] ?? '') as String,
      new_period_date: (map['new_period_date'] ?? '') as String,
      write_date: (map['write_date'] ?? '') as String,
      total: (map['total'] ?? '') as String,
      lat: (map['lat'] ?? '') as String,
      lng: (map['lng'] ?? '') as String,
      invoice_status: (map['invoice_status'] ?? '') as String,
      noti_date: (map['noti_date'] ?? '') as String,
      update_date: (map['update_date'] ?? '') as String,
      timestamp: (map['timestamp'] ?? '') as String,
      work_date: (map['work_date'] ?? '') as String,
      work_image: (map['work_image'] ?? '') as String,
      work_image_lat: (map['work_image_lat'] ?? '') as String,
      work_image_lng: (map['work_image_lng'] ?? '') as String,
      worker_code: (map['worker_code'] ?? '') as String,
      worker_name: (map['worker_name'] ?? '') as String,
      user_id: (map['user_id'] ?? '') as String,
      distance: (map['distance'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory InsxModel.fromJson(String source) => InsxModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
