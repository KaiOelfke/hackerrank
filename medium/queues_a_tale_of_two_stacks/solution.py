#https://www.hackerrank.com/challenges/ctci-queue-using-two-stacks/problem
class MyQueue(object):
    def __init__(self):
        self.putstack = list()
        self.popstack = list()
    
    def peek(self):
        if len(self.popstack) == 0:
            for i in range(len(self.putstack)):
                self.popstack.append(self.putstack.pop())
        a = self.popstack.pop()
        self.popstack.append(a)
        return a
        
    def pop(self):
        if len(self.popstack) == 0:
            for i in range(len(self.putstack)):
                self.popstack.append(self.putstack.pop())
        return self.popstack.pop()
        
    def put(self, value):
        self.putstack.append(value)

queue = MyQueue()
t = int(input())
for line in range(t):
    values = map(int, input().split())
    values = list(values)
    if values[0] == 1:
        queue.put(values[1])        
    elif values[0] == 2:
        queue.pop()
    else:
        print(queue.peek())

