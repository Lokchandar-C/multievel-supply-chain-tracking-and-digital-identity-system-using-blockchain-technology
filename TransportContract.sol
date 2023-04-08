pragma solidity ^0.8.0;

contract TransportContract {
    struct Transport {
        string product;
        string origin;
        string destination;
        uint256[] timestamps;
        string[] identities;
        string[] modes;
    }

    mapping(bytes32 => Transport) public transports;

    function createTransport(
        bytes32 transportId,
        string memory product,
        string memory origin,
        string memory destination
    ) public {
        Transport storage newTransport = transports[transportId];
        newTransport.product = product;
        newTransport.origin = origin;
        newTransport.destination = destination;
    }

    function addTransportation(
        bytes32 transportId,
        string memory mode,
        string memory identity,
        uint256 timestamp
    ) public {
        Transport storage currentTransport = transports[transportId];
        currentTransport.modes.push(mode);
        currentTransport.identities.push(identity);
        currentTransport.timestamps.push(timestamp);
    }

    function getTransport(bytes32 transportId)
        public
        view
        returns (
            string memory product,
            string memory origin,
            string memory destination,
            uint256[] memory timestamps,
            string[] memory identities,
            string[] memory modes
        )
    {
        Transport storage currentTransport = transports[transportId];
        return (
            currentTransport.product,
            currentTransport.origin,
            currentTransport.destination,
            currentTransport.timestamps,
            currentTransport.identities,
            currentTransport.modes
        );
    }
}
