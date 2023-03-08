// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import './ERC721Connector.sol';

contract KryptoBird is ERC721Connector {

    string [] public KryptoBirdz;

    mapping(string => bool) _kryptobirdzExists;

    constructor() ERC721Connector("Kryptobird","KBIRDZ") {
        
    }

    function mint(string memory kryptobird) public {
        require(!_kryptobirdzExists[kryptobird], "Kryptobird already exists");

        KryptoBirdz.push(kryptobird);
        
        uint id = KryptoBirdz.length - 1;
        
        _mint(msg.sender, id);

        _kryptobirdzExists[kryptobird] = true;
    }

    function exists(string memory kryptobird) public view returns (bool) {
        return _kryptobirdzExists[kryptobird];
    }
}