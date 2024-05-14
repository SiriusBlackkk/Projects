// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


import"@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";


contract NFTee is ERC721Enumerable {
   using Strings for uint256;
   /**
       * @dev _baseTokenURI for computing {tokenURI}. If set, the resulting URI for each
       * token will be the concatenation of the `baseURI` and the `tokenId`.
       */
   string _baseTokenURI;


   // total number of tokenIds minted
   uint256 public tokenIds;


   /**
       * @dev ERC721 constructor takes in a `name` and a `symbol` to the token collection.
       * name in our case is `NFTee` and symbol is `TEE`.
       * Constructor for NFTee takes in the baseURI to set _baseTokenURI for the collection.
       * If you wish to change the collection name and symbol, feel free to do so but also change the contract name and file name accordingly as a good practice.
       */
   constructor (string memory baseURI) ERC721("NFTee", "TEE") {
       _baseTokenURI = baseURI;
   }


   /**
   * @dev mint allows an user to mint 1 NFT per transaction.
   */
   function mint() public payable {
       tokenIds += 1;
       _safeMint(msg.sender, tokenIds);
   }


   /**
   * @dev _baseURI overrides the Openzeppelin's ERC721 implementation which by default
   * returned an empty string for the baseURI
   */
   function _baseURI() internal view virtual override returns (string memory) {
       return _baseTokenURI;
   }
}
