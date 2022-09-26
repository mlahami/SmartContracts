// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0<0.9.0;
contract PatientRecord{

enum Gender{Male, Female}
struct Patient{
    string name;
    uint age;
    Gender gender;
}
uint id; // Id for the patient record
Patient private patient; // the patient we are referring to
address public recordOwner; // the address of the owner of the record
// These can be triggered for a JS script in front end
event PatientNameAccessed (address sender);
event PatientAccessed (address sender);
constructor (Gender g, uint age){
    recordOwner=msg.sender;
    patient.gender= g;
    patient.age=age;
}

function getPatientName() public returns (string memory _name){
    emit PatientNameAccessed(msg.sender);
    _name= patient.name;
}

function setPatientName(string memory name) public {
   // require (msg.sender==recordOwner);
    patient.name=name;
}

function getPatient() public returns (Patient memory ){
    emit PatientAccessed(msg.sender);
    return patient;
}

}
