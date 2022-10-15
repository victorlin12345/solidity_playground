// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./blind_box_nft.sol";

contract AppWorksV2 is AppWorks {
  using StringsUpgradeable for uint256;

  string public unRevealedURI; // 未解盲的 uri

  // @dev returns the contract version
  function contractVersion() external pure returns (uint256) {
    return 2;
  }

  // tokenURI 拿到 token 的 metadata URI
  function tokenURI(uint256 tokenId) public view override returns (string memory){
    require(_exists(tokenId), "token not exist");

    if (!revealed) {
      return unRevealedURI;
    }

    return bytes(_baseURI()).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString())) : "";
  }

  // Let this contract can be upgradable, using openzepplin proxy library - week 10
  function setNotRevealedURI(string memory _uri) external onlyOwner {
    unRevealedURI = _uri;
  }

}