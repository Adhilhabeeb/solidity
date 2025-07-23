// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract twitter {
  struct  Datereported{
      string date;
      string doctername;
      string docspecilist;

  }  
  
struct Host{
  string name;
   uint104 age;

   

}
mapping(string => mapping(string => Datereported[])) public Reports;


struct User {
    string name;
    string email;
    uint168 phnum;
    string hospitalname;
    mapping(string => Host[] ) patients; 

}
mapping(string => mapping(string => Host)) public patients;
    mapping  ( string => User ) public  users;
mapping  (string =>Host[]) public  allpatientshospital;
function createpatientaccount(string  memory name,string memory  hospitalname,string  memory email,uint168 phnum,uint age ) public {


User   storage  current =users[name];
current.name=name;
current.email=email;
current.phnum=phnum;
current.hospitalname=hospitalname;




}



function getuseremial( string  memory uname)  public  view returns(string memory ){


 return   users[uname].email;


}


//hospiyall
function addpatient( string memory name,uint104 age, string memory hospitalname,string  memory datereportedd,string memory doctername,string memory docterspecilist) public   {

// host current=host(name,age);
Datereported memory reported=Datereported(datereportedd,doctername,docterspecilist);


// Host storage  patientdetails;
// patientdetails.name=name;
// patientdetails.age=age;

// patients[hospitalname].push(patientdetails);

Host storage patientdetails=patients[hospitalname][name];

patientdetails.name=name;
patientdetails.age=age;     
allpatientshospital[hospitalname].push(  patientdetails);

Reports[hospitalname][name].push(reported);













}



function getuser(string  memory hospitalname, string memory name)  public  returns (Host memory)   {
   
    return  patients[hospitalname][name];

    
}



function getallpatientsinhospital( string memory hospitalname) public  returns (Host[] memory) {

    return  allpatientshospital[hospitalname];


}
function getreports(string  memory  hospitalname,string memory name) public  returns(Datereported  [] memory){
return  Reports[hospitalname][name];
}



}