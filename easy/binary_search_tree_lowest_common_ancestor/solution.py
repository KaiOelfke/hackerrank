#https://www.hackerrank.com/challenges/binary-search-tree-lowest-common-ancestor/problem
class Node:
    def __init__(self, info): 
        self.info = info  
        self.left = None  
        self.right = None 
        self.level = None 

    def __str__(self):
        return str(self.info) 

class BinarySearchTree:
    def __init__(self): 
        self.root = None

    def create(self, val):  
        if self.root == None:
            self.root = Node(val)
        else:
            current = self.root
         
            while True:
                if val < current.info:
                    if current.left:
                        current = current.left
                    else:
                        current.left = Node(val)
                        break
                elif val > current.info:
                    if current.right:
                        current = current.right
                    else:
                        current.right = Node(val)
                        break
                else:
                    break

# Enter your code here. Read input from STDIN. Print output to STDOUT
'''
class Node:
      def __init__(self,info): 
          self.info = info  
          self.left = None  
          self.right = None 
           

       // this is a node of the tree , which contains info as data, left , right
'''

def lca(root, v1, v2):
    one = [root]
    two = [root]
    tmp = root
    while tmp.info != v1:
        if v1 < tmp.info:
            tmp = tmp.left
        else:
            tmp = tmp.right
        one.append(tmp)    
    tmp = root
    while tmp.info != v2:
        if v2 < tmp.info:
            tmp = tmp.left
        else:
            tmp = tmp.right
        two.append(tmp)
    for i in range(0,len(one)):
        if len(two) <= i or one[i].info != two[i].info:
            return one[i-1]
    return one[-1]

tree = BinarySearchTree()
t = int(input())

arr = list(map(int, input().split()))

for i in range(t):
    tree.create(arr[i])

v = list(map(int, input().split()))

ans = lca(tree.root, v[0], v[1])
print (ans.info)
