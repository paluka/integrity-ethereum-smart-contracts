pragma solidity >=0.4.22 <0.9.0;

contract Integrity {
  address public owner;
  mapping (address => string) private data;

  constructor() public {
  }

  modifier restricted() {
    require(msg.sender == owner,
      "This function is restricted to the contact's owner");
      _;
  }

  function upload(address dataOwner, string calldata _text) restricted external returns(bool) {
    data[dataOwner] = _text;
    return true;
  }

  function verify(address dataOwner, string calldata _text) restricted view external returns(bool) {
    return keccak256(bytes(data[dataOwner])) == keccak256(bytes(_text));
  }
}
