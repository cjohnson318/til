# Segment Tree in 2D

First we define a Segment Tree for 1D data, I've added the methods `to_list()`
and `from_list()` to my initial take on a Segment Tree.

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
        self.root = self._build()
    def _build(self):
        nodes = []
        left, right = 0, len(self.sequence)
        root = Node(left, right, self.operation(self.sequence[left:right]))
        nodes.append(root)
        while True:
            # exit
            if not nodes:
                break
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
        return root
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
    def to_list(self):
        result = []
        nodes = [self.root]
        while True:
            if len(nodes) == 0:
                break
            node = nodes.pop(0)
            if node is None:
                continue
            result.append(node.value)
            nodes.append(node.left_node)
            nodes.append(node.right_node)
        return result
    def from_list(self, values):
        for i, value in enumerate(values):
            self.update(i, value)
    def __repr__(self):
        return str(self.to_list())
```

Some tests.

```python
a = [1, 3, -2, 8, -7]
st = SegmentTree(a, sum)

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

Then we degine a 2D Segment Tree for a grid of data. I don't *love* this code,
but it passed my tests and I haven't refactored it yet.

The basic idea is that, in a 2D segment tree, **instead of the value of a node
being the sum of the segment, we have another segment tree.**

```python
class SegmentGrid:
    def __init__(self, grid, operation):
        self.grid = grid
        self.N = len(self.grid[0])
        self.operation = operation
        self.root = self._build()
    def _add(self, a, b):
        result = []
        for i in range(len(a)):
            result.append(a[i] + b[i])
        return result
    def _build(self):
        nodes = []
        for i, row in enumerate(self.grid):
            st = SegmentTree(row, self.operation)
            node = Node(i, i+1, st)
            nodes.append(node)
        while True:
            if len(nodes) == 1:
                return nodes[0]
            if len(nodes) > 0:
                left = nodes.pop(0)
            else:
                return None
            if len(nodes) > 0:
                right = nodes.pop(0)
            else:
                right = [0] * self.N
            node = Node(left.left_index, right.right_index, SegmentTree([0] * self.N, self.operation))
            left_list = left.value.to_list()[-self.N:]
            right_list = right.value.to_list()[-self.N:]
            node.value.from_list(self._add(left_list, right_list))
            node.left_node = left
            node.right_node = right
            nodes.append(node)
    def __repr__(self):
        return self.root.__repr__()
    def _rquery(self, ptr, left, right):
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
    def rquery(self, left, right):
        ptrs = [(self.root, left, right)]
        result = []
        while True:
            ic(ptrs)
            if len(ptrs) == 0:
                break
            ptr, left, right = ptrs.pop(0)
            if ptr.left_index == left and ptr.right_index == right:
                result.append(ptr)
            else:
                ptrs.extend(self._rquery(ptr, left, right))
        print(result)
        values = [node.value for node in result]
        return values
    def query(self, r1, r2, c1, c2):
        rows = self.rquery(r1, r2)
        tmp = [0] * self.N
        for row in rows:
            tmp = self._add(tmp, row.to_list()[-self.N:])
        cols = SegmentTree(tmp, self.operation)
        print(cols)
        return cols.query(c1, c2)
```

Some tests.

```python
a = [
    [1, 2, 3, 4], 
    [5, 6, 7, 8],
    [1, 7, 5, 9],
    [3, 0, 6, 2],
]

sg = SegmentGrid(a, sum)

assert sg.query(1, 3, 1, 3) == 25
assert sg.query(2, 4, 0, 2) == 11
```