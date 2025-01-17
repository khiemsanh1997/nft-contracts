// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0;

import {IERC721} from '@openzeppelin/contracts/token/ERC721/IERC721.sol';

/**
 * @title IBaseHandles
 * @author Lens Protocol
 *
 * @notice This is the interface for the LensHandles contract that is responsible for minting and burning handle NFTs.
 * A handle is composed of a local name and a namespace, separated by a dot.
 * Example: `satoshi.lens` is a handle composed of the local name `satoshi` and the namespace `lens`.
 */
interface IBaseHandles is IERC721 {
    /**
     * @notice Mints a handle NFT in the given namespace.
     * @custom:permissions Only LensHandles contract's owner or LensHub.
     *
     * @param to The address to mint the handle to.
     * @param localName The local name of the handle (the part before ".lens").
     *
     * @return uint256 The ID of the handle NFT minted.
     */
    function mintHandle(address to, string calldata localName) external returns (uint256);

    /**
     * @notice Burns a handle NFT.
     * @custom:permissions Owner of Handle NFT.
     *
     * @param tokenId The ID of the handle NFT to burn.
     */
    function burn(uint256 tokenId) external;

    /**
     * @notice Gets the namespace of the contract. It's 'lens' for the LensHandles contract.
     *
     * @return string The namespace of the contract.
     */
    function getNamespace() external pure returns (string memory);

    /**
     * @notice Gets the hash of the namespace of the contract. It's keccak256('lens') for the LensHandles contract.
     *
     * @return bytes32 The hash of the namespace of the contract.
     */
    function getNamespaceHash() external pure returns (bytes32);

    /**
     * @notice Returns whether `tokenId` exists.
     *
     * Tokens start existing when they are minted (`_mint`),
     * and stop existing when they are burned (`_burn`).
     *
     * @return bool Whether the token exists.
     */
    function exists(uint256 tokenId) external view returns (bool);

    /**
     * @notice Returns the amount of tokens in circulation.
     *
     * @return uint256 The current total supply of tokens.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @notice Returns the HandleTokenURI contract address.
     *
     * @return address The HandleTokenURI contract address.
     */
    function getHandleTokenURIContract() external view returns (address);

    /**
     * @notice Sets the HandleTokenURI contract address.
     * @custom:permissions Only LensHandles contract's owner
     *
     * @param handleTokenURIContract The HandleTokenURI contract address to set.
     */
    function setHandleTokenURIContract(address handleTokenURIContract) external;
}
