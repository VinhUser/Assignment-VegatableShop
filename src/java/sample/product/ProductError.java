/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

/**
 *
 * @author ThienPN
 */
public class ProductError {
    private String productIDError;
    private String productNameError;
    private String priceError;
    private String quantityError;
    private String catagoryIDError;
    private String importDateError;
    private String usingDateError;
    private String statusError;

    public ProductError() {
        this.productIDError = "";
        this.productNameError = "";
        this.priceError = "";
        this.quantityError = "";
        this.catagoryIDError = "";
        this.importDateError = "";
        this.usingDateError = "";
        this.statusError = "";
    }

    public ProductError(String productIDError, String productNameError, String priceError, String quantityError, String catagoryIDError, String importDateError, String usingDateError, String statusError) {
        this.productIDError = productIDError;
        this.productNameError = productNameError;
        this.priceError = priceError;
        this.quantityError = quantityError;
        this.catagoryIDError = catagoryIDError;
        this.importDateError = importDateError;
        this.usingDateError = usingDateError;
        this.statusError = statusError;
    }

    public String getProductIDError() {
        return productIDError;
    }

    public void setProductIDError(String productIDError) {
        this.productIDError = productIDError;
    }

    public String getProductNameError() {
        return productNameError;
    }

    public void setProductNameError(String productNameError) {
        this.productNameError = productNameError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(String quantityError) {
        this.quantityError = quantityError;
    }

    public String getCatagoryIDError() {
        return catagoryIDError;
    }

    public void setCatagoryIDError(String catagoryIDError) {
        this.catagoryIDError = catagoryIDError;
    }

    public String getImportDateError() {
        return importDateError;
    }

    public void setImportDateError(String importDateError) {
        this.importDateError = importDateError;
    }

    public String getUsingDateError() {
        return usingDateError;
    }

    public void setUsingDateError(String usingDateError) {
        this.usingDateError = usingDateError;
    }

    public String getStatusError() {
        return statusError;
    }

    public void setStatusError(String statusError) {
        this.statusError = statusError;
    }

    public void getUsingDateError(String date_must_before_Today) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
