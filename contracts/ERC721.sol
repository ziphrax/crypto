// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract ERC721 {

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    mapping (uint => address) private _owners;
    mapping (address => uint) private _ownedTokensCount;

    function _exists(uint256 tokenId) internal view returns (bool) {
        return _owners[tokenId] != address(0);
    }

    function _mint(address to, uint256 tokenId) internal virtual {
        require(to != address(0), "ERC721: mint to the zero address");
        require(!_exists(tokenId), "ERC721: token already minted");

        _owners[tokenId] = to;
        _ownedTokensCount[to] += 1;

        emit Transfer(address(0), to, tokenId);
    }

    function balanceOf(address owner) public view returns (uint256){
        require(owner != address(0), "ERC721: balance query for the zero address");

        return _ownedTokensCount[owner];
    }

    function ownerOf(uint256 tokenId) public view returns (address){
        address owner = _owners[tokenId];
        require(owner != address(0), "ERC721: owner query for nonexistent token");

        return owner;
    }

    function _transferFrom(address from, address to, uint256 tokenId) internal {
        require(to != address(0), "ERC721: transfer to the zero address");
        require(ownerOf(tokenId) == from, "ERC721: transfer of token that is not own");

        _owners[tokenId] = to;
        _ownedTokensCount[from] -= 1;
        _ownedTokensCount[to] += 1;

        emit Transfer(from, to, tokenId);
    }

    function transferFrom(address from, address to, uint256 tokenId) public {
        _transferFrom(from, to, tokenId);
    }
}