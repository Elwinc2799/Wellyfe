class Appointment {
  final String appointmentID;
  final String patientID;
  final String doctorID;
  final DateTime appointmentDate;
  final String appointmentTime;

  Appointment(
    this.appointmentID,
    this.patientID,
    this.doctorID,
    this.appointmentDate,
    this.appointmentTime
  );

  static List<Appointment> appointmentDataList = [];

  static Appointment getNextAppointment() {
    DateTime now = DateTime.now();

    Appointment nextAppointment = appointmentDataList.reduce(
      (a, b) => a.appointmentDate.difference(now).abs() < b.appointmentDate.difference(now).abs()
          ? a : b
    );

    return nextAppointment;
  }
}