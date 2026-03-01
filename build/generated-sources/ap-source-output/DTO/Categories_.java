package DTO;

import DTO.Products;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2026-03-01T15:10:55")
@StaticMetamodel(Categories.class)
public class Categories_ { 

    public static volatile ListAttribute<Categories, Products> productsList;
    public static volatile SingularAttribute<Categories, String> memo;
    public static volatile SingularAttribute<Categories, Integer> typeId;
    public static volatile SingularAttribute<Categories, String> categoryName;

}