/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Meridian at 0x1fdd9abafd1013518bac51af0346585b810fc1c4
*/
pragma solidity ^0.4.8;
/*
AvatarNetwork Copyright

https://avatarnetwork.io
https://avatar.blue
https://www.avatar-network.com
https://www.avatar-bank.com
*/

/* ???????????? ???????? */
contract Owned {

    /* ????? ????????? ?????????*/
    address owner;

    /* ??????????? ?????????, ?????????? ??? ?????? ??????? */
    function Owned() {
        owner = msg.sender;
    }

        /* ???????? ????????? ?????????, newOwner - ????? ?????? ????????? */
    function changeOwner(address newOwner) onlyowner {
        owner = newOwner;
    }


    /* ??????????? ??? ??????????? ??????? ? ???????? ?????? ??? ????????? */
    modifier onlyowner() {
        if (msg.sender==owner) _;
    }

    
}

// ??????????? ???????? ??? ?????? ????????? ERC 20
// https://github.com/ethereum/EIPs/issues/20
contract Token is Owned {

    /// ????? ???-?? ???????
    uint256 public totalSupply;

    /// @param _owner ?????, ? ???????? ????? ??????? ??????
    /// @return ??????
    function balanceOf(address _owner) constant returns (uint256 balance);

    /// @notice ????????? ???-?? `_value` ??????? ?? ????? `_to` ? ?????? `msg.sender`
    /// @param _to ????? ??????????
    /// @param _value ???-?? ??????? ??? ????????
    /// @return ???? ?? ???????? ???????? ??? ???
    function transfer(address _to, uint256 _value) returns (bool success);

    /// @notice ????????? ???-?? `_value` ??????? ?? ????? `_to` ? ?????? `_from` ??? ??????? ??? ??? ???????????? ???????????? `_from`
    /// @param _from ????? ???????????
    /// @param _to The address of the recipient
    /// @param _value The amount of token to be transferred
    /// @return Whether the transfer was successful or not
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success);

    /// @notice ?????????? ??????? `msg.sender` ???????????? ??? ? ?????? `_spender` ???????? `_value` ???????
    /// @param _spender ????? ????????, ? ???????? ???????? ??????? ??????
    /// @param _value ???-?? ??????? ? ????????????? ??? ????????
    /// @return ???? ?? ????????????? ???????? ??? ???
    function approve(address _spender, uint256 _value) returns (bool success);

    /// @param _owner ????? ???????? ?????????? ????????
    /// @param _spender ????? ????????, ? ???????? ???????? ??????? ??????
    /// @return ???-?? ?????????? ??????? ??????????? ??? ????????
    function allowance(address _owner, address _spender) constant returns (uint256 remaining);

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

/*
???????? ????????? ERC 20 Token standard: https://github.com/ethereum/EIPs/issues/20
*/
contract ERC20Token is Token
{

    function transfer(address _to, uint256 _value) returns (bool success)
    {
        //??-????????? ??????????????, ??? totalSupply ?? ????? ???? ?????? (2^256 - 1).
        if (balances[msg.sender] >= _value && balances[_to] + _value > balances[_to]) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            Transfer(msg.sender, _to, _value);
            return true;
        } else { return false; }
    }

    function transferFrom(address _from, address _to, uint256 _value) returns (bool success)
    {
        //??-????????? ??????????????, ??? totalSupply ?? ????? ???? ?????? (2^256 - 1).
        if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && balances[_to] + _value > balances[_to]) {
            balances[_to] += _value;
            balances[_from] -= _value;
            allowed[_from][msg.sender] -= _value;
            Transfer(_from, _to, _value);
            return true;
        } else { return false; }
    }

    function balanceOf(address _owner) constant returns (uint256 balance)
    {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) returns (bool success)
    {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) constant returns (uint256 remaining)
    {
      return allowed[_owner][_spender];
    }

    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;
}

/* ???????? ???????? ??????, ????????? ERC20Token */
contract Meridian is ERC20Token
{

    function ()
    {
        // ???? ??? ?? ???????? ????????? ???? ?? ????? ?????????, ?? ????? ??????? ??????.
        throw;
    }

    /* ????????? ?????????? ?????? */
    string public name;                 // ????????
    uint8 public decimals;              // ??????? ?????????? ??????
    string public symbol;               // ????????????? (????????????? ??????)
    string public version = '1.0';      // ??????

    function Meridian(
            uint256 _initialAmount,
            string _tokenName,
            uint8 _decimalUnits,
            string _tokenSymbol)
    {
        balances[msg.sender] = _initialAmount;  // ???????? ????????? ???? ?????????? ?????
        totalSupply = _initialAmount;
        name = _tokenName;
        decimals = _decimalUnits;
        symbol = _tokenSymbol;
    }

    

    
}