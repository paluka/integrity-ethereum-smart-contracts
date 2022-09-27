pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract IntegrityV2 is Initializable {
  address public owner;
  mapping (address => string) private data;

  function initialize() public initializer {
    owner = msg.sender;
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

  function random(address dataOwner, string calldata _text) view external returns(bool) {
    return true;
  }
}
