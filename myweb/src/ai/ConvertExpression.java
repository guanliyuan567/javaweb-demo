package ai;

import java.util.List;
import java.util.Stack;
/**后缀表达式->中缀表达式**/
public class ConvertExpression {
    private String root;
    private ConvertExpression left;
    private ConvertExpression right;
    public ConvertExpression(String root, ConvertExpression left, ConvertExpression right) {
        this.root = root;
        this.left = left;
        this.right = right;
    }

    public ConvertExpression(String root) {
        this(root,null,null);
    }

    //生成二叉树
    public static ConvertExpression genTreeFromSuffixExpression(List<String> exp) {
        Stack<ConvertExpression> S = new Stack<>();
        for (String tok : exp) {
            if (isNumber(tok)) {
                S.push(new ConvertExpression(tok));
            } else {
                ConvertExpression right = S.peek();
                S.pop();
                ConvertExpression left = S.peek();
                S.pop();
                S.push(new ConvertExpression(tok, left, right));
            }
        }
        return S.peek();
    }
    private static boolean isNumber(String tok) {
        try {
            Double.parseDouble(tok);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    //中序遍历输出（带括号）
    public void midVisit(StringBuffer buffer) {
        boolean isLeaf = (left == null && right == null);
        if (!isLeaf) buffer.append("(");
        if (left != null) {
            left.midVisit(buffer);
        }
        buffer.append(root);
        if (right != null) {
            right.midVisit(buffer);
        }
        if (!isLeaf) buffer.append(")");

    }
}
