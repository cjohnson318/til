# Segment Tree

I found this in a problem on [Leet Code](https://leetcode.com/problems/rectangle-area-ii/).
The official solution/explanation was not very informative, but user **DBabichev** had a very good wrtieup [here](https://leetcode.com/problems/rectangle-area-ii/discuss/1419181/Python-4-solutions-n3-greater-n2-log-n-greater-n2-greater-n-log-n-explained).
In their explanation was an even more helpful link to [here](https://cp-algorithms.com/data_structures/segment_tree.html).
However, even though these solutions are helpful, they used recursive
functions, which arre frowned upon in Python, so I wrote an iterative
implementation of the 1D segment tree data strtucture.

```python
class Node:
    def __init__(self, left: int, right: int, value):
        self.left_index = left
        self.right_index = right
        self.left_node = None
        self.right_node = None
        self.value = value
    def __repr__(self):
        return f'({self.left_index},{self.right_index}) -> {self.value}'
    def __len__(self):
        return self.right_index - self.left_index
        
class SegmentTree:
    def __init__(self, sequence, operation):
        self.sequence = sequence
        self.operation = operation
        self.root = None
    def build(self):
        nodes = []
        ptr = None
        if self.root is None:
            left, right = 0, len(self.sequence)
            self.root = Node(left, right, self.operation(self.sequence[left:right]))
            nodes.append(self.root)
        while True:
            # exit
            if not nodes:
                return
            # grab a node, break its segment in two,
            # add those segments as children nodes,
            # if a child node has a segment greater than 1,
            # add if to the list of nodes,
            # if a child node has a segment equal to 1,
            # then it is a leaf node.
            node = nodes.pop(0)
            left, right = node.left_index, node.right_index
            middle = left + (right - left) // 2
            
            left_node = Node(left, middle, self.operation(self.sequence[left:middle]))
            node.left_node = left_node
            # only add an interval to be subdivided if it's larger than one
            if (middle-left) > 1:
                nodes.append(left_node)

            right_node = Node(middle, right, self.operation(self.sequence[middle:right]))
            node.right_node = right_node
            # only add an interval to be subdivided if it's larger than one
            if (right-middle) > 1:
                nodes.append(right_node)
    def _query(self, ptr, left, right):
        if ptr.left_node and ptr.left_node.right_index >= right:
            node = ptr.left_node
            return [(node, left, right)]
        elif ptr.right_node and ptr.right_node.left_index <= left:
            node = ptr.right_node
            return [(node, left, right)]
        elif ptr.left_node and ptr.right_node:
            result = []
            lnode = ptr.left_node
            rnode = ptr.right_node
            result.append((lnode, left, lnode.right_index))
            result.append((rnode, rnode.left_index, right))
            return result
        return []
    def query(self, left, right):
        if left == right:
            right += 1
        if left > right:
            left, right = right, left
        ptrs = [(self.root, left, right)]
        result = []
        while True:
            if len(ptrs) == 0:
                break
            ptr, left, right = ptrs.pop(0)
            if ptr.left_index == left and ptr.right_index == right:
                result.append(ptr)
            else:
                ptrs.extend(self._query(ptr, left, right))
        values = [node.value for node in result]
        return self.operation(values)
    def update(self, position, value):
        self.sequence[position] = value
        ptr = self.root
        while True:
            left = ptr.left_index
            right = ptr.right_index
            if left == position and right == position + 1:
                ptr.value = value
                return
            ptr.value = self.operation(self.sequence[left:right])
            middle = left + (right - left) // 2
            if position >= left and position < middle:
                ptr = ptr.left_node
            else:
                ptr = ptr.right_node
```

And then to use this and test the build and query functions,

```python
a = [1, 3, -2, 8, -7]
st = SegmentTree(a, sum)
st.build()

assert st.query(0,1) == 1
assert st.query(0,2) == 4
assert st.query(0,3) == 2
assert st.query(0,4) == 10
assert st.query(0,5) == 3

assert st.query(1,2) == 3
assert st.query(1,3) == 1
assert st.query(1,4) == 9
assert st.query(1,5) == 2

assert st.query(2,3) == -2
assert st.query(2,4) == 6
assert st.query(2,5) == -1

assert st.query(3,4) == 8
assert st.query(3,5) == 1

assert st.query(4,5) == -7
```

And to test the update function,


```python
a = [1, 3, -2, 8, -7]
st = SegmentTree(a, sum)
st.build()
st.update(1,2)

assert st.query(0,1) == 1
assert st.query(0,2) == 3
assert st.query(0,3) == 1
assert st.query(0,4) == 9
assert st.query(0,5) == 2

assert st.query(1,2) == 2
assert st.query(1,3) == 0
assert st.query(1,4) == 8
assert st.query(1,5) == 1

assert st.query(2,3) == -2
assert st.query(2,4) == 6
assert st.query(2,5) == -1

assert st.query(3,4) == 8
assert st.query(3,5) == 1

assert st.query(4,5) == -7
```