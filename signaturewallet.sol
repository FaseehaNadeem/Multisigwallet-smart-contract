//SPDX-License-Identifier: UNLICENSED
pragma solidity >= 0.7.0 < 0.9.0;
contract multisig{
    address[] public owners;
    uint public confirmations;
    mapping(uint => mapping(address => bool)) public hasconfirmed;
    Transaction[] public transactions;
    struct Transaction{
        address to;
        uint value;
        uint confirmations;
        bool executed;
    }
    constructor(address[] memory _owners, uint _confirmations){
        owners = _owners;
        confirmations = _confirmations;
    }
    function sumbittransaction(address _to,uint _value) public{
        transactions.push(Transaction({
            to: _to,
            value: _value,
            confirmations: 0,
            executed: false
        }));
    }
    function confirmtransaction(uint _id) public {
        require(!hasconfirmed[_id][msg.sender],"Already confirmed.");
        hasconfirmed[_id][msg.sender] = true;
        transactions[_id].confirmations++;
        if(transactions[_id].confirmations >= confirmations){
            executedTransaction(_id);
        }

    }
    function executedTransaction(uint _id) public{
        require(!transactions[_id].executed,"already executed.");
        transactions[_id].executed = true;
        (bool success, ) = transactions[_id].to.call{value: transactions[_id].value}("");
        require(success,"execution failed.");
    }
}