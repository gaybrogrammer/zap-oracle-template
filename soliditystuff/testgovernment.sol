pragma solidity 0.4.17-0.6.0;
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "./government.sol";

contract testgovernment {
    function test_create() public{
        string candidates = ["john","joe","jerry"];
        Government test = create_government(15,"obama",30,candidates,false,2000);
        uint money = test.money;
        string leader = test.leader;
        string[] leaders = test.leaders;
    
    }
}