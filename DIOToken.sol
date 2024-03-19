// Specifies the software license for this smart contract code, here the MIT License, which is common for open-source software.

// SPDX-License-Identifier: MIT

//Defines the compiler version to ensure compatibility and avoid potential issues with future compiler versions. 
pragma solidity ^0.8.0;
//Declares the IERC20 interface to ensure adherence to the ERC-20 standard for tokens. This is crucial for interoperability 
//with wallets and other contracts.
//Interface declaration for ERC-20 token standard essential functions and events.
interface  IERC20 {
    //Defines the method 'totalSupply' to return the total token supply. Marked as view since it doesn't alter the contract state.
    function totalSupply() external view returns(uint256);
    //Specifies the method 'balanceOf' to retrieve the token balance of a specific account. Essential for tracking token distribution.
    function balanceOf(address account) external view returns  (uint256);
    //Declares the method 'allowance' to check how many tokens an spender is allowed to spend on behalf of an owner.
    function allowance(address owner, address spender) external view returns (uint256);
    //A method for transferring amount tokens to the recipient. Must return true on success.
    function transfer(address recipient, uint256 amount) external returns (bool);
    //Enables an owner to approve a spender to use up to amount of their tokens. Returns true if successful.
    function approve(address spender, uint256 amount) external returns (bool);
    //Allows a spender to transfer up to amount tokens from sender to recipient, assuming sufficient allowance.
    function transferFrom(address sender, address recipient, uint256 amount) external returns(bool);

    //Event emitted when tokens are transferred, including transfers triggered by approve and transferFrom.
    event Transfer(address indexed from, address indexed to, uint256 value);
    //Event indicating owner has approved spender to use up to value tokens on their behalf.
    event Approval(address indexed owner, address indexed spender, uint256);
    
}
//Declaration of the DIOToken contract, implementing the IERC20 interface. Indicates this contract will adhere to the ERC-20 standard.
contract DIOToken is IERC20{
    //name of the token
    string public constant name = "DIO Token";
    //token's symbol
    string public constant symbol = "DIO";
    //Specifies the token's decimal places, used for display purposes. Most ERC-20 tokens use 18.
    uint8 public constant decimal = 18;
    //A mapping to keep track of each address's balance. Essential for the balanceOf function.
    mapping(address => uint256) balances;
    //Nested mapping to track allowances: how much spender is allowed to withdraw from owner.
    mapping(address => mapping(address =>uint256)) allowed;
    ////Sets the initial total supply of tokens. Uses ether keyword for readability, meaning 10 * 10**18.
    uint256 totalSupply_ = 10 ether;
    
    //The constructor function that initializes the contract state. Called once upon contract deployment.
    constructor() {
        //Credits the entire initial token supply to the account deploying the contract.
        balances[msg.sender] = totalSupply_;
    }
    //Implements the totalSupply method from the IERC20 interface, returning the current total supply.
    function totalSupply() public override view returns (uint256){
        return totalSupply_;
    }
    //Implementation of balanceOf, returning the balance of tokenOwner.
    function balanceOf(address tokenOwner) public override view returns (uint256){
        return balances[tokenOwner];
    }
    //Implements the transfer function allowing token owners to transfer tokens.
    function transfer(address receiver, uint256 numTokens) public override returns (bool){
        //Checks if the sender has enough tokens to transfer.
        require(numTokens <= balances[msg.sender]);
        //Deducts the number of tokens from the sender's balance.
        balances[msg.sender] = balances[msg.sender] - numTokens;
        //Credits the tokens to the receiver's balance.
        balances[receiver] = balances[receiver] + numTokens;
        //Emits a Transfer event, as required by the ERC-20 standard.
        emit Transfer(msg.sender,receiver, numTokens);
        return true;
    }
    //Allows a token owner to approve a delegate to spend tokens on their behalf.
    function approve(address delegate, uint numTokens) public override returns (bool) {
        //Sets the allowance in the allowed mapping.
        allowed[msg.sender][delegate] = numTokens;
        //Emits an Approval event to record the approval.
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }
    //Implements the allowance method to check the amount a delegate is allowed to spend.
    function allowance(address owner, address delegate) public override view returns (uint){
        return allowed[owner][delegate];
    }
    //Implements transferFrom, allowing a spender to transfer tokens from one account to another, within the allowance limits.
    function transferFrom(address owner, address buyer, uint256 numTokens) public override returns (bool){
        //Ensures the owner has enough tokens to transfer.
        require(numTokens <= balances[owner]);
        //Checks that the transfer amount does not exceed the spender's allowed limit.
        require(numTokens <= allowed[owner][msg.sender]);
        //Deducts the token amount from the owner's balance.
        balances[owner] = balances[owner] - numTokens;
        //Decreases the spender's allowance by the transferred amount.
        allowed[owner][msg.sender] = allowed[owner][msg.sender]-numTokens;
        //Increases the buyer's balance by the transferred amount.
        balances[buyer] = balances[buyer] + numTokens;
        //Emits a Transfer event, signaling a successful token transfer from the owner to the buyer.
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
}