/* SPDX-License-Identifier: MIT  */
pragma solidity ^0.8.13;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract Integrity is Initializable {
  address public owner;
  mapping (string => string[][]) private data;

  event FileUploaded(string dataOwner, string name, string hash);

  function initialize() public initializer {
    owner = msg.sender;
  }

  modifier restricted() {
    require(msg.sender == owner,
      "This function is restricted to the contact's owner");
      _;
  }

  function upload(string calldata dataOwner, string calldata name, string calldata hash) restricted external {
    data[dataOwner].push([name, hash]);
    emit FileUploaded(dataOwner, name, hash);
  }

  function verify(string calldata dataOwner, string calldata name, string calldata hash) restricted view external returns(bool) {
    for (uint i = 0; i < data[dataOwner].length; i++) {
      if (keccak256(abi.encodePacked(data[dataOwner][i][0])) == keccak256(abi.encodePacked(name)) && keccak256(abi.encodePacked(data[dataOwner][i][1])) == keccak256(abi.encodePacked(hash))) {
        return true;
      }
    }
    return false;
  }

  function random() pure external returns(bool) {
    return true;
  }
}
