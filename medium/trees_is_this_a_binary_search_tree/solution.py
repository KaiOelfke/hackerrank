#https://www.hackerrank.com/challenges/ctci-is-binary-search-tree/problem

def inorderr(root):
  io = list()
  if root.left != None:
    io = inorderr(root.left)
  io = io + [root.data]
  if root.right != None:
    io = io + inorderr(root.right)
  return io

def checkBST(root):
  io = inorderr(root)
  prev = io[0]
  for x in io[1:]:
    if prev >= x:
      return False
    prev = x
  return True  
  
  
  
  """
  if root == None:
    return True
  if root.left != None && root.left > root.data:
    return False
  else:
  if root.right != None && root.right < root.data:
    return False
  else:
  return True
  """