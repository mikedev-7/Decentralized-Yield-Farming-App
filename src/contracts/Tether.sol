pragma solidity ^0.5.0;

contract Tether {
   string public name = 'Mock Tether Token';
    string public symbol = 'USDT';
   uint256 public totalSupply = 1000000000000000000000000; //1 million tokens
   uint256 public decimals = 18;

   event Transfer( 
   address indexed _from,
   address indexed _trto,
   uint _value

);

event Approval (
   address indexed _owner,
   address indexed _spender,
   uint _value
);

mapping(address => uint256) public balanceOf;
mapping (address=>mapping(address => uint256)) public allowance;

constructor() public {
   balanceOf[msg.sender] = totalSupply;
}

   function transfer(address _to, uint  _value)public returns (bool success) {
      //Total supply must be greater than the value
      require (balanceOf [msg.sender] >= _value);
      //transfer the amount and subtract it from total supply to get the balance
      balanceOf[msg.sender] -=_value;
      //add the amount to receiver's account to get the new balance
      balanceOf[_to] +=_value;
      emit Transfer(msg.sender, _to, _value);
      return true;
   }

   function approve(address _spender, uint256 _value)public returns (bool success) {
      allowance[msg.sender] [_spender] = _value;
      emit Approval(msg.sender, _spender, _value);
      return true;
   }

   function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
      require(_value <= balanceOf[_from]);
      require(_value <= allowance[_from][msg.sender]);
        //add the balance
      balanceOf[_to] += _value;
         //subtract the balance
      balanceOf[_from] -= _value;
      allowance[msg.sender][_from] -= _value;
      emit Transfer(_from, _to, _value);
      return true;
   
   }
       

}



