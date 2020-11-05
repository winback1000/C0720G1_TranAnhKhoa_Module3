package models;

public class Product {
    private String name;
    private String manufacturer;
    private String image;
    private double price;
    private int stock;
    private int id;

    public Product(int id, String name, String manufacturer, String image, double price, int stock) {
        this.id = id;
        this.name = name;
        this.manufacturer = manufacturer;
        this.image = image;
        this.price = price;
        this.stock = stock;
    }

    public Product(String name, String manufacturer, String image, double price, int stock) {
        this.name = name;
        this.manufacturer = manufacturer;
        this.image = image;
        this.price = price;
        this.stock = stock;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
