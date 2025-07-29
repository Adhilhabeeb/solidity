// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract Admin{

address internal   adminaddres;
constructor ( address adnubadd){

adminaddres=adnubadd;

}


function getadminaddres () external     view  returns(address) {
return  adminaddres;

}

function changeadmin(address newadinadd) external     {


adminaddres=newadinadd;

}


}

