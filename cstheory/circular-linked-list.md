# Circular Linked List

I was thinking about music theory and I realized that one could use a circular
linked list to build chords.

```python
class Node:
    def __init__(self, data):
        self.data = data
        self.prev = None
        self.next = None
    def __repr__(self):
        return f'{self.data}'
    
class CircularDoublyLinkedList:
    def __init__(self):
        self.head = None
        self.tail = None
        self.count = 0
    def __len__(self):
        return self.count
    def __repr__(self):
        result = ''
        node = self.head
        while True:
            if node is None:
                return result
            result += f'{node.data}\n'
            if node == self.tail:
                return result
            node = node.next
    def add(self, data):
        node = Node(data)
        if self.head is None:
            self.head = node
            self.tail = node
            self.head.next = self.tail
            self.head.prev = self.tail
            self.tail.next = self.head
            self.tail.prev = self.head
        else:
            old_tail = self.tail
            self.tail.next = node
            self.head.prev = node
            self.tail = node
            self.tail.next = self.head
            self.tail.prev = old_tail
        self.count += 1
    def remove(self, data) -> None:
        node = self.head
        count = 0
        while True:
            if count >= self.count:
                return None
            if node.data == data:
                prv = node.prev
                nxt = node.next
                if node in [self.head, self.tail]:
                    self.head = nxt
                    self.tail = prv
                prv.next = nxt
                nxt.prev = prv
                self.count -= 1
                return None
            count += 1
            node = node.next
```