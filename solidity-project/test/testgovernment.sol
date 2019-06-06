pragma solidity 0.4.17-0.6.0;
pragma experimental ABIEncoderV2;
import "./node_modules/truffle/build/Assert.sol";

import "./government.sol";

contract testgovernment is government_factory{
    function test_create() public{
        bytes32 john = "john";
        bytes32 jerry = "jerry";
        bytes32 jeff = "jeff";
        bytes32[3] memory candidates;
        candidates[0] = john;
        candidates[1] = jerry;
        candidates[2] = jeff;

        
        
         
        Government memory test = create_government(15,"obama",30,candidates,false,2000);
        uint money = test.money;
        string memory leader = test.leader;
        bytes32 [3] memory leaders = test.leaders;
        uint parliamentary_seats = test.parliamentary_seats;
        uint private_money = test.private_money;
        bool tyrannical = test.tyrannical;
        string memory leader_message = "the leader should be obama";
        Assert.equal(money, 15, "The money should be 15");
        Assert.equal(leader, "obama", leader_message);
        Assert.equal(leaders, candidates,"the candidates hsould be john joe and jerry");
        Assert.equal(parliamentary_seats, 30, "the number of seats should be 30");
        Assert.equal(private_money, 2000,"the private money should be 2000");
        Assert.equal(tyrannical, false, "the tyrannical should be false");
        
    }
}