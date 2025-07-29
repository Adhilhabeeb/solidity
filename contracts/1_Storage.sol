// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

import "github/RollaProject/solidity-datetime/contracts/DateTime.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
  
interface  iAdmin {
    // it pole nammakk  vere contracts ine ingne interface use cheth call cheyym 
     function getadminaddres() external;
     function changeadmin(address newadinadd) external  ;
 
}
contract Twitter   {

iAdmin public  Admincontrsct;

constructor (address deployedadmincontctaddress){

Admincontrsct=iAdmin(deployedadmincontctaddress);

}

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


function changadmin(address newadminadd) public {

    Admincontrsct.changeadmin(newadminadd);
}

struct User {
    string name;
    string email;
    uint168 phnum;
    string hospitalname;
    mapping(string => Datereported[] ) reportsar; 

}
mapping(string => mapping(string => Host)) public patients;
    mapping  ( string => User ) public  users;
mapping  (string =>Host[]) public  allpatientshospital;



//checking crtainguserofhostital  patent hospitelil indo
modifier   checkpatientonhosputl (string memory hospitanname,string memory patietname) {
require(  bytes(patients[hospitanname][patietname].name ).length>1 , "sorry noyt foihdd plzz contact hospital authories");
_;
}
function createpatientaccount(string  memory name,string memory  hospitalname,string  memory email,uint168 phnum ) public checkpatientonhosputl(hospitalname,name) {


User   storage  current =users[name];
current.name=name;
current.email=email;
current.phnum=phnum;

current.hospitalname=hospitalname;





}

//checking crtainguserofhostital  patent hospitelil indo


//useremialexiix
modifier  checkuseremailexist(string memory name) {

require(bytes(users[name].name).length>=1,"no user found using the given name ");

    _;
}


function getuseremial( string  memory uname)  public  checkuseremailexist(uname) view returns(string memory ){



 return   users[uname].email;


}
//useremialexiix


//hospiyall
function addpatient( string memory name,string  memory blood,uint104 age, string memory hospitalname,string memory doctername,string memory docterspecilist) public   {

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


users[name].reportsar[hospitalname].push(reported);













}

function getDate() public   view  returns (string memory)  {
         (uint year, uint month, uint day)= DateTime.timestampToDate(block.timestamp);
 string memory yearstr=Strings.toString(year);
 string memory monthstr=Strings.toString(month);
 string memory daystr=Strings.toString(day);
string memory datestr=string.concat(yearstr,"/",monthstr,"/",daystr);
return datestr;
        
    }

function addreports(string memory  hospitalname,string memory name,string memory doctername,string memory docterspecilist)  public   {
Datereported memory reported=Datereported(getDate(),doctername,docterspecilist);
Reports[hospitalname][name].push(reported);
//  addto users
users[name].reportsar[hospitalname].push(reported);

}

function getuser(string  memory hospitalname, string memory name)  public view   returns (Host memory)   {
   
    return  patients[hospitalname][name];

    
}



modifier  checkallpattientarrlength(string memory hospitalname) {

require(allpatientshospital[hospitalname].length >0,"the array  has no elements ");
_;

}



function getallpatientsinhospital( string memory hospitalname) public checkallpattientarrlength(hospitalname) view   returns (Host[] memory) {

    return  allpatientshospital[hospitalname];


}


function getreports(string  memory  hospitalname,string memory name) public view   returns(Datereported  [] memory){
return  Reports[hospitalname][name];
}



}