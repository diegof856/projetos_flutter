class ResponseApi {
  final String id;
  final String title;
  final String description;
  final String status; 
  final String date;
  final String time;
  final String naturalOccurrence; 
  final String eventType; 

  ResponseApi({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.date,
    required this.time,
    required this.naturalOccurrence,
    required this.eventType,
  });

  factory ResponseApi.fromJson(Map<String, dynamic> json) {
    final String occurrenceValue = json['OcorrenciaNatural'] as String;

    final String eventTypeResult = occurrenceValue.endsWith('ha')
        ? 'wildfires'
        : 'severeStorms';

    return ResponseApi(
      id: json['id'] as String,
      title: json['titulo'] as String,
      description: json['descricao'] as String,
      status: json['concluido'] as String,
      date: json['data'] as String,
      time: json['hora'] as String,
     
      naturalOccurrence: occurrenceValue, 
      
      eventType: eventTypeResult, 
    );
  }
}