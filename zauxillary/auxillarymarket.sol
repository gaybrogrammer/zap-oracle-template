pragma solidity 0.4.17-0.6.0;
pragma experimental ABIEncoderV2;

contract auxillary_market {
    uint money;
    string user;
    address user_address;
    uint num_tokens;
    uint token;
    mapping (address => uint) public user_to_token;
    function transfer_token(address sender, address receiver, uint amount_send, uint amount_receive) public{
        user_to_token[receiver] += amount_receive;
        user_to_token[sender] -= amount_send;
    }
    function bet(uint num_positions, uint[] memory stakes1, 
    address[] memory users1, uint[] memory stake_pos, 
    uint[] memory stake_ammounts) public{

        uint result = run_bet(num_positions);
        uint collector = 0;
        uint winners = 0;
        for(uint i = 0; i < stake_pos.length; i +=1 ){
            if(stake_pos[i] != result){
                user_to_token[users1[i]] -= stake_ammounts[i];
                collector += stake_ammounts[i];

            }
            else{
                winners += 1;

            }

        }
        for(uint j = 0; j< stake_pos.length; j+=1){
                if(stake_pos[j] == result){
                user_to_token[users1[j]] += collector/winners;

            }
        }
    }
    function run_bet(uint num_positions) public returns(uint) {
        uint result = randMod(num_positions);
        return result;
    }
    event printer(string message);
    function print(string memory message) public{
        emit printer(message);
    }
    uint randNonce = 0;
    function randMod(uint _modulus) internal returns(uint) {
    randNonce +=1;
    return uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _modulus;
  }
}