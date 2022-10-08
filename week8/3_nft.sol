// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract AppWorks is ERC721, Ownable {
  using Strings for uint256;

  // ref: https://docs.openzeppelin.com/contracts/3.x/api/utils#Counters
  using Counters for Counters.Counter;
  Counters.Counter private _nextTokenId;

  uint256 public price = 0.01 ether;
  uint256 public constant maxSupply = 100;
 
  bool public mintActive = false;
  bool public earlyMintActive = false;
  bool public revealed = false;
  
  string public baseURI;
  bytes32 public merkleRoot;

  mapping(uint256 => string) private _tokenURIs;
  mapping(address => uint256) public addressMintedAmount;

  constructor() ERC721("AppWorks", "AW") {
 
  }
  
  // Public mint function - week 8
  // ref : https://docs.openzeppelin.com/contracts/3.x/api/token/erc721
  function mint(uint256 _mintAmount) public payable {
    //Please make sure you check the following things:
    // 1. Current state is available for Public Mint
    require(mintActive, "unavilable mint");
    // 2. Check how many NFTs are available to be minted (Set mint per user limit to 10 and owner limit to 20 - Week 8)
    require(_mintAmount + totalSupply() <= maxSupply, "run out of supply");
    if (msg.sender == owner()) {
        require(addressMintedAmount[msg.sender] + _mintAmount <= 20, "Owner limit to 20");
    } else {
        require(addressMintedAmount[msg.sender] + _mintAmount <= 10, "Per user limit to 10");
    }
    // 3. Check user has sufficient funds
    require(msg.value == price * _mintAmount, "insufficient funds");
    // 4. mint
    uint256 startTokenID = _nextTokenId.current();
    _nextTokenId._value = startTokenID + _mintAmount;
    addressMintedAmount[msg.sender] += _mintAmount;
     for (uint256 i = startTokenID; i < _nextTokenId.current(); i++) {
            _safeMint(msg.sender, i); // 將新的一枚 token mint 到 to 的帳戶中。            
        }
  }
  
  // Implement totalSupply() Function to return current total NFT being minted - week 8
  function totalSupply() public view returns (uint256) {
      return _nextTokenId.current();
  }

  // Implement withdrawBalance() Function to withdraw funds from the contract - week 8
  function withdrawBalance() external onlyOwner {
      require(address(this).balance != 0, "balance is 0");
      (bool success, ) = payable(msg.sender).call{value: address(this).balance}("");
      if (!success) {
          revert();
      }
  }

  // Implement setPrice(price) Function to set the mint price - week 8
  function setPrice(uint256 _price) public onlyOwner {
      price = _price;
  }
 
  // Implement toggleMint() Function to toggle the public mint available or not - week 8
  function toggleMint() public onlyOwner {
      mintActive = !mintActive;
  }

  // Implement toggleReveal() Function to toggle the blind box is revealed - week 9

  // Implement setBaseURI(newBaseURI) Function to set BaseURI - week 9

  // Function to return the base URI
  function _baseURI() internal view virtual override returns (string memory) {
    return baseURI;
  }

  // Early mint function for people on the whitelist - week 9
  function earlyMint(bytes32[] calldata _merkleProof, uint256 _mintAmount) public payable {
    //Please make sure you check the following things:
    //Current state is available for Early Mint
    //Check how many NFTs are available to be minted
    //Check user is in the whitelist - use merkle tree to validate
    //Check user has sufficient funds
  }
  
  // Implement toggleEarlyMint() Function to toggle the early mint available or not - week 9

  // Implement setMerkleRoot(merkleRoot) Function to set new merkle root - week 9

  // Let this contract can be upgradable, using openzepplin proxy library - week 10
  // Try to modify blind box images by using proxy
  
}