package DTO;

import DTO.Accounts;
import DTO.Categories;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2026-03-01T15:10:55")
@StaticMetamodel(Products.class)
public class Products_ { 

    public static volatile SingularAttribute<Products, String> brief;
    public static volatile SingularAttribute<Products, String> unit;
    public static volatile SingularAttribute<Products, String> productImage;
    public static volatile SingularAttribute<Products, String> productId;
    public static volatile SingularAttribute<Products, Integer> price;
    public static volatile SingularAttribute<Products, Integer> discount;
    public static volatile SingularAttribute<Products, Categories> typeId;
    public static volatile SingularAttribute<Products, String> productName;
    public static volatile SingularAttribute<Products, Accounts> account;
    public static volatile SingularAttribute<Products, Date> postedDate;

}