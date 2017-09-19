# Doctors Office

## Program that stores doctor and patient data to be accessed by admins, doctors, and patients

## Specifications

* Program creates instance of doctor with Doctor class when given name and speciality.
  * Example Input: "Dr. Smith", "Pediatrician"
  * Example Output: "Dr. Smith", "Pediatrician"
* Program saves each doctor and details to database.
  * Example Input: doctor.save()
  * Example Output: [doctor]
* Program returns list of doctors.
  * Example Input: Doctor.all()
  * Example Output: [doctor1, doctor2]
* Program creates instance of patient with Patient class when given name and dob.
  * Example Input: "Suzie", "2004-04-20"
  * Example Output: "Suzie", "2004-04-20"
* Program saves each patient and details to database.
  * Example Input: patient.save()
  * Example Output: [patient]
* Program returns list of patients.
  * Example Input: Patient.all()
  * Example Output: [patient1, patient2]
