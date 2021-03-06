/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract TJCUToken at 0x6cd694d5a9c71cd811922e3cb314f44afe25a48c
*/
pragma solidity ^0.4.16;  
contract Token{  
    uint256 public totalSupply;  
  
    function balanceOf(address _owner) public constant returns (uint256 balance);  
    function transfer(address _to, uint256 _value) public returns (bool success);  
    function transferFrom(address _from, address _to, uint256 _value) public returns     
    (bool success);  
  
    function approve(address _spender, uint256 _value) public returns (bool success);  
  
    function allowance(address _owner, address _spender) public constant returns   
    (uint256 remaining);  
  
    event Transfer(address indexed _from, address indexed _to, uint256 _value);  
    event Approval(address indexed _owner, address indexed _spender, uint256   
    _value);  
}  
  
contract TJCUToken is Token {  
  
    string public name;                   //?? Tianjin University of Commerce
    uint8 public decimals;               //??token?????????  
    string public symbol;               //token?? TJCU 
  
    function TJCUToken(uint256 _initialAmount, string _tokenName, uint8 _decimalUnits, string _tokenSymbol) public {  
        totalSupply = _initialAmount * 10 ** uint256(_decimalUnits);         // ??????  
        balances[msg.sender] = totalSupply; // ??token??????????????????????????????  
  
        name = _tokenName;                     
        decimals = _decimalUnits;            
        symbol = _tokenSymbol;  
    }  
  
    function transfer(address _to, uint256 _value) public returns (bool success) {  
        //??totalSupply ??????? (2^256 - 1).  
        //??????????????token??????????????????  
        require(balances[msg.sender] >= _value && balances[_to] + _value > balances[_to]);  
        require(_to != 0x0);  
        balances[msg.sender] -= _value;//???????????token??_value  
        balances[_to] += _value;//???????token??_value  
        Transfer(msg.sender, _to, _value);//????????  
        return true;  
    }  
  
  
    function transferFrom(address _from, address _to, uint256 _value) public returns   
    (bool success) {  
        require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value);  
        balances[_to] += _value;//??????token??_value  
        balances[_from] -= _value; //????_from??token??_value  
        allowed[_from][msg.sender] -= _value;//??????????_from????????_value  
        Transfer(_from, _to, _value);//????????  
        return true;  
    }  
    function balanceOf(address _owner) public constant returns (uint256 balance) {  
        return balances[_owner];  
    }  
  
  
    function approve(address _spender, uint256 _value) public returns (bool success)     
    {   
        allowed[msg.sender][_spender] = _value;  
        Approval(msg.sender, _spender, _value);  
        return true;  
    }  
  
    function allowance(address _owner, address _spender) public constant returns (uint256 remaining) {  
        return allowed[_owner][_spender];//??_spender?_owner????token?  
    }  
    mapping (address => uint256) balances;  
    mapping (address => mapping (address => uint256)) allowed;  
}