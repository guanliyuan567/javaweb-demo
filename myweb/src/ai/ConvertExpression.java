package ai;

import java.util.Stack;

public class ConvertExpression {
    static String expression ="asd+x/g-*";
    static Stack stack = new Stack();
    public static void main(String[] args) {
        Tree tree = createTree(expression);
        LDRTree(tree.root);//中序遍历
    }
    private static void LDRTree(Node node) {
        Node currentNode = node;
        if (currentNode != null) {
            LDRTree(currentNode.left);
            System.out.print(node.element);
            LDRTree(currentNode.right);
        }
    }
    // 把后缀表达式转化为一颗树
    private static Tree createTree(String expression) {
        for (int i = 0; i < expression.length(); i++) {
            char ch = expression.charAt(i);
            if (ch != '+' && ch != '-' && ch != '*' && ch != '/') {
                Node node = new Node(ch);
                stack.push(node);
            } else {
                Node node = new Node(ch);
                Node rightNode = (Node)stack.pop();
                Node leftNode = (Node)stack.pop();
                node.setLeftChild(leftNode);
                node.setRightChild(rightNode);
                stack.push(node);
            }
        }
        return new Tree((Node) stack.pop());
    }
}
class Node {
    char element;
    Node left;
    Node right;
    Node(char element) {
        this.element = element;
    }
    void setLeftChild(Node leftChild) { this.left = leftChild; }
    void setRightChild(Node rightChild) { this.right = rightChild; }
}
class Tree {
    Node root;
    Tree(Node root) { this.root = root;}
}
