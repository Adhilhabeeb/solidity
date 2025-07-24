// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

import "github/RollaProject/solidity-datetime/contracts/DateTime.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
contract Twitter   {


  struct  Datereported{
      string date;
      string doctername;
      string docspecilist;

  }  
  
struct Host{
  string name;
   uint104 age;
string bloodgroup;
   

}
mapping(string => mapping(string => Datereported[])) public Reports;


struct User {
    string name;
    string email;
    uint168 phnum;
    string hospitalname;
    mapping(string => Host[] ) reportsar; 

}
mapping(string => mapping(string => Host)) public patients;
    mapping  ( string => User ) public  users;
mapping  (string =>Host[]) public  allpatientshospital;



//checking crtainguserofhostital
modifier   checkpatientonhosputl (string memory hospitanname,string memory patietname) {
require(  bytes(patients[hospitanname][patietname].name ).length>1 , "sorry noyt foihdd");
_;
}
function createpatientaccount(string  memory name,string memory  hospitalname,string  memory email,uint168 phnum,uint age ) public checkpatientonhosputl(hospitalname,name) {


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
function addpatient( string memory name,string  memory blood,uint104 age, string memory hospitalname,string  memory datereportedd,string memory doctername,string memory docterspecilist) public   {

// host current=host(name,age);
Datereported memory reported=Datereported(getDate(),doctername,docterspecilist);


// Host storage  patientdetails;
// patientdetails.name=name;
// patientdetails.age=age;

// patients[hospitalname].push(patientdetails);

Host storage patientdetails=patients[hospitalname][name];

patientdetails.name=name;
patientdetails.age=age;  
patientdetails.bloodgroup=   blood;

allpatientshospital[hospitalname].push(  patientdetails);

Reports[hospitalname][name].push(reported);















}

function getDate() public   view  returns (string memory)  {
         (uint year, uint month, uint day)= DateTime.timestampToDate(block.timestamp);
 string memory yearstr=Strings.toString(year);
 string memory monthstr=Strings.toString(month);
 string memory daystr=Strings.toString(day);
string memory datestr=string.concat(yearstr,"/",monthstr,"/",daystr);
return datestr;
        
    }

function addreports(string memory  hospitalname,string memory name,string  memory datereportedd,string memory doctername,string memory docterspecilist)  public   {
Datereported memory reported=Datereported(getDate(),doctername,docterspecilist);
Reports[hospitalname][name].push(reported);

}

function getuser(string  memory hospitalname, string memory name)  public  returns (Host memory)   {
   
    return  patients[hospitalname][name];

    
}



modifier  checkallpattientarrlength(string memory hospitalname) {

require(allpatientshospital[hospitalname].length >0,"the array  has no elements ");
_;

}



function getallpatientsinhospital( string memory hospitalname) public checkallpattientarrlength(hospitalname)  returns (Host[] memory) {

    return  allpatientshospital[hospitalname];


}


function getreports(string  memory  hospitalname,string memory name) public  returns(Datereported  [] memory){
return  Reports[hospitalname][name];
}



}