// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract twitter {
    

struct Host{
  string name;
   uint104 age;
}

struct User {
    string name;
    string email;
    uint168 phnum;
    string hospitalname;
    // mapping(string => Host[]) patients; // mapping of disease => patient history

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
function addpatient( string memory name,uint104 age, string memory hospitalname) public   {

// host current=host(name,age);



Host memory  patientdetails=Host(name,age);
// patients[hospitalname].push(patientdetails);
patients[hospitalname][name]=patientdetails;
allpatientshospital[hospitalname].push(patientdetails);


}



function getuser(string  memory hospitalname, string memory name)  public  view   returns(  Host memory )     {
   
    return  patients[hospitalname][name];

    
}



function getallpatientsinhospital( string memory hospitalname) public  returns (Host[] memory) {

    return  allpatientshospital[hospitalname];


}



}