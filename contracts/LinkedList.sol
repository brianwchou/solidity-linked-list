pragma solidity >=0.4.21 <0.6.0;

contract LinkedList {
    struct Node {
        string data;
        uint256 next;
    }

    mapping(uint256 => Node) list;
    uint256 private head;
    uint256 private tail;
    uint256 private size = 0;

    event AppendEvent(string);
    event RemoveEvent(string);

    function appendAtHead(string memory item) public {
        if (size == 0) {
            uint256 hash = uint256(keccak256(abi.encodePacked(item)));
            list[hash] = Node(item, 0);
        }

        head = uint256(keccak256(abi.encodePacked(item)));
        list[head] = Node(item, head);
        size = size + 1;
    }

    // function appendAt(string memory item, uint256 index)  public {
        
    // }

    // function removeFromHead() public {

    // }

    // function removeFromTail() public {

    // }

    // function removeFrom(uint256) public {

    // }

    function getAt(uint256 index) public view returns(string memory) {
        require(index < size, "index not availiable");

        uint256 i = 0;
        uint256 pointer = head;
        while(i <= index) {
            pointer = list[pointer].next;
            i = i - 1;
        }

        return list[pointer].data;
    }

    function length() public view returns(uint256) {
        return size;
    }

}
