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

struct  User {
    string name;
    string emial;
    uint168 phnum;
           string hospitalname;
}
 mapping(string => Host[])  patients ;

    mapping  ( string => User ) public  users;

function createaccount(string  memory name,string memory  hospitalname,string  memory email,uint168 phnum ) public {


User memory current;
current.name=name;
current.emial=email;
current.phnum=phnum;
current.hospitalname=hospitalname;

users[name]=current;



}



function getuseremial( string  memory uname)  public  view returns(string memory ){


 return   users[uname].emial;


}



function addpatient( string memory name,uint104 age, string memory hospitalname) public   {

// host current=host(name,age);



Host memory  patientdetails=Host(name,age);
patients[hospitalname].push(patientdetails);



}






}