pragma solidity ^0.4.24;

//Safe Math Interface

contract SafeMath {

    function safeAdd(uint a, uint b) public pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }

    function safeSub(uint a, uint b) public pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }

    function safeMul(uint a, uint b) public pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }

    function safeDiv(uint a, uint b) public pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
}


//ERC Token Standard #20 Interface

contract ERC20Interface {
    function totalSupply() public constant returns (uint);
    function balanceOf(address tokenOwner) public constant returns (uint balance);
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}


//Contract function to receive approval and execute function in one call

contract ApproveAndCallFallBack {
    function receiveApproval(address from, uint256 tokens, address token, bytes data) public;
}

//Actual token contract

contract FrakToken is ERC20Interface, SafeMath {
    string public symbol;
    string public  name;
    uint8 public decimals;
    uint public _totalSupply;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;

    constructor() public {
        symbol = "FRAK";
        name = "Fraktal";
        decimals = 18;
        _totalSupply = 1000000000000000000000000000;
        balances[] = 350000000000000000000000000;
        balances[] = 350000000000000000000000000;
        balances[] = 200000000000000000000000000;
        balances[] = 100000000000000000000000000;
        balances[] = 73750000000000000000000000;
        balances[] = 33750000000000000000000000;
        balances[] = 2500000000000000000000000;
        balances[] = 12500000000000000000000000;
        balances[] = 2500000000000000000000000;
        balances[] = 2500000000000000000000000;
        balances[] = 2500000000000000000000000;
        balances[] = 2500000000000000000000000;
        balances[] = 12500000000000000000000000;
        balances[] = 2500000000000000000000000;
        balances[] = 102500000000000000000000000;
        balances[] = 200000000000000000000000000;
        emit Transfer(address(0), , 350000000000000000000000000);
        emit Transfer(address(1), , 350000000000000000000000000);
        emit Transfer(address(2), , 200000000000000000000000000);
        emit Transfer(address(3), , 100000000000000000000000000);
        emit Transfer(address(4), , 73750000000000000000000000);
        emit Transfer(address(5), , 33750000000000000000000000);
        emit Transfer(address(6), , 2500000000000000000000000);
        emit Transfer(address(7), , 12500000000000000000000000);
        emit Transfer(address(8), , 2500000000000000000000000);
        emit Transfer(address(9), , 2500000000000000000000000);
        emit Transfer(address(10), , 2500000000000000000000000);
        emit Transfer(address(11), , 2500000000000000000000000);
        emit Transfer(address(12), , 12500000000000000000000000);
        emit Transfer(address(13), , 2500000000000000000000000);
        emit Transfer(address(14), , 102500000000000000000000000);
        emit Transfer(address(15), , 200000000000000000000000000);






    }

    function totalSupply() public constant returns (uint) {
        return _totalSupply  - balances[address(0)];
    }

    function balanceOf(address tokenOwner) public constant returns (uint balance) {
        return balances[tokenOwner];
    }

    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = safeSub(balances[msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }

    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }

    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        balances[from] = safeSub(balances[from], tokens);
        allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(from, to, tokens);
        return true;
    }

    function allowance(address tokenOwner, address spender) public constant returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }

    function approveAndCall(address spender, uint tokens, bytes data) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, this, data);
        return true;
    }

    function () public payable {
        revert();
    }
}
