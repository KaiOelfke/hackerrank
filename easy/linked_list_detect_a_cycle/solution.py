#https://www.hackerrank.com/challenges/ctci-linked-list-cycle/problem
"""
Detect a cycle in a linked list. Note that the head pointer may be 'None' if the list is empty.

A Node is defined as: 
 
    class Node(object):
        def __init__(self, data = None, next_node = None):
            self.data = data
            self.next = next_node
"""


def has_cycle(head):
    if head.next == None:
      retFalsealse
    visited = dict()
    tmp = head
    while tmp.next != None:
      if tmp.next in visited:
        return True
      else:
        visited[tmp.next] = True
    return False
