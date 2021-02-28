pragma solidity ^0.6.0;

contract Vehicle 
{
    function start()public view returns(string memory)
    {
        return "The Vehicle has just Started";
    }
    function accelrate ()public view returns(string memory)
    {
        return "The Vehicle has just Accelerated";
    }
    function stop ()public view returns(string memory)
    {
        return "The Vehicle has just Stopped";
    }
    function doService ()public virtual  returns(string memory)
    {
        return "The Vehicle is being serviced";
    }
    
}
contract Car is Vehicle{
    function doService()public override virtual  returns(string memory)
    {
        return "Car is being serviced";
    }
}
contract Truck is Vehicle{
    function doService()public override virtual  returns(string memory)
    {
        return "Truck is being serviced";
    }
}
contract MotorCycle is Vehicle{
    function doService()public override virtual  returns(string memory)
    {
        return "MotorCycle is being serviced";
    }
}
contract Mehran is Car{}
contract Hino is Truck{}
contract Yamaha is MotorCycle{}

contract ServiceStation is Car,Truck,MotorCycle
{
    Vehicle objVehicle;
    address object_Address;
    function doService()public override  (Car,Truck,MotorCycle) returns  (string memory)// if we write view keyword with them it will 
    //generate error cuz it is now changing state after being overriden....
    {
        
        return objVehicle.doService();
    }
    function returnAddress()public view returns(address)
    {
        return object_Address;
    }
    
    function setAddressForMehran(address adr) public
    {
        objVehicle=Mehran(adr);
        object_Address=adr;
    }
    function setAddressForYamaha(address adr) public
    {
        objVehicle=Yamaha(adr);
         object_Address=adr;
    }
    function setAddressForHino(address adr) public
    {
        objVehicle=Hino(adr);
         object_Address=adr;
    }
    
}