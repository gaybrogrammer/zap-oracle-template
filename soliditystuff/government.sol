pragma solidity 0.4.21-0.6.0;
pragma experimental ABIEncoderV2;

contract government_factory {
    event new_government(uint government_id, string leader);
    struct Government{
        uint money;
string leader;
uint parliamentary_seats;
string[] leaders;
bool tyrranical;

uint private_money;


    }
    uint randNonce = 0;
Government[] public governments;

mapping (uint => address) public government_to_owner;
  
function create_government(uint money, string memory leader, uint parliamentary_seats, string[] memory leaders, bool tyrranical, uint private_money) internal returns(Government storage ){
uint id = governments.push(Government(money,leader, parliamentary_seats, leaders,  tyrranical, private_money)) - 1;
government_to_owner[id] = msg.sender;
emit new_government(id, leader);
return governments[governments.length-1];
}
function presidential_election(string[] memory candidates,uint government_id) public{
    Government storage gov = governments[government_id];
    require(gov.tyrranical == false);
uint winner = randMod(candidates.length);
gov.leader = candidates[winner];

}
function parlimentary_election(string[] memory candidates,uint seat,uint government_id) public{
    Government storage gov = governments[government_id];
    require(gov.tyrranical == false);
uint winner = randMod(candidates.length);
gov.leaders[seat] = candidates[winner];
}
function tyrranical_election(string memory candidate,uint government_id) public{
    Government storage gov = governments[government_id];
require(gov.tyrranical == true);
gov.leader = candidate;
}
function spend_money(uint amount,uint government_id) public {
    Government storage gov = governments[government_id];
    require(gov.money >= amount);
gov.money -= amount;
}
function tax(uint amount,uint government_id) public{
    Government storage gov = governments[government_id];
    require(gov.private_money >= amount);
gov.private_money -= amount;
}
function randMod(uint _modulus) internal returns(uint) {
    randNonce +=1;
    return uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _modulus;
  }
  function generate_money(uint amount,uint government_id) public{
      Government storage gov = governments[government_id];
      gov.private_money += amount;
  }

}