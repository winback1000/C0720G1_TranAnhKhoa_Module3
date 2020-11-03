package models;

public class Calculator {
    public Calculator() {
    }
    public float plus(float num1, float num2) {
        return num1+num2;
    }
    public float minus(float num1, float num2) {
        return num1-num2;
    }
    public float multiple(float num1, float num2) {
        return num1*num2;
    }
    public float division(float num1, float num2) {
        if(num2 == 0) {
            throw new ArithmeticException();
        } else {
            return num1/num2;
        }
    }
}
